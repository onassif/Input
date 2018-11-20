%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
nodes = [...
    0
    1];
 elements = [1 2 1];

BC_T = {...
    'node', 0, 'u', 0};
P = 2;
FORCE_Tx = {...
   'node', 1, 'u', P};

% FORCE_Tx = {...
%     'x', 1, 'u', 1.0*40
%     'node', 3, 'v', 10
%     'node', 4, 'v', 10
%     'node', 7, 'v', 10
%     'node', 8, 'v', 10
%    'z', 1, 'w', 1.0*40};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 1;
eltype = 'L2';
plot = false;
ndm = 1;
numel = 1;
numnp = 2;
ngp = 2;
nen = 2;

% [nodes, elements, nen, ngp, numnp, numel, ndm] = generateMesh(eltype, coor, plot, 2, 1, 1);
% [BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);
BC    = [1 1 0 1];
FORCE = [2 1 P 2];
nummat = 1;
material = 1; % Elastic 3D
props = {...
    'E' , 200
    'nu', 0.25};

ndof = 1;
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
