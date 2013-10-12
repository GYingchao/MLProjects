function [ ret ] = PCA (dataFile, k)
	% Load the data source
	load(dataFile);
	% d stands for # of dimensions and n stands for # of samples in the data source matrix(d by n)
	clear gnd;
	[n d] = size(fea);
	% Check the validation of input k
	if k >= (d-1) 
		disp('Nothing to do with dimensionality reduction..');
		exit(-1);
    end
	% Here comes the SVD
	% First we compute the mean of raw data defined as mu
	mu = sum(fea)/n;
	% Then we compute the covariate matrix defined as sigma
	temp = bsxfun(@minus, fea, mu);
 	sigma = temp*temp'/n;
 	[V, D] = eigs(sigma, k);
%     V
%     D
endfunction
