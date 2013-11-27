% Project 2 test code snippets

%% Test the naive implementation of logistic regression
% eta = 0.21;
% max = 120;
trFile = 'mushroom_train.mat';
teFile = 'mushroom_test.mat';
% 
% label = logisticRegression(trFile, teFile, eta, max);

% Test the naive implementation of KNN
for k=3:100
    kNN_classifier(k, trFile, trFile);
end