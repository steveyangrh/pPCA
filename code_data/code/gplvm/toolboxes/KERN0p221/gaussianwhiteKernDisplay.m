function gaussianwhiteKernDisplay(kern, spacing)

% GAUSSIANWHITEKERNDISPLAY Display parameters of the GAUSSIAN white kernel.
%
%	Description:
%
%	GAUSSIANWHITEKERNDISPLAY(KERN) displays the parameters of the
%	gaussian white kernel and the kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	GAUSSIANWHITEKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	GAUSSIANWHITEKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	gaussianwhiteKernDisplay.m SVN version 285
% 	last update 2009-03-04T20:53:50.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
for k =1:kern.inputDimension
    fprintf('Gaussian white inverse width input dimension %2f: %2.4f (length scale %2.4f)\n', ...
        k, kern.precisionT(k), 1/sqrt(kern.precisionT(k)));
    fprintf(spacing);
end
fprintf('White noise variance: %2.4f\n', kern.sigma2Noise)
