function [w,b,sidx] = train_svm_separable(features,labels)
%% Trains a Support Vector machine for linearly separable training data.
%
% INPUTS
%   features    DIMxN feature matrix where each column corresponds to a feature and
%               where DIM is the feature dimension and N is the overall number of features.
%   labels      1xN vector that has entries 0/1 for corresponding classes.
%%
% OUTPUTS
%   w           learned weight vector
%   b           learned bias value
%   sidx        vector containing the column indices of found support vectors in 'features'
%%

%% class_1 -> yi = 1  , class_2 -> yi = -1 
y(find(labels==0)) = -1;
y(find(labels==1)) = 1;
%%

%% Optimizatision parameters
N = length(features);
for i=1:N
    for j=1:N
        H(i,j) = y(i)*y(j)*features(:,i)'*features(:,j);
    end    
end
size(H)
f = repmat(-1, 1, N);

Aeq = y;
beq = 0;

lb = zeros(N, 1);
%%

%% Use quadprog to solve the problem 
alpha = quadprog(H,f,[],[],Aeq,beq,lb,[])
%%

%% Tag the support vectors
epsilon = 1e-5; %eps
sidx = find(alpha>epsilon)
%%

%% Calculate w with the alphai
w = zeros(size(features(:,1)));
for i=1:N
    w = w + alpha(i)*y(i)*features(:,i);
end
%%

%% Determine b asmean of the different b you can obtain with the support vectors
%svB = zeros([2 nbSV]);
svB = y(sidx) - w'*features(:,sidx)
b = mean(svB);

