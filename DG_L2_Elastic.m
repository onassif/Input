%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
nodes = [...
    0
    1
    1
    2];

elements = [...
   1 2 0 0 1   
   2 3 0 0 1
   2 1 3 4 2];

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 1;
eltype = 'L2';
plot = 0;

numnp  = 4;
nen = 2;
ngp = 2;
numel = 2;
ndm = 1;

BC    = [1 1 0 1];
FORCE = [4 1 2 2];

material = [...
   1
   1
   8];
props = {...
   {'E', 190e3; 'nu', 0.3}
   {'E', 190e3; 'nu', 0.3}
   {'L', 2; 'R', 1}};

ndof = 1;
numeq = ndof*numnp;