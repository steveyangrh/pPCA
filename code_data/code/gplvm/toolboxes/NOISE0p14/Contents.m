% NOISE toolbox
% Version 0.14		Saturday 13 Jan 2007 at 00:58
% Copyright (c) 2007 Neil D. Lawrence
% 
% CMPNDNOISE3DPLOT Draws a 3D or contour plot for the CMPND noise model.
% CMPNDNOISEDISPLAY Display parameters of the CMPND noise.
% CMPNDNOISEEXPANDPARAM Create noise structure from CMPND noise's parameters.
% CMPNDNOISEEXTRACTPARAM Extract parameters from the CMPND noise structure.
% CMPNDNOISEGRADIENTPARAM Gradient of CMPND noise's parameters.
% CMPNDNOISEGRADVALS Gradient of CMPND noise log Z with respect to input mean and variance.
% CMPNDNOISELIKELIHOOD Likelihood of the data under the CMPND noise model.
% CMPNDNOISELOGLIKELIHOOD Log likelihood of the data under the CMPND noise model.
% CMPNDNOISENUG  Update nu and g parameters associated with compound noise model.
% CMPNDNOISEOUT Compute the output of the CMPND noise given the input mean and variance.
% CMPNDNOISEPARAMINIT CMPND noise parameter initialisation.
% CMPNDNOISEPOINTPLOT Plot the data-points for the CMPND noise model.
% CMPNDNOISESITES Site updates for compound noise model.
% GAUSSIANNOISE3DPLOT Draws a 3D or contour plot for the GAUSSIAN noise model.
% GAUSSIANNOISEDISPLAY Display parameters of the GAUSSIAN noise.
% GAUSSIANNOISEEXPANDPARAM Create noise structure from GAUSSIAN noise's parameters.
% GAUSSIANNOISEEXTRACTPARAM Extract parameters from the GAUSSIAN noise structure.
% GAUSSIANNOISEGRADIENTPARAM Gradient of GAUSSIAN noise's parameters.
% GAUSSIANNOISEGRADVALS Gradient of GAUSSIAN noise log Z with respect to input mean and variance.
% GAUSSIANNOISELIKELIHOOD Likelihood of the data under the GAUSSIAN noise model.
% GAUSSIANNOISELOGLIKELIHOOD Log likelihood of the data under the GAUSSIAN noise model.
% GAUSSIANNOISENUG Compute nu and g for GAUSSIAN noise model.
% GAUSSIANNOISEOUT Compute the output of the GAUSSIAN noise given the input mean and variance.
% GAUSSIANNOISEPARAMINIT GAUSSIAN noise parameter initialisation.
% GAUSSIANNOISEPOINTPLOT Plot the data-points for the GAUSSIAN noise model.
% GAUSSIANNOISESITES Update the site parameters for the GAUSSIAN noise mode.
% MGAUSSIANNOISE3DPLOT Draws a 3D or contour plot for the MGAUSSIAN noise model.
% MGAUSSIANNOISEDISPLAY Display parameters of the MGAUSSIAN noise.
% MGAUSSIANNOISEEXPANDPARAM Create noise structure from MGAUSSIAN noise's parameters.
% MGAUSSIANNOISEEXTRACTPARAM Extract parameters from the MGAUSSIAN noise structure.
% MGAUSSIANNOISEGRADIENTPARAM Gradient of MGAUSSIAN noise's parameters.
% MGAUSSIANNOISEGRADVALS Gradient of MGAUSSIAN noise log Z with respect to input mean and variance.
% MGAUSSIANNOISELIKELIHOOD Likelihood of the data under the MGAUSSIAN noise model.
% MGAUSSIANNOISELOGLIKELIHOOD Log likelihood of the data under the MGAUSSIAN noise model.
% MGAUSSIANNOISEOUT Compute the output of the MGAUSSIAN noise given the input mean and variance.
% MGAUSSIANNOISEPARAMINIT MGAUSSIAN noise parameter initialisation.
% MGAUSSIANNOISEPOINTPLOT Plot the data-points for the MGAUSSIAN noise model.
% NCNMNOISE3DPLOT Draw a 3D or contour plot for the NCNM noise model.
% NCNMNOISEDISPLAY Display  parameters from null category noise model.
% NCNMNOISEEXPANDPARAM Expand null category noise model's structure from param vector.
% NCNMNOISEEXTRACTPARAM Extract parameters from null category noise model.
% NCNMNOISEGRADIENTPARAM Gradient of parameters for NCNM.
% NCNMNOISEGRADVALS Compute gradient with respect to inputs to noise model.
% NCNMNOISELIKELIHOOD Likelihood of data under null category noise model.
% NCNMNOISELOGLIKELIHOOD Log-likelihood of data under null category noise model.
% NCNMNOISENUG Update nu and g parameters associated with null category noise model.
% NCNMNOISEOUT Ouput from null category noise model.
% NCNMNOISEPARAMINIT null category noise model's parameter initialisation.
% NCNMNOISEPOINTPLOT Plot the data-points for null category noise model.
% NCNMNOISESITES Site updates for null category model.
% NEGNOISEGRADIENTPARAM Wrapper function for calling noise gradients.
% NEGNOISELOGLIKELIHOOD Wrapper function for calling noise likelihoods.
% NGAUSSNOISE3DPLOT Draws a 3D or contour plot for the NGAUSS noise model.
% NGAUSSNOISEDISPLAY Display parameters of the NGAUSS noise.
% NGAUSSNOISEEXPANDPARAM Create noise structure from NGAUSS noise's parameters.
% NGAUSSNOISEEXTRACTPARAM Extract parameters from the NGAUSS noise structure.
% NGAUSSNOISEGRADIENTPARAM Gradient of NGAUSS noise's parameters.
% NGAUSSNOISEGRADVALS Gradient of NGAUSS noise log Z with respect to input mean and variance.
% NGAUSSNOISELIKELIHOOD Likelihood of the data under the NGAUSS noise model.
% NGAUSSNOISELOGLIKELIHOOD Log likelihood of the data under the NGAUSS noise model.
% NGAUSSNOISENUG Update nu and g parameters associated with noiseless Gaussian noise model.
% NGAUSSNOISEOUT Compute the output of the NGAUSS noise given the input mean and variance.
% NGAUSSNOISEPARAMINIT NGAUSS noise parameter initialisation.
% NGAUSSNOISEPOINTPLOT Plot the data-points for the NGAUSS noise model.
% NGAUSSNOISESITES Site updates for noiseless Gaussian noise model.
% NOISE3DPLOT Draw a 3D or contour plot for the relevant noise model.
% NOISECREATE Initialise a noise structure.
% NOISEDISPLAY Display the parameters of the noise model.
% NOISEEXPANDPARAM Expand the noise model's parameters from params vector.
% NOISEEXTRACTPARAM Extract the noise model's parameters.
% NOISEGRADIENTPARAM Gradient wrt the noise model's parameters.
% NOISEGRADVALS Gradient of noise model wrt mu and varsigma.
% NOISEGRADX Returns the gradient of the log-likelihood wrt x.
% NOISELIKELIHOOD Return the likelihood for each point under the noise model.
% NOISELOGLIKELIHOOD Return the log-likelihood under the noise model.
% NOISEOUT Give the output of the noise model given the mean and variance.
% NOISEPARAMINIT Noise model's parameter initialisation.
% NOISEPOINTPLOT Plot the data-points for the given noise model.
% NOISEREADFROMFID Load from an FID written by the C++ implementation.
% NOISEREADPARAMSFROMFID Read the noise parameters from C++ file FID.
% NOISETEST Run some tests on the specified noise model.
% NOISEUPDATENUG Update nu and g for a given noise model.
% NOISEUPDATESITES Update site parameters for a given noise model.
% ORDEREDGRADX Gradient wrt x of log-likelihood for Ordered categorical model.
% ORDEREDNOISE3DPLOT Draws a 3D or contour plot for the ORDERED noise model.
% ORDEREDNOISEDISPLAY Display parameters of the ORDERED noise.
% ORDEREDNOISEEXPANDPARAM Create noise structure from ORDERED noise's parameters.
% ORDEREDNOISEEXTRACTPARAM Extract parameters from the ORDERED noise structure.
% ORDEREDNOISEGRADIENTPARAM Gradient of ORDERED noise's parameters.
% ORDEREDNOISEGRADVALS Gradient of ORDERED noise log Z with respect to input mean and variance.
% ORDEREDNOISELIKELIHOOD Likelihood of the data under the ORDERED noise model.
% ORDEREDNOISELOGLIKELIHOOD Log likelihood of the data under the ORDERED noise model.
% ORDEREDNOISEOUT Compute the output of the ORDERED noise given the input mean and variance.
% ORDEREDNOISEPARAMINIT ORDERED noise parameter initialisation.
% ORDEREDNOISEPOINTPLOT Plot the data-points for the ORDERED noise model.
% ORDEREDNOISEUPDATEPARAMS Update parameters for ordered categorical noise model.
% PROBIT3DPLOT Draw a 3D or contour plot for the probit.
% PROBITNOISE3DPLOT Draws a 3D or contour plot for the PROBIT noise model.
% PROBITNOISEDISPLAY Display parameters of the PROBIT noise.
% PROBITNOISEEXPANDPARAM Create noise structure from PROBIT noise's parameters.
% PROBITNOISEEXTRACTPARAM Extract parameters from the PROBIT noise structure.
% PROBITNOISEGRADIENTPARAM Gradient of PROBIT noise's parameters.
% PROBITNOISEGRADVALS Gradient of PROBIT noise log Z with respect to input mean and variance.
% PROBITNOISELIKELIHOOD Likelihood of the data under the PROBIT noise model.
% PROBITNOISELOGLIKELIHOOD Log likelihood of the data under the PROBIT noise model.
% PROBITNOISEOUT Compute the output of the PROBIT noise given the input mean and variance.
% PROBITNOISEPARAMINIT PROBIT noise parameter initialisation.
% PROBITNOISEPOINTPLOT Plot the data-points for the PROBIT noise model.
% SCALENOISEDISPLAY Display the parameters of the scaled noise model.
% SCALENOISEEXPANDPARAM Expand Scale noise structure from param vector.
% SCALENOISEOUT A simple noise model that scales and centres the data.
% SCALENOISEPARAMINIT Scale noise model's parameter initialisation.
% SCALENOISESITES Site updates for Scale noise model.
