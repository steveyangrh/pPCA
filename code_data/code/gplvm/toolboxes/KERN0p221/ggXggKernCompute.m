function [K, Linv, Ankinv, Amkinv, Bkinv] = ggXggKernCompute(ggKern1, ggKern2, x, x2)

% GGXGGKERNCOMPUTE Compute a cross kernel between two GG kernels.
%
%	Description:
%
%	K = GGXGGKERNCOMPUTE(GGKERN1, GGKERN2, X) computes cross kernel
%	terms between two GG kernels for the multiple output kernel.
%	 Returns:
%	  K - block of values from kernel matrix.
%	 Arguments:
%	  GGKERN1 - the kernel structure associated with the first GG
%	  GGKERN2 - the kernel structure associated with the second GG
%	   kernel.
%	  X - inputs for which kernel is to be computed.
%	DESC computes cross
%	kernel terms between two GG kernels for the multiple output kernel.
%	RETURN K :  block of values from kernel matrix.
%	ARG ggkern1 : the kernel structure associated with the first GG kernel.
%	ARG ggkern2 : the kernel structure associated with the second GG kernel.
%	ARG x : row inputs for which kernel is to be computed.
%	ARG x2 : column inputs for which kernel is to be computed.
%	
%	
%	
%
%	See also
%	MULTIKERNPARAMINIT, MULTIKERNCOMPUTE, GGKERNPARAMINIT


%	Copyright (c) 2006 Neil D. Lawrence


%	With modifications by Mauricio A. Alvarez 2008
% 	ggXggKernCompute.m SVN version 1
% 	last update 2008-05-30T23:26:31.000000Z

if nargin < 4
  x2 = x;
end
Ank = ggKern1.precision_y;
Amk = ggKern2.precision_y;
Bk = ggKern1.precision_u;
mu_n = ggKern1.translation;
mu_m = ggKern2.translation;
Ankinv = 1./Ank;
Amkinv = 1./Amk;
Bkinv = 1./Bk;
detBkinv = prod(Bkinv);
P = Ankinv + Amkinv + Bkinv;
ldet = prod(P);
Linv = sqrt(1./P);
Linvx = (x- repmat(mu_n',size(x,1),1))*diag(Linv);
Linvx2 = (x2- repmat(mu_m',size(x2,1),1))*diag(Linv);
n2 = dist2(Linvx, Linvx2);
K = ggKern1.sigma2_y*ggKern2.sigma2_y*ggKern1.sigma2_u*sqrt((detBkinv)/ldet)...
    *exp(-0.5*n2);

