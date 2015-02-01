function [train_features,train_labels,test_features,test_labels] = load_asgn4(fn)
%% Loads assignment4 features/labels from file.
%
% INPUTS:
%   fn          filename (of asgn4 file)
%
% OUTPUTS:
%   train_features    DIMxN matrix where each column corresponds to a DIM dimensional feature
%   train_labels      1xN vector that has entries 0/1 for respective classes
%
%   test_features     DIMxN matrix where each column corresponds to a DIM dimensional feature
%   test_labels       1xN vector that has entries 0/1 for respective classes
%%
data = load('../../data/asgn4data.mat');

[DIM train.N] = size(data.training.histogram);
train.scaling = repmat(sum(data.training.histogram, 1), DIM, 1);
%size(train.scaling)
%size(data.training.histogram)
train.newFeatures = data.training.histogram ./ train.scaling;
train.labels = data.training.inputs.labels;


test.N = size(data.training.histogram, 2);
test.scaling = repmat(sum(data.testing.histogram, 1), DIM, 1);
size(test.scaling)
size(data.testing.histogram)
test.newFeatures = data.testing.histogram ./ test.scaling;
test.labels = data.testing.inputs.labels;


train_features = train.newFeatures;
train_labels   = train.labels;

test_features  = test.newFeatures;
test_labels    = test.labels;


% format check
% assert(all(size(train_features(:)) == [DIM train.N]));
% assert(all(size(test_features(:)) == [DIM test.N]));

assert(min(train_features(:))>=0 & max(train_features(:))<=1);
assert(min(test_features(:))>=0 & max(test_features(:))<=1);
