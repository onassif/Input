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
eltype = 'T3';
plot = 0;


[nodes, ~, nen, ngp, ~, numel, ndm] = generateMesh(eltype, coor, plot, 2, 1, 1);

nodes = [nodes; 1 0; 1 1];
elements = [...
   1 2 4 1
   2 5 4 1
   7 3 8 1
   3 6 8 1
   8 7 3 2
   2 5 4 2];
numnp  = size(nodes,1);
nel = size(elements,1);
[BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, nel);

material = [...
   1
   8];
props = {...
   {'E', 190e3; 'nu', 0.3}
   {'L', 1; 'R', 1}};

ndof = 2;
numeq = ndof*numnp;
