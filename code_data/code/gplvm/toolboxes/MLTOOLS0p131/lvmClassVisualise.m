function lvmClassVisualise(call)

% LVMCLASSVISUALISE Callback function for visualising data in 2-D.
%
%	Description:
%	lvmClassVisualise(call)
%% 	lvmClassVisualise.m CVS version 1.4
% 	lvmClassVisualise.m SVN version 24
% 	last update 2007-11-03T14:24:26.000000Z

global visualiseInfo


switch call
 case 'click'
  [x, y]  = localCheckPointPosition(visualiseInfo);  
  if ~isempty(x) 
    visualiseInfo.latentPos = [x, y];
  end
  visualiseInfo.clicked = ~visualiseInfo.clicked;
  if isfield(visualiseInfo.model, 'dynamics') & ~isempty(visualiseInfo.model.dynamics)
    if visualiseInfo.runDynamics
      visualiseInfo.dynamicsRunning = 1;
      fhandle = str2func([visualiseInfo.model.type 'DynamicsRun']);
      feval(fhandle);
      visualiseInfo.dynamicsRunning = 0;
    end
  else
    visualiseInfo.dynamicsRunning = 0;
  end
 case 'move'
  if visualiseInfo.clicked & ~visualiseInfo.runDynamics
    [x, y]  = localCheckPointPosition(visualiseInfo);  
    if ~isempty(x) 
      % This should be changed to a model specific visualisation.
      set(visualiseInfo.latentHandle, 'xdata', x, 'ydata', y);
      fhandle = str2func([visualiseInfo.model.type 'PosteriorMeanVar']);
      [mu, varsigma] = fhandle(visualiseInfo.model, [x y]);
      if isfield(visualiseInfo.model, 'noise')
        Y = noiseOut(visualiseInfo.model.noise, mu, varsigma);
      else
        Y = mu;
      end
      visualiseInfo.visualiseModify(visualiseInfo.visHandle, ...
                                    Y, visualiseInfo.varargin{:});
      visualiseInfo.latentPos=[x, y];
    end
  end
 case 'toggleDynamics'
  visualiseInfo.runDynamics = ~visualiseInfo.runDynamics;
  set(visualiseInfo.dynamicsRadio, 'value', visualiseInfo.runDynamics);

 case 'dynamicsSliderChange'
  X = modelOut(visualiseInfo.model.dynamics, get(visualiseInfo.dynamicsSlider, 'value'));
  x = X(1);
  y = X(2);
  visualiseInfo.latentPos = [x, y];
  set(visualiseInfo.latentHandle, 'xdata', x, 'ydata', y);
  fhandle = str2func([visualiseInfo.model.type 'PosteriorMeanVar']);
  [mu, varsigma] = fhandle(visualiseInfo.model, [x y]);
  if isfield(visualiseInfo.model, 'noise')
    Y = noiseOut(visualiseInfo.model.noise, mu, varsigma);
  else
    Y = mu;
  end
  visualiseInfo.visualiseModify(visualiseInfo.visHandle, ...
                                Y, visualiseInfo.varargin{:});
end




function point = localGetNormCursorPoint(figHandle)

point = get(figHandle, 'currentPoint');
figPos = get(figHandle, 'Position');
% Normalise the point of the curstor
point(1) = point(1)/figPos(3);
point(2) = point(2)/figPos(4);

function [x, y] = localGetNormAxesPoint(point, axesHandle)

position = get(axesHandle, 'Position');
x = (point(1) - position(1))/position(3);
y = (point(2) - position(2))/position(4);
lim = get(axesHandle, 'XLim');
x = x*(lim(2) - lim(1));
x = x + lim(1);
lim = get(axesHandle, 'YLim');
y = y*(lim(2) - lim(1));
y = y + lim(1);


function [x, y] = localCheckPointPosition(visualiseInfo)

% Get the point of the cursor
point = localGetNormCursorPoint(gcf);

% get the position of the axes
position = get(visualiseInfo.plotAxes, 'Position');


% Check if the pointer is in the axes
if point(1) > position(1) ...
      & point(1) < position(1) + position(3) ...
      & point(2) > position(2) ...
      & point(2) < position(2) + position(4);
  
  % Rescale the point according to the axes
  [x y] = localGetNormAxesPoint(point, visualiseInfo.plotAxes);

  % Find the nearest point
else
  % Return nothing
  x = [];
  y = [];
end
