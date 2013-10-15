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

% ## RLDA

% ## Author: ycuiac <ycuiac@CSZ900>
% ## Created: 2013-10-13

function [ ret ] = RLDA (dataFile, k, alpha)
	% Load the data source
	load(dataFile);
	% d stands for # of dimensions and n stands for # of samples in the data source matrix(n by d)
	[n d] = size(fea);
	% K stands for # of Label classes
	K = max(gnd)+1;
	% Check the validation of input k
	if k > (K-1) 
		disp('Nothing to do with dimensionality reduction..');
		exit(-1);
    end
	
	fea = fea';
	S_w = zeros(d, d);
	S_b = zeros(d, d);
	m_i = zeros(d, 1);
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
	
	% Here comes the difference with LDA
	if alpha <0 
		disp('Wrong input parameter alpha..');
		exit(-1);
	end
	S_w = S_w + eye(d)*alpha;
	
	% After regularization, we do the SVD
	[V, D] = eigs(pinv(S_w)*S_b, k);
	ret = (V'*fea)';
	
	% Save the result
	fea = ret;
	fileName = sprintf('%s%d', 'RLDA_',k);
	save("-binary", fileName, "fea", "gnd");
endfunction
