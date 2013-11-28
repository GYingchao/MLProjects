% Project 2 test code snippets

% Test the naive implementation of logistic regression

% empirical study eta = 0.21
%startT = cputime;
%observation = zeros(1, 15);
% eta = 0.21;
% max = 200;
% trFile = 'mushroom_train.mat';
% teFile = 'mushroom_test.mat';
% logisticRegression(trFile, teFile, eta, max);
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

% Conduct cross validation to tune k for the k-NN classifier
TrainFile = 'ionosphere_train.mat';
load(TrainFile);
[n1 d1] = size(X);
acc = zeros(10, 10);
for i=1:10
    testI = ceil(n1*rand(1, 0.2*n1));
    testX = X(testI, :);
    testY = Y(testI, :);
    trainX = X;
    trainY = Y;
    trainX(testI, :) = [];
    trainY(testI, :) = [];
    
    for k=1:10
        acc(i, k) = kNN_classifier(k, trainX, trainY, testX, testY);
    end
end
max(sum(acc)/10)

