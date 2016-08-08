function draw_data(X,Y,labels,imgs)

% Parameters
[offset,markSize,colorShort,imgScale,imgShift,niter] = set_params_draw();

% Image size
  rangeX=max(X)-min(X); rangeY=max(Y)-min(Y);
  range=min(rangeX,rangeY);
  imgSize=imgScale*range;

% ------------
% MAIN
nLabels = length(unique(labels));

% Scatter plot
figure; hold on; 
axis equal;
h = gscatter(X,Y,labels,colorShort(1:nLabels),'o',markSize);

% Set marker color 'filled'
for i=1:nLabels
     set(h(i), 'MarkerFaceColor', colorShort(i));
end
 
% Draw images for individual sample
idSamplePressed=[];
for i=1:niter
  
  % Draw image for one sample
  [x_in,y_in]=ginput(1);
  if (length(x_in) < 1)
    break
  end

  idSample = find_sample_id(X,Y,x_in,y_in,offset); 
  
  if ~isempty(find(idSamplePressed == idSample))
    disp('Press next sample or ENTER to finish.');  
  elseif idSample > 0
    colormap(gray);
    imgSample=imgs(:,:,idSample)*255;

    %% Image is in a center of a pressed point
    %imagesc([ x_in-imgSize x_in+imgSize ],[y_in+imgSize y_in-imgSize],imgSample);
   
    % Image is in a center of a sample
    x_id=X(idSample);
    y_id=Y(idSample);
    %imagesc([ x_id-imgSize x_id+imgSize ],[y_id+imgSize y_id-imgSize],imgSample); 
    imagesc([ x_id+imgShift x_id+imgSize+imgShift ],[y_id y_id-imgSize],imgSample);

    idSamplePressed = [ idSamplePressed idSample];
  else
    disp('Press region where data are available or ENTER to finish.')
  end
  
end



