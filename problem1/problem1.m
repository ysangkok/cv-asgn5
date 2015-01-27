
%------------------------------------------------------------------
% SEPARABLE CASE
%------------------------------------------------------------------
disp('(1) SEPARABLE');

% load training data (separable)
[features,labels] = load_data('../../data/separable.mat');

% plot feature points with labels (using show_before)


% train SVM (using train_svm_separable)


% Show weights and bias on command window


% Plot points with labels, decision boundaries, margins, support vectors (using show_after)




%------------------------------------------------------------------
% NON-SEPARABLE CASE
%------------------------------------------------------------------
disp('(2) SEPARABLE');


% load training data (nonseparable)
[features,labels] = load_data('../../data/nonseparable.mat');


% plot points with labels (using show_before)
show_before(features,labels);

% choose weight of C=5 to penalize deviations
C = 5;


% train SVM (using train_svm_nonseparable)


% Report weights and bias on command window


% Plot points with labels, decision boundaries, margins, support vectors (using show_after)





%--------------------------------------------------------------------
% APPLY SVM to airplane/motorbike classification of assignment 4
%--------------------------------------------------------------------


% Load data from asgn4
[train_features,train_labels,test_features,test_labels] = load_asgn4('../../data/asgn4data.mat');


% choose weight to penalize deviations
%C =


% train SVM on training data (using train_svm_nonseparable)



% predict classes for both training/testing sets (using predict_svm)



% show errors of both training/testing set on command window
