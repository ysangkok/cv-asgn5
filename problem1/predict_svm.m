function predictions = predict_svm(features,w,b)
%% Predicts the outcome for given features based on the
% discriminant function.
%
% INPUTS:
%   features      DIMxN matrix where each column corresponds to a feature.
%   w             learned weight vector
%   b             learned bias value
%
% OUTPUTS:
%   predictions   vector of corresponding outcomes (0/1)
%%

predictions = (w'*features + b) > 0 ;
% (w'*features(i) + b) > 0 == 1 ->  (y(i) > 0) -> (y(i) = 1) -> class_2 -> labels(i) == 1
% likewise, (w'*features(i) + b) < 0 -> class_1 -> labels(i) == 0

% format check
assert(length(predictions) == size(features,2));


