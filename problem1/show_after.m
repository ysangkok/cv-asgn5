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
scatter(class1(1, :), class1(2,:));
hold on
scatter(class2(1, :), class2(2,:));
%%

%% decision boundary
x = linspace(0,max(features(1,:))); %linspace(min(features(1,:)),max(features(1,:)));
%vx = [x;  linspace(0,max(features(2,:)))]; %[x;  linspace(min(features(2,:)),max(features(2,:)))];
f = @(x) x*(w(1)/-w(2))-(-b/norm(w))-1;
y = f(x'); % upper line 


% for i=1:size(vx, 2)
%     y(i) = dot(w,vx(:,i)) + b;
% end
%boundary = y; % here we actually want the decision boundary line
%%

%% support vectors
sv =  features(:, sidx)
idxs = find(labels(sidx)==1)
%assert(length(idxs) > 10);
lowersvs = features(:,sidx(idxs))

lower_line_point = sum(lowersvs,2) ./ repmat(size(lowersvs,2),size(lowersvs,2),1)
assert(all(size(lower_line_point) == [2 1]));
upper_line_point = [lower_line_point(1); f(lower_line_point(1))]
assert(all(size(upper_line_point) == [2 1]));

%scatter(lower_line_point(1),lower_line_point(2),'fill');
%scatter(upper_line_point(1),upper_line_point(2),'fill','green');

x_diff = abs(upper_line_point(2) - lower_line_point(2))
assert(x_diff > eps)
boundary = y-x_diff/2;
%scatter(x,y-x_diff, 'green', 'd');

scatter(x,boundary, [], 'k', '.'); % decision boundary line

scatter(sv(1, :), sv(2,:), [], 'k', '+');
%%

%% line showing the margin
scatter(x,boundary-(1/norm(w)), [], 'b', '.'); % upper line
scatter(x,boundary+(1/norm(w)), [], 'm', '.'); % lower line
%%

hold off;
