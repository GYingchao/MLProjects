% Project 2 test code snippets

%% Test the naive implementation of logistic regression
eta = 0.21;
max = 120;
trFile = 'mushroom_train.mat';
teFile = 'mushroom_test.mat';

%for i=1:10
    %max = max + 1*10;
    label = logisticRegression(trFile, teFile, eta, max);
%end