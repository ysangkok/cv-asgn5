function show_after(features,labels,w,b,sidx)
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


figure('Name', 'After')
%% data
class1 = features(:,find(labels==0));
class2 = features(:, find(labels==1));
scatter(class1(1, :), class1(2,:), '+');
hold on
scatter(class2(1, :), class2(2,:), '+');
%%
if (w(2) ~= 0 )
    %% decision boundary in red .
    x = linspace(min(features(1,:)),max(features(1,:)));
    f = @(x) x*(-w(1)/w(2)) - (b/w(2));
    boundary = f(x); % boundary line
    scatter(x,boundary, [], 'r', '.'); % decision boundary line
    
    
    %% support vectors in black o
    sv = features(:, sidx);
    scatter(sv(1, :), sv(2,:), [], 'k');
    %%
    
    %% line showing the margin
    scatter(x,boundary+(1/w(2)), [], 'g', '.');
    scatter(x,boundary-(1/w(2)), [], 'g', '.');
    %%
else
    disp('w(2) == 0');
end

hold off;
