% Project 2 test code snippets

%% Test the naive implementation of logistic regression
eta = 0.4;
max = 100;
trFile = 'liver_train.mat';
teFile = 'liver_test.mat';
label = logisticRegression(trFile, teFile, eta, max);