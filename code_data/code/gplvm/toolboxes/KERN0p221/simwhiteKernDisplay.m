function simwhiteKernDisplay(kern, spacing)

% SIMWHITEKERNDISPLAY Display parameters of the SIM-WHITE kernel.
%
%	Description:
%
%	SIMWHITEKERNDISPLAY(KERN) displays the parameters of the SIM-White
%	(Single Input Motif - White) kernel and the kernel type to the
%	console.
%	 Arguments:
%	  KERN - the kernel to display.
%
%	SIMWHITEKERNDISPLAY(KERN, SPACING)
%	 Arguments:
%	  KERN - the kernel to display.
%	  SPACING - how many spaces to indent the display of the kernel by.
%	
%
%	See also
%	SIMWHITEKERNPARAMINIT, MODELDISPLAY, KERNDISPLAY


%	Copyright (c) 2009 David Luengo
% 	simwhiteKernDisplay.m SVN version 275
% 	last update 2009-03-04T20:53:57.000000Z


if nargin > 1
  spacing = repmat(32, 1, spacing);
else
  spacing = [];
end
spacing = char(spacing);
fprintf(spacing);
if kern.isStationary
    fprintf('Stationary version of the kernel\n');
else
    fprintf('Non-stationary version of the kernel\n');
end
fprintf(spacing);
fprintf('SIM decay: %2.4f\n', kern.decay);
fprintf(spacing);
fprintf('SIM-White variance: %2.4f\n', kern.variance);
fprintf(spacing);
fprintf('SIM-White sensitivity: %2.4f\n', kern.sensitivity);
%fprintf(spacing);
%fprintf('SIM delay: %2.4f\n', kern.delay)