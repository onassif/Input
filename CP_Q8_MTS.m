%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
coor = [...
    0 0 0 
    1 0 0
    1 1 0
    0 1 0
    0 0 1
    1 0 1
    1 1 1
    0 1 1];

BC_T = {...
    'x', 0, 'u', 0
    'y', 0, 'v', 0
    'z', 0, 'w', 0
    'z', 1, 'w', 0
    'node', 2, 'u', 0.002
    'node', 6, 'u', 0.002
    'node', 4, 'u', 0.0022
    'node', 8, 'u', 0.0022
};

FRCE = {'x', 0, 'u', 0};
% FRCE = {...
%     'x', 1, 'u', -1000
%     'y', 5, 'v', -4000};
% fctr_FRCE=[...
%     1 1
%     1 0];

time =[6 3];


% fctr(1:size(fctr_BC  ,1),1:size(fctr_BC  ,2),1) =fctr_BC;
% fctr(1:size(fctr_FRCE,1),1:size(fctr_FRCE,2),2) =fctr_FRCE;


NR_tol = 1e-9;%1e-11;
max_iter = 12;%20
n_steps = sum(time(:,2));
total_time= time(end,1);
eltype = 'Q8Crys';
plot = false;


[nodes, elements, nen, ngp, numnp, numel, ndm, BC, FORCE] =...
    Generate_mesh(eltype, coor, BC_T, FRCE, plot, 4, 1, 1);
nummat = 1;
material = 7;
props = {...
    'E'    , 12000
    'nu'   , 0.3
    'beta' , 0.1
    'Hp'   , 1000
    'Y'    , inf};

AlgoType = [11; 1; 0];
OptFlag = [0 1 1 0 0 1 1 0]';
SEHist = 1;

hardType='MTS';
hardProps={...
    'tau_a'          , 0
    'tau_ht_y'       , 155
    'g0_y'           , 0.007808 
    'q_y'            , 2.0
    'p_y'            , 0.5
    'eps0_dt_y'      , 1e13
    'tau_ht_v'       , 25
    'g0_v'           , 0.00488
    'q_v'            , 2.0
    'p_v'            , 0.5
    'eps0_dt_v'      , 1e7    
    'k0'             , 10
    'boltz'          , 1.3806e-20
    'b'              , 3.5e-7
    'theta0'         , 180
    'mu0'            , 29628.3
    'D0'             , 0
    't0'             , 204
    'hardenExp'      , 20
    'E'              , 78811.2
    'nu'             , 0.33
    'voche_m'        , 1
    'elasticType'    , 'isotropic'
    'numCrystals'    , 1
    'angleConvention', 'kocks'
    'angleType'      , 'degrees'
    'angles'         , [45.0 0.0 30.0]'
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