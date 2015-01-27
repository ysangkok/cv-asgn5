function [w,b,sidx] = train_svm_nonseparable(features,labels,C)
%% Trains a Support Vector machine for non-separable training data.
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


w =
b =
sidx =
