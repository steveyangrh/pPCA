function returnVal = lvmTwoDPlot(X, lbl, symbol)

% LVMTWODPLOT Helper function for plotting the labels in 2-D.
%
%	Description:
%
%	LVMTWODPLOT(X, LBL, SYMBOL) helper function for plotting an
%	embedding in 2-D with symbols.
%	 Arguments:
%	  X - the data to plot.
%	  LBL - the labels of the data point.
%	  SYMBOL - the symbols to use for the different labels.
%	
%
%	See also
%	LVMSCATTERPLOT, LVMVISUALISE


%	Copyright (c) 2004, 2005, 2006, 2008 Neil D. Lawrence
% 	lvmTwoDPlot.m CVS version 1.5
% 	lvmTwoDPlot.m SVN version 95
% 	last update 2008-10-05T23:06:03.000000Z
if nargin < 2
  lbl = [];
end
if(strcmp(lbl, 'connect'))
  connect = true;
  lbl = [];
else
  connect = false;
end

if nargin < 3
  if isempty(lbl)
    symbol = getSymbols(1);
  else
    symbol = getSymbols(size(lbl,2));
  end
end
axisHand = gca;
returnVal = [];
nextPlot = get(axisHand, 'nextplot');
for i = 1:size(X, 1)
  if i == 2
    set(axisHand, 'nextplot', 'add');
  end
  if ~isempty(lbl)
    labelNo = find(lbl(i, :));
  else
    labelNo = 1;
  end
  try 
    returnVal = [returnVal; plot(X(i, 1), X(i, 2), symbol{labelNo})];
    if connect
      if i>1
        line([X(i-1, 1) X(i, 1)], [X(i-1, 2) X(i, 2)]);
      end
    end
  catch
    if strcmp(lasterr, 'Index exceeds matrix dimensions.')
      error(['Only ' num2str(length(symbol)) ' labels supported (it''s easy to add more!)'])
    end
  end
end
set(axisHand, 'nextplot', nextPlot);
set(returnVal, 'markersize', 10);
set(returnVal, 'linewidth', 2);
