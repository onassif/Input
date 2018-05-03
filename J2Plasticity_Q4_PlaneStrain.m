%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
coor = [...
    0 0
    1 0
    1 1
    0 1];

BC_T = {...
    'x', 0, 'u', 0
    'y', 0, 'v', 0
    'x', 1, 'u', 0.05
};
% fctr_BC  =[...
%     1 1
%     1 1];

FRCE = {'x', 0, 'u', 0};
% FRCE = {...
%     'x', 1, 'u', -1000
%     'y', 5, 'v', -4000};
% fctr_FRCE=[...
%     1 1
%     1 0];

time =[1 100];

% fctr(1:size(fctr_BC  ,1),1:size(fctr_BC  ,2),1) =fctr_BC;
% fctr(1:size(fctr_FRCE,1),1:size(fctr_FRCE,2),2) =fctr_FRCE;


NR_tol = 1e-10;%1e-11;
max_iter = 5000;%20
n_steps = sum(time(:,2));
total_time= time(end,1);
eltype = 'Q4';
plot = false;


[nodes, elements, nen, ngp, numnp, numel, ndm, BC, FORCE] =...
    Generate_mesh(eltype, coor, BC_T, FRCE, plot, 1, 1, 1);
nummat = 1;
material = 5; % RI Plastic planestrain
props = {...
    'E'   , 12000
    'v'   , 0.3
    'K'   , 1000
    'H'   , 3
    'Y'   , 100};

    
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
