%% main script for matlab

% for i=1:9 
%     fileTr = sprintf('%s%d%s', 'PCA_', i, 'tr');
%     fileTe = sprintf('%s%d%s', 'PCA_', i, 'te');
%     classifier(fileTr, fileTe, fileTe);
% end

for i=1:9 
    PCA('10kTrain1.mat', i, 'tr');
    PCA('Test.mat', i, 'te');
end