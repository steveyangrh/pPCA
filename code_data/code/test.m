function test()

close all;
method='ToyData';
method='gplvmPcaInit';

flag_visualizeDigit=0;

%-----------------
% Add paths
add_toolboxes();

%%%%%%%%%%%%%%%%%%%
% Load MNIST dataset 
nSamples=10000;
digitsList=[1 2 3 4 5];

[imgs,labels] = load_mnist_dataset(nSamples,digitsList);

%----------
%   examples
if flag_visualizeDigit
  vdigit = 5; 
  maxrow = 4; maxcol = 4;
  
  img_vdigit = imgs(:,:,labels==vdigit);

  figure;
  for i=1:maxrow*maxcol
    subplot(maxrow,maxcol,i);
    imshow(img_vdigit(:,:,i));
  end
end

%-----------
%% Dimensionality Reduction






if strcmp(method,'PCA')
  X=0;
  Y=0;

elseif strcmp(method,'gplvmPcaInit')
  imgs_r=reshape(imgs,size(imgs,1)*size(imgs,2),size(imgs,3))'; % [column1; column2; ...]
  tmp = gplvmPcaInit(imgs_r, 2); %reducing to two dimentions
  X = tmp(:,1);
  Y = tmp(:,2);
  
%    imgs_r=imgs_r';
 
  
%  400x101

% X -out [], Y-in []
%  size(Y) 3000         256
%  size(X) 3000           2

%-----------
%  X = gplvmPcaInit(Y, 2);
%  [X, sigma2] = ppcaEmbed(Y, dims);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif strcmp(method,'ToyData') %% TOY DATA, Not normalized
  npsamp=length(labels);
  X = rand(npsamp,1)*2;
  Y = rand(npsamp,1)*0.6;
end

%----------
%% Visualize Dimensionality Reduction

%  offset=0.03; % accuracy of a cursor 3%
draw_data(X,Y,labels,imgs)




