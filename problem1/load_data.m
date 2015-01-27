function [features,labels] = load_data(fn)
%% Loads features/labels from file.
%
% INPUTS
%   fn          filename
%
% OUTPUTS
%   features    2xN matrix where each column corresponds to a 2D point as in [x;y]
%   labels      1xN vector that has entries 0/1 for 'class_1'/'class_2', respectively
%%

X = load(fn);

features = X.features;
labels = X.labels;

% format check
assert(size(features,1) == 2 && size(labels,1) == 1 && ...
       size(features,2) == size(labels,2));
