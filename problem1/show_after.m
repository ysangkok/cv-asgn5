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
%sp = linspace(0, length(w), 0.1);
%plot(w' * sp + b);
x = linspace(min(features(1,:)),max(features(1,:));
y = w'*x+b;
scatter(x,y);
%ezplot(@(x) w(2)/w(1) * x + b);