function imgs_r=dataformat_mnist_gplvm(imgs)

imgs_r=reshape(imgs,size(imgs,1)*size(imgs,2),size(imgs,3))';