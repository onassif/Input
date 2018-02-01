%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
coor = [...
    0 0 
    1 0 
    1 1 
    0 1 ];

BC_T = {...
    'x', 0, 'u', 0
    'y', 0, 'v', 0};

FORCE_Tx = {'x', 1, 'u', 1.0*40};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 60;
total_time= 3;
eltype = 'Q4';
plot = true;


[nodes, elements, nen, ngp, numnp, numel, ndm, BC, FORCE] =...
    Generate_mesh(eltype, coor, BC_T, FORCE_Tx, plot, 1, 1);
nummat = 1;
material = 4; % Elastic 3D
    props = {'E'     ,12000
             'v'     ,0.3
             'K'     ,90000
             'H'     ,100
             'yield' ,300};

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
%              'yield' ,<yield stress>};
%              
