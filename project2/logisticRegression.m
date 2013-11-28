function [ result ] = logisticRegression( trData, teData, eta, maxIter )
% logistic regression for binary classification using gradient descent algorithm
    % Load and format the input training set
    startT = cputime;
    load(trData);
    [n d] = size(X);
    X1 = [ones(n, 1), X];
    Y1 = Y;
    clear X;
    clear Y;
    
    load(teData);
    n2 = size(Y, 1);
    X2 = [ones(n2, 1), X];
    
    % Initialize important variables used in the algorithm
    iterations = 1;
    W = rand([d+1, 1])/50 - 0.01;
    
    % Here starts the iteration
    while(iterations < maxIter)
        dW = zeros(d+1, 1);
        for l=1:n
            o = X1(l, :)*W;
            a = 1.0/(1 + exp(-o));
            a = 1 - Y1(l, 1) - a;
            for j=0:d
               dW(j+1, 1) = dW(j+1, 1) + a*X1(l, j+1);
            end
        end
        W = W + eta*dW;
        iterations = iterations + 1;
    end
    % After convergence, we compute the discriminat function value directly
    % w.r.t testing data set
    clear X1;

    label = -1*ones(n2, 1);
    for l=1:n2
        label(l, 1) = X2(l, :)*W < 0;
    end
    
    % Compute the classification accuracy
    ratio = sum(label == Y)/n2;
    %sprintf('%s%f%s%f', 'Accuracy achieved: ', ratio, ' where eta is ', eta)
    %result = label;
    result = ratio;
    disp(cputime-startT);
end

