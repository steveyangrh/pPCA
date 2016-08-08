function [offset,markSize,colorShort,imgScale,imgShift,niter] = set_params_draw();

niter = 50; % number of 'ginput' runs

% Scatter plot
offset=0.01; % cursor accuracy 1%
markSize=4;
colorShort='bgrcmyk'; % 7 possible colors {'b','r','g','c','m','y','k'}

% Images
imgScale=0.05;
imgShift=0; %.01;


