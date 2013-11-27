function [ output ] = kNN_classifier( k, trData, teData )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    load(trData);
    [n1 d1] = size(X);
    X1 = X; Y1 = Y;
    clear X; clear Y;

    load(teData);
    [n2 d2] = size(X);
    X2 = X; Y2 = Y;
    clear X; clear Y;

    if d1 ~= d2
        disp('Format Error! Degrees do not match!');
        exit(-1);
    end
    
    result = -1*ones(n2, 1);

    for te = 1:n2
        % Define k-bin vector to store the k nearest neighborhoods
        neighbors = zeros(k, 1); % column vector is convenient to shift
        indice = zeros(k, 1);
        % Define distance array
        dists = bsxfun(@minus, X1, X2(te, :));
        dists = sqrt(sum(dists.^2, 2));
        
        % Identify knn of input te
        for tr = 1:n1
            curr = X1(tr);
            % Insert operation
            for i=1:k
                if neighbors(i) < curr
                    j = k-1;
                    while j>=i
                        neighbors(j+1) = neighbors(j);
                        indice(j+1) = indice(j);
                        j = j-1;
                    end
                    neighbors(i) = curr;
                    indice(i) = tr; 
                end
            end
        end
        
        % Hopefully we get the knn in vector neighbors and their indice
        % Then we do the classification
        statLabel = zeros(1, 2);
        for i=1:k
            if Y1(i) == 0
                statLabel(1) = statLabel(1) + 1;
            else
                statLabel(2) = statLabel(2) + 1;
            end
        end
        if statLabel(1) == statLabel(2)
            % Randomly classify this instance
            decide = rand(1);
            result(te) = decide < 0.5;
        else
            result(te) = statLabel(1) < statLabel(2);
        end
    end     % Here ends the classification
    
    % Evaluate the classification ratio
    ratio = sum(result == Y2)/n2;
    sprintf('%s%f%s%d', 'Accuracy achieved: ', ratio, ' when k = ', k)
    output = result;
end

