function [u, v] = kernPca(kern, X, numEig)

% KERNPCA performs KPCA.
%
%	Description:
%
%	[U, LAMBDA] = KERNPCA(KERN, Y, DIMS) Performs kernel PCA on a given
%	data set Y.
%	 Returns:
%	  U - the eigenvectors of the kernel matrix.
%	  LAMBDA - the eigenvalues of the kernel matrix.
%	 Arguments:
%	  KERN - the kernel type for performing kernel PCA.
%	  Y - the data matrix with N rows and d columns.
%	  DIMS - the number of dimensions of latent positions to return.
%	
%
%	See also
%	KERNCREATE


%	Copyright (c) 2003, 2006 Neil D. Lawrence
% 	kernPca.m CVS version 1.1
% 	kernPca.m SVN version 1
% 	last update 2007-12-19T07:05:34.000000Z

K = kernCompute(kern, X);
[u, v] = eigs(K, numEig);