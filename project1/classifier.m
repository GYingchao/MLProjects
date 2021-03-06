% ## Copyright (C) 2013 ycuiac
% ## 
% ## This program is free software; you can redistribute it and/or modify
% ## it under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 3 of the License, or
% ## (at your option) any later version.
% ## 
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with Octave; see the file COPYING.  If not, see
% ## <http://www.gnu.org/licenses/>.

% ## classifier

% ## Author: ycuiac <ycuiac@CSZ900>
% ## Created: 2013-10-14

function [ ret ] = classifier (trainFile, testFile, filesuffix)
	tic;
	load(trainFile);
	
	train_fea = fea'/max(max(fea));
	train_gnd = gnd;
	clear fea;
	clear gnd;
	
	load(testFile);
	test_fea = fea'/max(max(fea));
	test_gnd = gnd;
	clear fea;
	clear gnd;
	
	[train_d train_n] = size(train_fea);
	train_K = max(train_gnd)+1;
	[test_d test_n] = size(test_fea);
	
	if test_d ~= train_d
		disp('Error! The dim of training set and testing set cannot match.');
		exit(-1);
	end
	
	logG_x = zeros(train_K, test_n);
	
	for i=0:(train_K-1)
		% Calculate the prior class probability
		p_ci = mean(train_gnd == i);
		
		% Calculate the class means
		sub_index = find(train_gnd == i);
		sub_matrix = train_fea(:, sub_index);
		mu_i = mean(sub_matrix, 2);
		% Calculate the class covariance matrix
		
		sigma_i = cov(sub_matrix', 1);
		
		% To settle down the numerical problem
		detsigma_i = abs(det(sigma_i));
		if detsigma_i <= 0.00001
		%[v1 detsigma_i] = eigs(sigma_i, 1);
		end
		invsigma_i = pinv(sigma_i);
		if(invsigma_i <= 0.00001)
			%invsigma_i = pinv(sigma_i + 0.01*eye(train_d, train_d));
		end
		clear sigma_i;
		
		for l=1:test_n
			temp = test_fea(:, l) - mu_i;
			logG_x(i+1, l) = -0.5*test_d*log(2*pi) - 0.5*log(detsigma_i) - 0.5*temp'*invsigma_i*temp + log(p_ci);
			clear temp;
		end
	end
	
	[prob result] = max(logG_x);
	ret = (result-1)';
	accuryRatio = sum(ret == test_gnd)/test_n;
	disp(accuryRatio);
	filename = ['classified_result' filesuffix];
	% Save the result
	save(filename, 'ret');	
	toc()
end
