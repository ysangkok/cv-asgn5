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

%% labels(i) == 0 -> yi = 1  , labels(i) == 1 -> yi = -1 
y = zeros(size(labels));
y(find(labels==0)) = 1;
y(find(labels==1)) = -1;
%%

%% Optimizatision parameters
N = length(features);
H = zeros();
for i=1:N
    for j=1:N
        if (i ~= j)
            H(i,j) = y(i)*y(j)*features(:,i)'*features(:,j);
        end
    end    
end
f = repmat(-1, 1, N);

Aeq = y;
beq = zeros(1,1);

lb = zeros(N, 1);
%%

%% Use quadprog to solve the problem 
opts = optimoptions('quadprog','Algorithm','active-set','Display','off');
[alpha,fval,exitflag,output,lambda] = ...
   quadprog(H,f,[],[],Aeq,beq,lb,[],[],opts)
%%

%% Tag the support vectors
epsilon = 1e-5
sidx = find(alpha>epsilon)
%%

%% Calculate w with the alphai
w = zeros(size(features(:,1)));
for i=1:N
    w = w + alpha(i)*y(i)*features(:,i);
end
%%

%% Determine b asmean of the different b you can obtain with the support vectors
b = 0;
nbSV = length(sidx) % number of support vectors
for i=1:nbSV
    b = b + w'*features(:,i) - y(i);
end
b = b/nbSV

