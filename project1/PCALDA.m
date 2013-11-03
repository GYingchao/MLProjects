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

% ## PCALDA

% ## Author: ycuiac <ycuiac@CSZ900>
% ## Created: 2013-10-13

function [ ret ] = PCALDA (dataFile, k1, k2, filesuffix)
	
	load(dataFile);
	
	%% Code of PCA
	[n d] = size(fea);
	% Check the validation of input k
	if k1 >= (d-1) 
		disp('Nothing to do with dimensionality reduction..');
		exit(-1);
    end
	
	% Here comes the SVD
 	sigma = cov(fea, 1);

	% Find the k1-largest eigenvectors of sigma to construct the projection matrix
 	[V, D] = eigs(sigma, k1);
	fea = fea*V;
	
	%% Clear all the internal variables
	clear sigma;
	clear V;
	clear D;
	
	% Code of LDA
	% Now the data matrix becomes n by k1
	% K stands for # of Label classes
	K = max(gnd)+1;
	% Check the validation of input k
	if k2 > (K-1) 
		disp('Nothing to do with dimensionality reduction..');
		exit(-1);
    end
	S_w = zeros(k1, k1);
	S_b = zeros(k1, k1);
	m_i = zeros(k1, 1);
	fea = fea';
	m = mean(fea, 2);
	for i=0:(K-1)
		% Construct the within-class scatter matrix
		sub_index = find(gnd == i);
		sub_matrix = fea(:, sub_index);
		m_i = mean(sub_matrix, 2);
		temp = bsxfun(@minus, sub_matrix, m_i);
		S_w = S_w + temp*temp';
		
		% Construct the Between-class scatter matrix
		S_b = S_b + length(sub_index)*(m_i-m)*(m_i-m)';
	end
	
	[V, D] = eigs(pinv(S_w)*S_b, k2);
	ret = (V'*fea)';
	
	% Save the result
	fea = ret;
	
	fileName = sprintf('%s%d_%d%s', 'PCALDA_',k1, k2, filesuffix);
	save("-binary", fileName, "fea", "gnd");	

endfunction
