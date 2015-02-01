
%------------------------------------------------------------------
% SEPARABLE CASE
%------------------------------------------------------------------
disp('(1) SEPARABLE');

% load training data (separable)
[features,labels] = load_data('../../data/separable.mat');

% plot feature points with labels (using show_before)
show_before(features,labels);

% train SVM (using train_svm_separable)
% UNCOMMENT when done
[w,b,sidx] = train_svm_separable(features,labels);

% Show weights and bias on command window
% UNCOMMENT
%fprintf('weights = %d\nbiais = %d\n', w, b);

% Plot points with labels, decision boundaries, margins, support vectors (using show_after)
% UNCOMMENT when done
%show_after(features,labels,w,b,sidx);



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
% UNCOMMENT when done
%[w,b,sidx] = train_svm_nonseparable(features,labels,C);

% Report weights and bias on command window
% UNCOMMENT
%fprintf('weights = %d\nbiais = %d\n', w, b);

% Plot points with labels, decision boundaries, margins, support vectors (using show_after)
% UNCOMMENT
%show_after(features,labels,w,b,sidx);




%--------------------------------------------------------------------
% APPLY SVM to airplane/motorbike classification of assignment 4
%--------------------------------------------------------------------


% Load data from asgn4
% [train_features,train_labels,test_features,test_labels] = load_asgn4('../../data/asgn4data.mat');


% choose weight to penalize deviations
%C =


% train SVM on training data (using train_svm_nonseparable)
% UNCOMMENT
%[w,b,sidx] = train_svm_nonseparable(train_features, train_labels,C);


% predict classes for both training/testing sets (using predict_svm)
% UNCOMMENT when done
%predictions = predict_svm(train_features,w,b);


% show errors of both training/testing set on command window
% TODO