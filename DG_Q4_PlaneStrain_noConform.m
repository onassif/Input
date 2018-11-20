%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
nodes = [...
   0 0
   1 0
   0 1/2
   1 1/2
   0 1
   1 1
   1 0
   2 0
   1 1
   2 1];

elements = [...
   1	2	4	3	0	0	0	0  1
   3	4	6	5	0	0	0	0  1
   7	8	10	9	0	0	0	0  2
   2	4	3	1  9  7  8  10 3
   4  6  5  3  9  7  8  10 3];

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
ndm = 2;
numnp = size(nodes,1);
numel = 3;
ngp = 4;
nen = 4;
[BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);

material = [...
   1
   1
   8];
props = {...
   {'E', 190e3; 'nu', 0.3}
   {'E', 190e3; 'nu', 0.3}
   {'L', 2; 'R', 1}};

ndof = 2;
numeq = ndof*numnp;
% PlotMesh(eltype, nodes, elements, nen, numel)