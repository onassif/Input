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

BC_T = {...
    'x'   , 0, 'u', 0
    'node', 1, 'v', 0
    'node', 5, 'v', 0
    'z'   , 0, 'w', 0
    'z'   , 1, 'w', 0
    'y'   , 0, 'u', 0.012
    'y'   , 1, 'u', 0.0132
};

FRCE = {'x', 0, 'u', 0};

time =[3 3];


% fctr(1:size(fctr_BC  ,1),1:size(fctr_BC  ,2),1) =fctr_BC;
% fctr(1:size(fctr_FRCE,1),1:size(fctr_FRCE,2),2) =fctr_FRCE;
extrapolate = 1;


NR_tol = 10e-11;%1e-11;
max_iter = 40;%20
n_steps = sum(time(:,2));
total_time= time(end,1);
eltype = 'Q8';
plot = false;


[nodes, elements, nen, ngp, numnp, numel, ndm] = generateMesh(eltype, coor, plot, 1, 1, 1);
[BC, FORCE] = generateBC(BC_T, FRCE, nodes, elements, eltype, ndm, numnp, numel);

nummat = 1;
material = 11;
props = {...
    'E'    , 78811.2
    'nu'   , 0.33};

AlgoType = [11; 1; 0];
OptFlag = [0 1 1 0 0 1 1 0]';
SEHist = 1;

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
    'angles'      , [45.0 0.0 30.0]'
    };
 slipType = 'fcc';

ndof = 3;
numeq = ndof*numnp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input End

%     options for props (substitute what's inside < > with a numeric value):
%     material 1:
%     props = {'E',<young's modulus>
%              'v',<poisson's ratio>};

%     material 2:
%     props = {'E',<young's modulus>
%              'v',<poisson's ratio>};

%     material 3:
%     props = {'mu'     ,  <mu's value>
%              'lambda' ,  <lambda's value>};

%     material 4:
%     props = {'E'     ,<young's modulus>
%              'v'     ,<poisson's ratio>
%              'K'     ,<Isoparametric modulus>
%              'H'     ,<Kinematic modulus>
%              'Y'     ,<yield stress>};       