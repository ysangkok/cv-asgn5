function show_after(features,labels,w,b,svec)
%% Shows a 2-dimensional plot of the features decision boundaries and margins.
%  Also marks the support vectors.
%
% INPUTS:
%   features    2xN matrix where each column corresponds to a 2D point as in [x;y]
%   labels      1xN vector that has entries 0/1 for 'class_1'/'class_2', respectively
%   w           learned weight vector
%   b           learned bias value
%   sidx        vector containing the column indices of found support vectors in 'features'
%%
