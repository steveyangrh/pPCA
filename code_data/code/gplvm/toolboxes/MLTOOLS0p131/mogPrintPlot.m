function mogPrintPlot(model, lbls, capName, experimentNo)

% MOGPRINTPLOT Print projection of MOG into two dimensions.
%
%	Description:
%
%	MOGPRINTPLOT(MODEL, LBLS, CAPNAME, EXPERIMENTNO) prints a projection
%	of mixtures of Gaussians into two dimensions.
%	 Arguments:
%	  MODEL - the model to use for plotting the latent space.
%	  LBLS - any lables that are available for plotting.
%	  CAPNAME - the name of the saved plots.
%	  EXPERIMENTNO - the experiment number to assign to the files.
%	
%
%	See also
%	MOGSCATTERPLOT


%	Copyright (c) 2008 Neil D. Lawrence
% 	mogPrintPlot.m SVN version 24
% 	last update 2008-07-03T13:06:10.000000Z

if model.d>2
  model = mogProject(model, 2);
end

modelType = model.type;
modelType(1) = upper(modelType(1));


fileName = ['dem' capName modelType num2str(experimentNo)];

clf
ax = axes('position', [0.05 0.05 0.9 0.9]);
hold on
if ~isempty(lbls) && ~strcmp(lbls, 'connect')
  mogTwoDPlot(model, lbls, getSymbols(size(lbls, 2)));
else
  mogTwoDPlot(model, lbls);
end


piVals = linspace(-pi, pi, 200)';
for i=1:model.m
  a = line(model.mean(i, 1), model.mean(i, 2), 'marker', 'o');
  set(a, 'linewidth', 2, 'markersize', 10)
  x = [sin(piVals) cos(piVals)];
  el = x*model.U{i};
  line(model.mean(i, 1) + el(:, 1), model.mean(i, 2) + el(:, 2), ...
      'linewidth', 2);
end
xLim = [min(model.Y(:, 1)) max(model.Y(:, 1))]*1.1;
yLim = [min(model.Y(:, 2)) max(model.Y(:, 2))]*1.1;
set(ax, 'xLim', xLim);
set(ax, 'yLim', yLim);
set(gca, 'fontsize', 20);
print('-depsc', ['../tex/diagrams/' fileName])
print('-deps', ['../tex/diagrams/' fileName 'NoColour'])

% make smaller for PNG plot.
pos = get(gcf, 'paperposition')
origpos = pos;
pos(3) = pos(3)/2;
pos(4) = pos(4)/2;
set(gcf, 'paperposition', pos);
fontsize = get(gca, 'fontsize');
set(gca, 'fontsize', fontsize/2);
lineWidth = get(gca, 'lineWidth');
set(gca, 'lineWidth', lineWidth*2);
print('-dpng', ['../html/' fileName])
set(gcf, 'paperposition', origpos);

figure
clf
ax = axes('position', [0.05 0.05 0.9 0.9]);
hold on
if ~isempty(lbls) && ~strcmp(lbls, 'connect')
  mogTwoDPlot(model, lbls, getSymbols(size(lbls, 2)));
else
  mogTwoDPlot(model, lbls);
end

%xLim = [min(model.Y(:, 1)) max(model.Y(:, 1))]*1.1;
%yLim = [min(model.Y(:, 2)) max(model.Y(:, 2))]*1.1;
set(ax, 'xLim', xLim);
set(ax, 'yLim', yLim);

set(ax, 'fontname', 'arial');
set(ax, 'fontsize', 20);
print('-depsc', ['../tex/diagrams/' fileName 'NoOvals'])
print('-deps', ['../tex/diagrams/' fileName 'NoOvalsNoColour'])
