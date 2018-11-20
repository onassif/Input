%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start

BC_T = {...
   'x', 0, 'u', 0
   'y', 0, 'v', 0
   'z', 0, 'w', 0};
P = 40;
FORCE_Tx = {...
   'node', 13, 'w', P
   'node', 14, 'w', P
   'node', 15, 'w', P
   'node', 16, 'w', P
   };

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 4;
eltype = 'Q8';
ndm = 3;
ngp = 8;
nen = 8;
plot = 0;

nodes = [...
0	0	0
1	0	0
1	1	0
0	1	0
0	0	1
1	0	1-sqrt(1/3)
1	1	1-sqrt(1/3)
0	1	1
0	0	1
1	0	1-sqrt(1/3)
1	1	1-sqrt(1/3)
0	1	1
0	0	2
1	0	2
1	1	2
0	1	2];
elements = [...
1  2	3	4	5	6	7	8  0  0  0  0  0  0  0  0  1
9  10	11	12	13	14	15	16 0  0  0  0  0  0  0  0  2
8	7	6	5	4	3	2	1	12	9	10	11	16	13	14	15 3];
   
numnp  = size(nodes,1);
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

ndof = 3;
numeq = ndof*numnp;
