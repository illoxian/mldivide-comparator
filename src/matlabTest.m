problemList = {};
%%%%%%%%%%%%%%% linux
%load('/home/ducky/code/calcolo/data/matrix/Hook_1498.mat');
%problemList = [problemList, Problem];

load('/home/ducky/code/calcolo/data/matrix/G3_circuit.mat');
problemList = [problemList, Problem];
load('/home/ducky/code/calcolo/data/matrix/nd24k.mat');
problemList = [problemList, Problem];
load('/home/ducky/code/calcolo/data/matrix/bundle_adj.mat');
problemList = [problemList, Problem];
load('/home/ducky/code/calcolo/data/matrix/ifiss_mat.mat');
problemList = [problemList, Problem];
load('/home/ducky/code/calcolo/data/matrix/TSC_OPF_1047.mat');
problemList = [problemList, Problem];
load('/home/ducky/code/calcolo/data/matrix/ns3Da.mat');
problemList = [problemList, Problem];
load('/home/ducky/code/calcolo/data/matrix/GT01R.mat');
problemList = [problemList, Problem];

% %%%%%%%%%%%%%%% windows
% load('/home/ducky/code/calcolo/data/matrix/bundle_adj.mat');
% problemList = [problemList, Problem];
% load('/home/ducky/code/calcolo/data/matrix/G3_circuit.mat');
% problemList = [problemList, Problem];
% %load('/home/ducky/code/calcolo/data/matrix/Hook_1498.mat');
% %problemList = [problemList, Problem];
% load('/home/ducky/code/calcolo/data/matrix/ifiss_mat.mat');
% problemList = [problemList, Problem];
% load('/home/ducky/code/calcolo/data/matrix/nd24k.mat');
% problemList = [problemList, Problem];
% load('/home/ducky/code/calcolo/data/matrix/TSC_OPF_1047.mat');
% problemList = [problemList, Problem];
% load('/home/ducky/code/calcolo/data/matrix/ns3Da.mat');
% problemList = [problemList, Problem];
% load('/home/ducky/code/calcolo/data/matrix/GT01R.mat');
% problemList = [problemList, Problem];




resList = {};

for c = problemList
    res = {};
    A = sparse(c{1,1}.A); 
    xe = ones(size(A,2),1);

    b=A*xe;
    tic
    xM = A\b;

    %disp('Test in esecuzione sulla matrice:')
    res = [res, c{1,1}.name];
    %disp('errore realtivo')
    resNorm = norm(xe -xM)/norm(xe);
    res = [res, resNorm];
    %disp('Tempo trascors')
    elasped = toc;
    res = [res, elasped];
    resList = [resList, res];
end