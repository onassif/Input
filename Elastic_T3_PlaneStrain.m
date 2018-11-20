    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start

coor = [...
    0 0
    4 0
    4 2
    0 2];
    
    BC_T = {...
       'x', 0, 'u', 0
       'y', 0, 'v', 0}; 
        
%     FORCE_Tx = {'y', 20, 'v', -0.2};    
    FORCE_Tx = {...
       'y', 2, 'v', -10
       'y', 2, 'v', -10}; 
         
    NR_tol = 1e-10;%1e-11;
    max_iter = 100;%20
    n_steps = 1;
    eltype = 'T3';
    plot = 0;
    

    [nodes, elements, nen, ngp, numnp, numel, ndm] = generateMesh(eltype, coor, plot, 3, 2, 1);
    [BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);

    nummat = 1;
    material = 1; % PlaneStrain
    props = {...
        'E', 200
        'nu', 0.25};
    
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
