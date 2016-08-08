function gaussianKernDisplay(kern, spacing)

% GAUSSIANKERNDISPLAY Display parameters of the GAUSSIAN kernel.
%
%	Description:
%
%	GAUSSIANKERNDISPLAY(KERN) displays the parameters of the radial
%	basis function kernel and the kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	GAUSSIANKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	GAUSSIANKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	gaussianKernDisplay.m SVN version 13
% 	last update 2008-06-05T19:48:10.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('Gaussian inverse width: %2.4f (length scale %2.4f)\n', ...
        kern.precision_u, 1/sqrt(kern.precision_u));
fprintf(spacing);
fprintf('Gaussian variance: %2.4f\n', kern.sigma2_u)
