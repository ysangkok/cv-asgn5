function show_before(features,labels)
%% Shows a 2-dimensional plot where 2D feature points are
%  colored w.r.t. class labels.
%
% INPUTS
%   features    2xN matrix where each column corresponds to a 2D point as in [x;y]
%   labels      1xN vector that has entries 1/-1 for 'class_1'/'class_2', respectively
%%
figure('Name', 'Before')
class1 = features(:,find(labels==0));
class2 = features(:, find(labels==1));
scatter(class1(1, :), class1(2,:));
hold
scatter(class2(1, :), class2(2,:));