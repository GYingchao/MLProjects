% Project 2 test code snippets

%% Test the naive implementation of logistic regression
% eta = 0.21;
% max = 120;
trFile = 'ionosphere_train.mat';
teFile = 'ionosphere_test.mat';
% 
% label = logisticRegression(trFile, teFile, eta, max);

% Test the naive implementation of KNN
for k=1:10
    kNN_classifier(k, trFile, teFile);
end