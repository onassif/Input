%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% User input Start
BC_T = {...
   'x', 0, 'u', 0
   'x', 2, 'u', 0.1
   'y', 0, 'v', 0
   'z', 0, 'w', 0};

FORCE_Tx = {'x', 0, 'u', 0};

NR_tol = 1e-10;%1e-11;
max_iter = 100;%20
n_steps = 1;
eltype = 'T4';
ndm = 3;
ngp = 1;
nen = 4;
plot = 0;

nodes = [...
0	1	2	0     1     2     0	1	2	0     1     2     0     1     2     0     1     2     0	1	2	0     1     2     0	1	2	1	1	1	1	1	0     0     0     1     1     1     1     1     1     1     1     1     1     1     1	1	1	1	1	0     0     0     1     1     1     1     1     1     1     1     1     1     1     2     2     2     2     2     2     2     0     0     0     0     0     0     0     0     0     0     0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	2	2	2	2	2	2	2	2	2	2	2	0	0	0	0	0	0	0	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	2	0	0	0	0	0	0	0	0	0	0	0	0	0	2	1	1	2	1	2	1	1	0	0	2	2
0	0	0	0.5	0.5	0.5	1	1	1	0     0     0     0.5	0.5	0.5	1     1     1     0	0	0	0.5	0.5	0.5	1	1	1	0	0	0	0	0	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5   0.5	0.5	1	1	1	1	1	0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.5	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	0	0	0	0	0	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	0	0	0	0.500000000000000	0.500000000000000	0	0.500000000000000	0.500000000000000	0.500000000000000	0.500000000000000	1	1	0.500000000000000	0	0.500000000000000	0.500000000000000	0.500000000000000	0	0.500000000000000	0.500000000000000	0.500000000000000	1	1	1	0.500000000000000	1	1	1	1	1	1	1	1	1	1	1	0	0
0	0	0	0     0     0     0	0	0	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	3	3	3	3     3     3     3	3	3	0	0	0	0	0	0     0     0     0     0     0     0     0     0     0     0     0     0     0     0	0	0	0	0	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.5	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	1.50000000000000	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	3	0	0	0	0	0	0	0	0	0	0	0	0	0	3	3	3	3	3	3	3	3	3	3	3	3	3	1.50000000000000	3	3	1.50000000000000	3	1.50000000000000	3	3	0	0	3	3]';

elements = [...
1	28	29	30	37	53	32	155	156	157	159	59	35	42	43	44	48	79	46	162	163	164	166	94	54	61	62	63	97	172	65	69	70	71	112	140	83	102	103	104	132	179	106	114	115	116	186	151	3	6	84	155	85	12	157	87	161	125	162	126	107	164	108	94	60	95	22	61	169	20	63	171	101	25	102	176	146	104	104	132	113	182	114	183	152	116	69	65	44	90	48	79	138	100	110	144	41	16	42	118	89	44	68	141	69	142	21	71	30	55	37	53	5	75	2	13	28	73	11	30
2	5	34	11	55	56	3	6	40	12	66	67	41	8	190	89	90	91	161	9	51	107	108	109	60	95	82	20	136	137	68	110	100	21	191	192	101	130	124	146	147	148	113	181	135	152	153	154	57	84	155	84	156	86	86	159	92	162	125	163	127	127	128	129	19	22	61	22	62	170	170	97	174	102	25	103	177	177	146	147	149	114	182	115	185	185	110	68	89	120	90	121	65	142	141	112	77	42	16	43	119	119	138	69	141	70	143	143	11	75	55	76	13	37	10	28	13	29	74	74
4	33	52	36	14	31	38	39	58	158	15	160	7	189	78	47	17	45	49	50	93	165	18	167	80	81	168	96	23	64	98	99	139	111	24	72	122	123	175	131	26	105	133	134	150	184	27	117	38	39	39	6	58	158	12	15	49	50	9	93	165	107	18	109	80	81	81	95	168	96	20	23	122	123	130	175	131	146	131	26	133	134	181	150	184	152	99	98	47	17	17	91	98	139	99	24	7	189	8	78	47	89	98	99	110	139	111	21	36	14	14	56	33	14	4	33	5	52	36	11
10	13	73	74	75	76	57	84	85	86	87	88	77	16	118	119	120	121	92	125	126	127	128	129	19	22	169	170	171	173	138	141	142	143	144	145	174	25	176	177	178	180	149	182	183	185	187	188	32	155	6	39	40	157	158	66	46	9	50	51	164	165	166	167	54	61	95	81	82	63	96	136	83	130	123	124	104	131	177	178	106	181	134	135	116	184	141	138	119	48	120	45	68	70	69	191	35	8	189	190	44	47	65	110	99	100	71	111	74	37	75	31	28	55	1	5	33	34	30	36
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	156	161	85	157	88	66	160	94	163	126	164	129	108	167	114	106	62	101	169	63	173	136	64	179	103	176	104	180	147	105	106	135	115	183	116	188	153	117	66	59	46	102	51	83	20	97	113	151	43	118	44	121	90	45	70	142	71	145	191	72	32	61	40	54	41	79	29	73	30	76	55	31
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	40	46	40	158	59	159	67	109	51	51	165	94	166	109	181	113	82	83	82	96	172	97	137	148	124	124	131	179	132	148	133	183	135	135	184	151	186	154	87	88	49	130	126	101	96	136	106	154	190	190	47	79	48	91	100	100	111	140	112	192	38	95	85	60	35	91	34	34	36	53	37	56
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	58	92	156	86	160	87	88	167	93	163	127	167	128	129	134	133	168	174	62	170	64	171	173	105	175	103	177	105	178	180	149	150	150	115	185	117	187	188	15	67	92	123	93	122	63	23	149	117	78	43	119	45	120	121	139	70	143	72	144	145	57	81	58	80	77	45	52	29	74	31	75	76
0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	85	49	58	12	67	15	59	129	126	93	107	109	18	94	182	149	169	122	168	20	137	23	172	180	176	175	146	148	26	179	113	115	183	150	152	154	27	151	159	160	161	25	163	174	170	171	133	188	118	78	89	91	17	79	142	139	21	192	24	140	3	22	156	19	7	121	73	52	11	56	14	53]';

numnp = size(nodes,1);
numel = 48;
elements(numel+1:end,:) = elements(numel+1:end,[3,1,2,4,6,7,5,8]);
[BC, FORCE] = generateBC(BC_T, FORCE_Tx, nodes, elements, eltype, ndm, numnp, numel);
RegionOnElement = [...
   3*ones(6 ,1)
   1*ones(6 ,1)
   2*ones(6 ,1)
   1*ones(12,1)
   2*ones(6 ,1)
   1*ones(12,1)
   4*ones(38,1)
   5*ones(10,1)
   6*ones(12,1)
   7*ones(4 ,1)
   8*ones(2,1)
   9*ones(6,1)];
elements = [elements,RegionOnElement];
material = [...
   1
   1
   1
   8
   8
   8
   8
   8
   8];
props = {...
   {'E', 190e3; 'nu', 0.30}
   {'E', 190e3; 'nu', 0.30}
   {'E', 190e3; 'nu', 0.30}
   {'L', 1; 'R', 1}
   {'L', 2; 'R', 1}
   {'L', 2; 'R', 2}
   {'L', 3; 'R', 1}
   {'L', 3; 'R', 2}
   {'L', 3; 'R', 3}};

ndof = 3;
numeq = ndof*numnp;