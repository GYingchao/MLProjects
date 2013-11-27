% Project 2 test code snippets

%% Test the naive implementation of logistic regression
% eta = 0.21;
% max = 120;
trFile = 'isolet_train.mat';
teFile = 'isolet_test.mat';
% 
% label = logisticRegression(trFile, teFile, eta, max);

% Test the naive implementation of KNN
for k=2
    kNN_classifier(k, trFile, teFile);
end