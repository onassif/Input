    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start

coor = [...
    0 0
    1 0
    1 1
    0 1];
    
    BC_T = {'x', 0, 'u', 0
            'y', 0, 'v', 0}; 
        
    FORCE_Tx = {
       'x', 1, 'u', 40
       'y', 1, 'v', 40};       
         
    NR_tol = 1e-10;%1e-11;
    max_iter = 100;%20
    n_steps = 1;
    eltype = 'Q4';
    plot = 1;
    

    [nodes, elements, nen, ngp, numnp, numel, ndm] = generateMesh(eltype, coor, plot, 3, 3, 1);
    [BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);

    nummat = 1;
    material = 1; % PlaneStrain
    props = {...
        'E', 190e3
        'v', 0.3};
    
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
