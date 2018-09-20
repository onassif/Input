    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start

coor = [...
    0  0
    40 0
    40 20
    0  20];
    
    BC_T = {...
       'node', 1, 'v', 0
       'node', 2, 'u', 0
       'node', 2, 'v', 0}; 
        
%     FORCE_Tx = {'y', 20, 'v', -0.2};    
    FORCE_Tx = {...
       'node', 3, 'v', -4
       'node', 4, 'v', -4}; 
         
    NR_tol = 1e-10;%1e-11;
    max_iter = 100;%20
    n_steps = 1;
    eltype = 'T3';
    plot = 1;
    

    [nodes, elements, nen, ngp, numnp, numel, ndm] =...
        generateMesh(eltype, coor, plot, 1, 1, 1);
    [BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);

    nummat = 1;
    material = 1; % PlaneStrain
    props = {...
        'E', 1e6
        'v', 0.25};
    
    ndof = 2;
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
