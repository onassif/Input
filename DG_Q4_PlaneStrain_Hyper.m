%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
BC_T = {...
   'x', 0, 'u', 0
   'y', 0, 'v', 0};
P = 40;
FORCE_Tx = {...
   'node', 6, 'u', P
   'node', 7, 'u', P};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 4;
eltype = 'Q4';
ndm = 2;
ngp = 4;
nen = 4;
plot = 0;

nodes = [...
   0	0
   1	0
   1	1
   0	1
   1	0
   2	0
   2	1
   1	1];
elements = [...
1	2	3	4	0	0	0	0  1
5	6	7	8	0	0	0	0  2
8	5	6	7	2	3	4	1  3];
numnp  = 8;
numel = 2;
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
