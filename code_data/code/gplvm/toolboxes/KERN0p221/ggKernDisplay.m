function ggKernDisplay(kern, spacing)

% GGKERNDISPLAY Display parameters of the GG kernel.
%
%	Description:
%
%	GGKERNDISPLAY(KERN) displays the parameters of the radial basis
%	function kernel and the kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	GGKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	GGKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	ggKernDisplay.m SVN version 13
% 	last update 2008-06-05T19:51:06.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('Latent inverse width: %2.4f (length scale %2.4f)\n', ...
        kern.precision_u, 1/sqrt(kern.precision_u));
fprintf(spacing);
fprintf('Gg inverse width: %2.4f (length scale %2.4f)\n', ...
        kern.precision_y, 1/sqrt(kern.precision_y));
fprintf(spacing);
fprintf('Latent variance: %2.4f\n', kern.sigma2_u)
fprintf(spacing);
fprintf('Gg Sigma2_y: %2.4f\n', kern.sigma2_y)
