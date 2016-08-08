function simKernDisplay(kern, spacing)

% SIMKERNDISPLAY Display parameters of the SIM kernel.
%
%	Description:
%
%	SIMKERNDISPLAY(KERN) displays the parameters of the single input
%	motif kernel and the kernel type to the console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	SIMKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%	
%
%	See also
%	SIMKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2006 Neil D. Lawrence


%	With modifications by David Luengo 2009
% 	simKernDisplay.m CVS version 1.1
% 	simKernDisplay.m SVN version 194
% 	last update 2009-01-21T15:36:38.000000Z

if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
fprintf('SIM decay: %2.4f\n', kern.decay)
fprintf(spacing);
fprintf('SIM inverse width: %2.4f (length scale %2.4f)\n', ...
        kern.inverseWidth, 1/sqrt(kern.inverseWidth));
fprintf(spacing);
fprintf('SIM Variance: %2.4f\n', kern.variance)
%fprintf(spacing);
%fprintf('SIM Sensitivity: %2.4f\n', kern.sensitivity)
%fprintf(spacing);
%fprintf('SIM delay: %2.4f\n', kern.delay)
