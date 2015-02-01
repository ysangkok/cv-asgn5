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
%sp = linspace(0, length(w), 0.1);
%plot(w' * sp + b);


figure('Name', 'After')
%% data
class1 = features(:,find(labels==0));
class2 = features(:, find(labels==1));
scatter(class1(1, :), class1(2,:));
hold on
scatter(class2(1, :), class2(2,:));
%%

%% decision boundary
x = linspace(min(features(1,:)),max(features(1,:)));
vx = [x;  linspace(min(features(2,:)),max(features(2,:)))];
% x =  0:pi/100:2*pi;
% vx = [x; 0:pi/100:2*pi];
y = w'*vx + b;
scatter(x,y);
%%

%% support vectors
sv =  features(:, sidx);
scatter(sv(1, :), sv(2,:), [], 'k', '+');
hold off;
% min1 = min(features(1,:))
% max1 = max(features(1,:))
% ezplot(@(x) w(1)/w(2) * x + b, min1,max1);