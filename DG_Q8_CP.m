%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
BC_T = {...
'node', 1,	'u', 0
'node', 1,	'v', 0
'node', 1,	'w', 0
'node', 2,	'w', 0
'node', 9,	'w', 0.008
'node', 10,	'w', 0.008
'node', 3,	'w', 0
'node', 3,	'u', 0
'node', 4,	'w', 0
'node', 11,	'w', 0.008
'node', 12,	'w', 0.008};

FORCE_Tx = {'node', 1, 'u', 0};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 2;
eltype = 'Q8';
ndm = 3;
ngp = 8;
nen = 8;
plot = 0;

nodes = [...
0	1	0	1	0	1	0	1	0	1	0	1	0	1	0	1
0	0	1	1	0	0	1	1	0	0	1	1	0	0	1	1
0	0	0	0	1	1	1	1	2	2	2	2	1	1	1	1]';

elements = [...
1	2	4	3	5	6	8	7	0	0	0	0	0	0	0	0	1
13	14	16	15	9	10	12	11	0	0	0	0	0	0	0	0	1
13	14	16	15	9	10	12	11	5	7	8	6	1	3	4	2	2];
numnp  = size(nodes,1);
numel = 2;
[BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);

material = [...
   7
   10];
props = {...
   {'E', 78811.2; 'nu', 0.33}
   {'L', 1; 'R', 1}};
cpType='MTS';
hardProps={...
    'tau_a'       , 0
    'tau_ht_y'    , 155
    'g0_y'        , 0.007808 
    'q_y'         , 2.0
    'p_y'         , 0.5
    'eps0_dt_y'   , 1e13
    'tau_ht_v'    , 25
    'g0_v'        , 0.00488
    'q_v'         , 2.0
    'p_v'         , 0.5
    'eps0_dt_v'   , 1e7    
    'k0'          , 10
    'boltz'       , 1.3806e-20
    'b'           , 3.5e-7
    'theta0'      , 180
    'mu0'         , 29628.3
    'D0'          , 0
    't0'          , 204
    'hardenExp'   , 20
    'E'           , 78811.2
    'nu'          , 0.33
    'voche_m'     , 1
    'elasticType' , 'isotropic'
    'numCrystals' , 1
    };
 angles = {...
    'angleConv'   , 'kocks'
    'angleType'   , 'degrees'
    'angles'      , [0.0 0.0 0.0]'
    };
 slipType = 'fcc';
time =[3 3];

ndof = 3;
numeq = ndof*numnp;
extrapolate = 1;