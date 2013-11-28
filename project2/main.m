% Project 2 test code snippets

% Test the naive implementation of logistic regression

% empirical study eta = 0.21
%startT = cputime;
%observation = zeros(1, 15);
eta = 0.04;
max = 1000;
trFile = 'ionosphere_train.mat';
teFile = 'ionosphere_test.mat';
logisticRegression(trFile, teFile, eta, max);
%for i=1:1
    %eta = eta0 + i/100;
%     for j=1:15
%         max = max0 + 100*j;
%         observation(j) = logisticRegression(trFile, trFile, eta, max);
%     end
%end
%endT = cputime - startT;
% Test the naive implementation of KNN
% for k=1:10
%     kNN_classifier(k, trFile, teFile);
% end