   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 1;
eltype = 'T6';
plot = true;

nummat = 1;
material = 6; % mixed_planestrain
props = {...
    'E', 2.998
    'v', 0.499};

nodes=[...
   0.00000000000000	1.00000000000000
   0.19509032201613	0.98078528040323
   0.38268343236509	0.92387953251129
   0.55557023301960	0.83146961230255
   0.70710678118655	0.70710678118655
   0.83146961230255	0.55557023301960
   0.92387953251129	0.38268343236509
   0.98078528040323	0.19509032201613
   1.00000000000000	0.00000000000000
   0.00000000000000	1.75000000000000
   0.34140806352823	1.71637424070565
   0.66969600663891	1.61678918189475
   0.97224790778430	1.45507182152945
   1.23743686707646	1.23743686707646
   1.45507182152945	0.97224790778430
   1.61678918189475	0.66969600663891
   1.71637424070565	0.34140806352822
   1.75000000000000	0.00000000000000
   0.00000000000000	2.50000000000000
   0.48772580504032	2.45196320100808
   0.95670858091273	2.30969883127822
   1.38892558254901	2.07867403075636
   1.76776695296637	1.76776695296637
   2.07867403075636	1.38892558254901
   2.30969883127822	0.95670858091272
   2.45196320100808	0.48772580504032
   2.50000000000000	0.00000000000000
   0.00000000000000	3.25000000000000
   0.63404354655242	3.18755216131050
   1.24372115518654	3.00260848066168
   1.80560325731371	2.70227623998327
   2.29809703885628	2.29809703885628
   2.70227623998327	1.80560325731371
   3.00260848066168	1.24372115518654
   3.18755216131050	0.63404354655242
   3.25000000000000	0.00000000000000
   0.00000000000000	4.00000000000000
   0.78036128806451	3.92314112161292
   1.53073372946036	3.69551813004515
   2.22228093207841	3.32587844921018
   2.82842712474619	2.82842712474619
   3.32587844921018	2.22228093207841
   3.69551813004515	1.53073372946036
   3.92314112161292	0.78036128806451
   4.00000000000000	0.00000000000000
   ];

elements=[...
   1	3  19	2	11 10 1
   21 19 3  20 11 12 1
   3	5  21	4	13 12 1
   23 21 5  22 13 14 1
   5	7  23	6	15 14 1
   25 23 7  24 15 16 1
   7	9  25	8	17 16 1
   27 25 9  26 17 18 1
   19	21	37	20	29 28 1
   39 37 21 38 29 30 1
   21	23	39	22	31 30 1
   41 39 23 40 31 32 1
   23	25	41	24	33 32 1
   43 41 25 42 33 34 1
   25	27	43	26	35 34 1
   45 43 27 44 35 36 1];

ndof  =  3;
nen   =  6;
ngp   =  3;
numnp = 45;
numel =  16;
ndm   =  2;
numeq = (ndof-1)*numnp+3*numel;
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
   1 1 0.00000000000000 1
   2 1 0.05099252125332 2
   3 1 0.05001271425590 3
   4 1 0.14521441464749 4
   5 1 0.09241144613273 5
   6 1 0.21732872978353 6
   7 1 0.12074137304769 7
   8 1 0.25635671589987 8
   9 1 0.06534476021971 9
   1 2 0.06534476021971 10 
   2 2 0.25635671589987 11
   3 2 0.12074137304769 12
   4 2 0.21732872978353 13
   5 2 0.09241144613273 14
   6 2 0.14521441464749 15
   7 2 0.05001271425590 16
   8 2 0.05099252125332 17
   9 2 0.00000000000000 18];
if plot
   PlotMesh(eltype, nodes, elements, nen, numel)
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
