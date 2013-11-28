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


%%%%%%%%%%%%%%%%% The source file is edited to suit matlab%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% by ycuiac 2013-11-04 %%%%%%%%%%%%%%%%%%%%%%%%%%

function [ ret ] = PCA (dataFile, k, filesuffix)
	% Load the data source
	file = load(dataFile);
    X = getfield(file, 'X');
    Y = getfield(file, 'Y');
	X = X/max(max(X));
	% d stands for # of dimensions and n stands for # of samples in the data source matrix(n by d)
	[n d] = size(X);
	% Check the validation of input k
	if k >= (d-1) 
		disp('Nothing to do with dimensionality reduction..');
		exit(-1);
    end
	
	% Here comes the SVD
	sigma = cov(X, 1);
	if det(sigma) <= 0.0001
		%sigma = sigma + 0.001*eye(d, d);
	end
	% Find the k-largest eigenvectors of sigma to construct the projection matrix
 	[V, D] = eigs(sigma, k);
	%D
	% Do the projection
	ret = X*V;	% Do the transport just to match the input data format
	
	% Save the result
	X = ret;
	fileName = sprintf('%s%d%s', 'PCA_', k, filesuffix);
	save(fileName, 'X', 'Y');
    
    %[Vd Dd] = eigs(sigma, d);
    %disp(sum(sum(D))/sum(sum(Dd)));
end
