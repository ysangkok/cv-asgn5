function show_before(features,labels)
%% Shows a 2-dimensional plot where 2D feature points are
%  colored w.r.t. class labels.
%
% INPUTS
%   features    2xN matrix where each column corresponds to a 2D point as in [x;y]
%   labels      1xN vector that has entries 0/1 for 'class_1'/'class_2', respectively
%%
figure('Name', 'Before')
plot(features(find(labels==0)),'*');
hold
plot(features(find(labels==1)), '+');