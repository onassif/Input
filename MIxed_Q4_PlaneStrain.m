%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 1;
eltype = 'Q4';
plot = false;

nummat = 1;
material = 6; % PlaneStrain
props = {...
    'E', 2.998
    'v', 0.499};

nodes=[...
    0.00	1.00
    0.20	0.98
    0.38	0.92
    0.56	0.83
    0.71	0.71
    0.83	0.56
    0.92	0.38
    0.98	0.20
    1.00	0.00
    0.00	1.75
    0.34	1.72
    0.67	1.62
    0.97	1.46
    1.24	1.24
    1.46	0.97
    1.62	0.67
    1.72	0.34
    1.75	0.00
    0.00	2.50
    0.49	2.45
    0.96	2.31
    1.39	2.08
    1.77	1.77
    2.08	1.39
    2.31	0.96
    2.45	0.49
    2.50	0.00
    0.00	3.25
    0.63	3.19
    1.24	3.00
    1.81	2.70
    2.30	2.30
    2.70	1.81
    3.00	1.24
    3.19	0.63
    3.25	0.00
    0.00	4.00
    0.78	3.92
    1.53	3.70
    2.22	3.33
    2.83	2.83
    3.33	2.22
    3.70	1.53
    3.92	0.78
    4.00	0.00];

elements=[...
    1	2	11	10  1
    2	3	12	11  1
    3	4	13	12  1
    4	5	14	13  1
    5	6	15	14  1
    6	7	16	15  1
    7	8	17	16  1
    8	9	18	17  1
    10	11	20	19  1
    11	12	21	20  1
    12	13	22	21  1
    13	14	23	22  1
    14	15	24	23  1
    15	16	25	24  1
    16	17	26	25  1
    17	18	27	26  1
    19	20	29	28  1
    20	21	30	29  1
    21	22	31	30  1
    22	23	32	31  1
    23	24	33	32  1
    24	25	34	33  1
    25	26	35	34  1
    26	27	36	35  1
    28	29	38	37  1
    29	30	39	38  1
    30	31	40	39  1
    31	32	41	40  1
    32	33	42	41  1
    33	34	43	42  1
    34	35	44	43  1
    35	36	45	44  1];

ndof  =  3;
nen   =  4;
ngp   =  4;
numnp = 45;
numel = 32;
ndm   =  2;
numeq = (ndof-1)*numnp+numel;
BC=[...
    1    1  0.0 1
    10   1  0.0 2
    19   1  0.0 3
    28   1  0.0 4
    37   1  0.0 5
    9    2  0.0 6
    18   2  0.0 7
    27   2  0.0 8
    36   2  0.0 9
    45   2  0.0 10];

FORCE=[...
    2 1  0.03738942 1
    3 1  0.07497220 2
    4 1  0.10836487 3
    5 1  0.13517671 4
    6 1  0.16298684 5
    7 1  0.17952495 6
    8 1  0.19079816 7
    9 1  0.10001483 8
    
    1 2  0.10001483 9
    2 2  0.19079816 10
    3 2  0.17952495 11
    4 2  0.16298684 12
    5 2  0.13517671 13
    6 2  0.10836487 14
    7 2  0.07497220 15
    8 2  0.03738942 16
    ];
if plot
    figure('Position',[100,50,1200,700]);
    patch(...
        reshape(nodes(elements(:,1:nen)',1),nen,numel),...
        reshape(nodes(elements(:,1:nen)',2),nen,numel),'r',...
        'FaceColor','none','EdgeColor','r', 'Marker', 'o', 'MarkerFaceColor', 'r');
    axis equal
    hold on
    
    
    for i=1:numel
        text(mean([nodes(elements(i,1),1),nodes(elements(i,2),1)]),...
            mean([nodes(elements(i,2),2),nodes(elements(i,3),2)]),num2str(i));
    end
end
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
