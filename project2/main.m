% Project 2 test code snippets

% Test the naive implementation of logistic regression

% Fix max iteration steps, choose a better eta
eta = 0.21;
max = 1000;
trFile = 'mushroom_train.mat';
teFile = 'mushroom_test.mat';

% for i=1:100
%     eta = initial + i/100;
    label = logisticRegression(trFile, teFile, eta, max);
% end
% Test the naive implementation of KNN
% for k=1:10
%     kNN_classifier(k, trFile, teFile);
% end