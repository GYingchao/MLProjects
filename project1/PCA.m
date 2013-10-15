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

% ## PCA : reduce the dimensionality of data to k

% ## Author: ycuiac <ycuiac@CSZ900>
% ## Created: 2013-10-13

function [ ret ] = PCA (dataFile, k)
	% Load the data source
	load(dataFile);
	% d stands for # of dimensions and n stands for # of samples in the data source matrix(n by d)
	[n d] = size(fea);
	% Check the validation of input k
	if k >= (d-1) 
		disp('Nothing to do with dimensionality reduction..');
		exit(-1);
    end
	
	% Turn the sample datas to column vectors
	fea = fea';
	% Here comes the SVD
	% First we compute the mean of raw data defined as mu
	mu = mean(fea, 2);
	% Then we compute the covariate matrix defined as sigma
	temp = bsxfun(@minus, fea, mu);
 	sigma = temp*temp'/n;
	clear temp;
	% Find the k-largest eigenvectors of sigma to construct the projection matrix
 	[V, D] = eigs(sigma, k);
	% Do the projection
	ret = (V'*fea)';	% Do the transport just to match the input data format
	
	% Save the result
	fea = ret;
	fileName = sprintf('%s%d', 'PCA_',k);
	save("-binary", fileName, "fea", "gnd");
endfunction
