%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
coor = [...
   0 0 0
   1 0 0
   0 1 0
   1 1 0
   0 0 1
   1 0 1
   0 1 1
   1 1 1];

BC_T = {'x', 0, 'u', 0
   'y', 0, 'v', 0
   'z', 0, 'w', 0};
P = 40;
FORCE_Tx = {...
   'x', 1, 'u', P};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 10;
eltype = 'Q8';
plot = false;


[nodes, elements, nen, ngp, numnp, numel, ndm] = generateMesh(eltype, coor, plot, 7, 7, 7);
% [BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);
bx = find(abs(nodes(:,1) - 0) <1e-8);
by = find(abs(nodes(:,2) - 0) <1e-8);
bz = find(abs(nodes(:,3) - 0) <1e-8);

BC = [...
   bx 1*ones(length(bx),1) zeros(length(bx),1) 1*ones(length(bx),1)
   by 2*ones(length(by),1) zeros(length(by),1) 2*ones(length(by),1)
   bz 3*ones(length(bz),1) zeros(length(bz),1) 3*ones(length(bz),1)];

c1 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,2)-0)<1e-9 & abs(nodes(:,3)-0)<1e-9;
c2 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,2)-1)<1e-9 & abs(nodes(:,3)-0)<1e-9;
c3 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,2)-0)<1e-9 & abs(nodes(:,3)-1)<1e-9;
c4 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,2)-1)<1e-9 & abs(nodes(:,3)-1)<1e-9;
e1 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,2)-1)<1e-9 & ~c1 & ~c2 & ~c3 & ~c4;
e2 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,2)-0)<1e-9 & ~c1 & ~c2 & ~c3 & ~c4;
e3 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,3)-1)<1e-9 & ~c1 & ~c2 & ~c3 & ~c4;
e4 = abs(nodes(:,1)-1)<1e-9 & abs(nodes(:,3)-0)<1e-9 & ~c1 & ~c2 & ~c3 & ~c4;
b = find(abs(nodes(:,1)-1) <1e-9 & ~c1 & ~c2 & ~c3 & ~c4 & ~e1 & ~e2 & ~e3 & ~e4);
c1 = find(c1); c2 = find(c2); c3 = find(c3); c4 = find(c4);
e1 = find(e1); e2 = find(e2); e3 = find(e3); e4 = find(e4);
fctr = 40 / (4*length(b) + 2*length([e1;e2;e3;e4]) + 4);

FORCE = [...
   b  ones(length(b),1)  4*fctr*ones(length(b),1)  ones(length(b),1)
   e1 ones(length(e1),1) 2*fctr*ones(length(e1),1) ones(length(e1),1)
   e2 ones(length(e2),1) 2*fctr*ones(length(e2),1) ones(length(e2),1)
   e3 ones(length(e3),1) 2*fctr*ones(length(e3),1) ones(length(e3),1)
   e4 ones(length(e4),1) 2*fctr*ones(length(e4),1) ones(length(e4),1)
   c1 1 fctr 1
   c2 1 fctr 1
   c3 1 fctr 1
   c4 1 fctr 1];

nummat = 1;
material = 3; % HyperElasticNew
props = {...
   'E'  , 100
   'nu' , .25};

ndof = 3;
numeq = ndof*numnp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input End

