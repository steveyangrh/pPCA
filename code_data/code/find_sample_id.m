function idSample = find_sample_id(X,Y,x_in,y_in,offset)

marginX=offset*(max(X)-min(X)); % margin
marginY=offset*(max(Y)-min(Y)); % margin

samples=1:size(X,1); % number of samples
candidateX_right = samples( X > (x_in-marginX));
candidateX_left = samples( X < (x_in+marginX));
candidateX = intersect(candidateX_right,candidateX_left);

candidateY_right = samples( Y > (y_in-marginY));
candidateY_left = samples( Y < (y_in+marginY));
candidateY = intersect(candidateY_right,candidateY_left);

candidate = intersect(candidateX,candidateY);
if length(candidate)<1
  idSample = 0;
  return;
end

idSample = candidate(1); % in case of many, taking the first one