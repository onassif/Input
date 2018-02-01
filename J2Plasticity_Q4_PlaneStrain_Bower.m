%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
coor = [...
    0 0 
    1 0 
    1 1 
    0 1 ];

BC_T = {...
    'x', 0, 'u', 0
    'y', 0, 'v', 0};

FORCE_Tx = {'x', 1, 'u', 20};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 10;
total_time= 2;
eltype = 'Q4';
plot = false;


[nodes, elements, nen, ngp, numnp, numel, ndm, BC, FORCE] =...
    Generate_mesh(eltype, coor, BC_T, FORCE_Tx, plot, 2, 2);
nummat = 1;
material = 4; % Plastic planestrain
    props = {'E'   , 10000
             'v'   , 0.3
             'K'   , 10
             'H'   , 10
             'Y'   , 15
             'e0'  , 0.5
             'edot', 0.1};

ndof = 2;
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
%              
