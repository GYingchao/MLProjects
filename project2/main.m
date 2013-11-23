% Project 2 test code snippets

%% Test the naive implementation of logistic regression
eta = 0.236;
max = 100;
trFile = 'liver_train.mat';
teFile = 'liver_test.mat';

for i=1:100
    max = max + 1*10;
    label = logisticRegression(trFile, teFile, eta, max);
end