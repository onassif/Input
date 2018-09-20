%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
coor = [...
    0 0
    2 0
    2 1
    0 1];

BC_T = {...
    'x', 0, 'u', 0
    'y', 0, 'v', 0
    'x', 2, 'u', 0.1};

FORCE_Tx = {'x', 0, 'u', 0};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 1;
eltype = 'Q4';
plot = 0;


[nodes, ~, nen, ngp, ~, numel, ndm] = generateMesh(eltype, coor, plot, 2, 1, 1);

nodes = [nodes; 1 0; 1 1];
elements = [...
   1 2 5 4 0 0 0 0 1   
   7 3 6 8 0 0 0 0 2
   8 7 3 6 2 5 4 1 3];
numnp  = 8;
nel = 3;
[BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);

material = [...
   1
   1
   8];
props = {...
   {'E', 190e3; 'v', 0.3}
   {'E', 190e3; 'v', 0.3}
   {'L', 2; 'R', 1}};

ndof = 2;
numeq = ndof*numnp;
