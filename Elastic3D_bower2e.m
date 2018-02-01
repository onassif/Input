%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
coor = [...
    0  0.0 0
    2  0.0 0
    2  1.0 0
    0  1.0 0
    0  0.0 1
    2  0.0 1
    2  1.0 1
    0  1.0 1];

BC_T = {...
    'x',    0, 'u', 0
    'y',  0.0, 'v', 0
    'z',    0, 'w', 0};

FORCE_Tx = {'x', 2, 'u', 1.0*10};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 1;
eltype = 'Q8';
plot = true;


[nodes, elements, nen, ngp, numnp, numel, ndm, BC, FORCE] =...
    Generate_mesh(eltype, coor, BC_T, FORCE_Tx, plot, 2, 1, 1);
nummat = 1;
material = 1; % Elastic 3D
props = {...
    'E', 200
    'v', 0.25};

ndof = 3;
numeq = ndof*numnp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input End

%     options for props (substitute what's inside < > with a numeric value):
%     material 1:
%     props = {'E',<young's modulus>
%              'v',<poisson's ratio>}

%     material 2:
%     props = {'E',<young's modulus>
%              'v',<poisson's ratio>}

%     material 3:
%     props = {'mu'     ,  <mu's value>
%              'lambda' ,  <lambda's value>};
