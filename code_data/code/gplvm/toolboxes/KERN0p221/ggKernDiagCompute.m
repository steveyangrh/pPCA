function K = ggKernDiagCompute(kern, x)

% GGKERNDIAGCOMPUTE Compute diagonal of GG kernel.
%
%	Description:
%
%	K = GGKERNDIAGCOMPUTE(KERN) computes the diagonal of the kernel
%	matrix for the gaussian gaussian kernel given a design matrix of
%	inputs.
%	 Returns:
%	  K - a vector containing the diagonal of the kernel matrix computed
%	   at the given points.
%	 Arguments:
%	  KERN - the kernel structure for which the matrix is computed. X :
%	   input data matrix in the form of a design matrix.
%	
%
%	See also
%	GGKERNPARAMINIT, KERNDIAGCOMPUTE, KERNCREATE, GGKERNCOMPUTE


%	Copyright (c) 2008 Mauricio A. Alvarez and Neil D. Lawrence
% 	ggKernDiagCompute.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z



Ank = kern.precision_y;
Bk = kern.precision_u;
Ankinv = 1./Ank;
Bkinv = 1./Bk;
detBkinv = prod(Bkinv);
P = 2*Ankinv + Bkinv;
ldet = prod(P);
K = repmat(kern.sigma2_y^2*kern.sigma2_u*sqrt((detBkinv)/ldet), ...
    size(x,1),1);
