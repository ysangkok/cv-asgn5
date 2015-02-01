
%------------------------------------------------------------------
% SEPARABLE CASE
%------------------------------------------------------------------
disp('---------');
disp('(1) SEPARABLE');

% load training data (separable)
[features,labels] = load_data('../../data/separable.mat');

% plot feature points with labels (using show_before)
show_before(features,labels);

% train SVM (using train_svm_separable)
[w,b,sidx] = train_svm_separable(features,labels);

% Show weights and bias on command window
fprintf('weights = [%d; %d] \nbiais = %d\n', w, b);

% Plot points with labels, decision boundaries, margins, support vectors (using show_after)
show_after(features,labels,w,b,sidx);



%------------------------------------------------------------------
% NON-SEPARABLE CASE
%------------------------------------------------------------------
disp('---------');
disp('(2) SEPARABLE : nonseparable.mat');

% load training data (nonseparable)
[features,labels] = load_data('../../data/nonseparable.mat');


% plot points with labels (using show_before)
show_before(features,labels);

% choose weight of C=5 to penalize deviations
C = 5;


% train SVM (using train_svm_nonseparable)
[w,b,sidx] = train_svm_nonseparable(features,labels,C);

% Report weights and bias on command window
fprintf('weights = [%d; %d] \nbiais = %d\n', w, b);

% Plot points with labels, decision boundaries, margins, support vectors (using show_after)
show_after(features,labels,w,b,sidx);




%--------------------------------------------------------------------
% APPLY SVM to airplane/motorbike classification of assignment 4
%--------------------------------------------------------------------
disp('---------');
disp('(2) SEPARABLE : asgn4data.mat');

% Load data from asgn4
[train_features,train_labels,test_features,test_labels] = load_asgn4('../../data/asgn4data.mat');


% choose weight to penalize deviations
C = 3; % the one chosen

% table of number of errors depending on C 
% -------------------------------------------------------------------------------------
%          | C=1 | C=2 | C=2.5 | C=2.75 | C=2.9 | C=2.95 | C=2.97 | C=3 |  C=4  | C=5 |
% -------------------------------------------------------------------------------------
%training  |  4  |  0  |   0   |   1    |   0   |   0    |   0    |  0  |   1   |  2  |
% -------------------------------------------------------------------------------------
%testing   |  7  |  6  |   5   |   6    |   5   |   4    |   4    |  4  |   5   |  5  |
% -------------------------------------------------------------------------------------

% train SVM on training data (using train_svm_nonseparable)
[w,b,sidx] = train_svm_nonseparable(train_features, train_labels,C);


% predict classes for both training/testing sets (using predict_svm)
train_predictions = predict_svm(train_features,w,b);
test_predictions = predict_svm(test_features,w,b);

% show errors of both training/testing set on command window
figure('Name', 'Errors of training set : blue==expected, black==predicted')
x = 1:size(train_features,2);
scatter(x, train_labels, 'b');
hold
scatter(x, train_predictions, 'k', 'x');
hold off;

figure('Name', 'Errors of testing set : blue==expected, black==predicted')
x = 1:size(test_features,2);
scatter(x, test_labels, 'b');
hold
scatter(x, test_predictions, 'k','x');
hold off;
