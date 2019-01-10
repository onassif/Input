%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start

BC_T = {...
   'x', 0, 'u', 0
   'y', 0, 'v', 0};
P = 40;
FORCE_Tx = {...
   'node',  8, 'u', P
   'node', 10, 'u', P};
% FORCE_Tx = {'x',  0, 'u', 0};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 4;
eltype = 'Q4';
ndm = 2;
ngp = 4;
nen = 4;
plot = 0;

nodes = [...
   0 0
   1 0
   0 1/3
   1 1/3
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
numnp = size(nodes,1);
numel = 3;
[BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);

material = [...
   3
   3
   9];
props = {...
   {'E', 100; 'nu', 0.25}
   {'E', 100; 'nu', 0.25}
   {'L', 2; 'R', 1}};

ndof = 2;
numeq = ndof*numnp;