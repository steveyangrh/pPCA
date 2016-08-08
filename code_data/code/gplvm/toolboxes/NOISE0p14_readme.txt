NOISE software
Version 0.14		Saturday 13 Jan 2007 at 00:58
Copyright (c) 2007 Neil D. Lawrence

Version 0.14 Release Notes
--------------------------

Much improved documentation and merging of NCNM noise model into this toolbox from the NCNM toolbox.

Version 0.131 Release Notes
---------------------------

There was a sign error in lnDiffCumGaussian and a corresponding sign error in orderedLogLikelihood. This has now been fixed.


Version 0.13 Release Notes
--------------------------

This code no longer runs under MATLAB 6.0. It now requires MATLAB 7.0 or higher to run. 

Version 0.121 Release Notes
---------------------------

Included a `scale' noise type for use with the GPLVM which allows for scaling the outputs on the GPLVM. This noise model is not designed for normal use with the IVM.

Added noiseReadFromFID.m for reading a noise model from a file written by the C++ code.

Version 0.12 Release Notes
--------------------------

This toolbox implements different noise models for the IVM toolbox from version 0.31.

Interaction with the toolbox is done through the interface files which are prefixed by `noise'. 

The toolbox was spun out of the IVM toolbox, and most of the files are based on files in IVM 0.221.

Noise Types
-----------

Three main noise models are also provided:

      'gaussian' is the standard Gaussian noise model.

      'probit' is the probit model for classification.

      'ordered' is an ordered categorical model based on the probit.

Also there is

      'cmpnd' is for associating different noise models to different processes when learning multiple processes together. The ability to learn multiple processes is mainly included so that the next release of GPLVM code can use this IVM code base, but it may also be useful for multi-class classification noise models.

      'mgaussian' which is designed to allow multiple processes to have individually different variances (mainly for the GPLVM).

The perl script for generating code for new noise models is noiseGenerator.pl

It is run with two arguments, the first is the short name for the noise model, e.g. gaussian, the second is the long name, e.g. Gaussian\ noise\ model.


MATLAB Files
------------

Matlab files associated with the toolbox are:

cmpndNoise3dPlot.m: Draws a 3D or contour plot for the CMPND noise model.
cmpndNoiseDisplay.m: Display parameters of the CMPND noise.
cmpndNoiseExpandParam.m: Create noise structure from CMPND noise's parameters.
cmpndNoiseExtractParam.m: Extract parameters from the CMPND noise structure.
cmpndNoiseGradientParam.m: Gradient of CMPND noise's parameters.
cmpndNoiseGradVals.m: Gradient of CMPND noise log Z with respect to input mean and variance.
cmpndNoiseLikelihood.m: Likelihood of the data under the CMPND noise model.
cmpndNoiseLogLikelihood.m: Log likelihood of the data under the CMPND noise model.
cmpndNoiseNuG.m:  Update nu and g parameters associated with compound noise model.
cmpndNoiseOut.m: Compute the output of the CMPND noise given the input mean and variance.
cmpndNoiseParamInit.m: CMPND noise parameter initialisation.
cmpndNoisePointPlot.m: Plot the data-points for the CMPND noise model.
cmpndNoiseSites.m: Site updates for compound noise model.
gaussianNoise3dPlot.m: Draws a 3D or contour plot for the GAUSSIAN noise model.
gaussianNoiseDisplay.m: Display parameters of the GAUSSIAN noise.
gaussianNoiseExpandParam.m: Create noise structure from GAUSSIAN noise's parameters.
gaussianNoiseExtractParam.m: Extract parameters from the GAUSSIAN noise structure.
gaussianNoiseGradientParam.m: Gradient of GAUSSIAN noise's parameters.
gaussianNoiseGradVals.m: Gradient of GAUSSIAN noise log Z with respect to input mean and variance.
gaussianNoiseLikelihood.m: Likelihood of the data under the GAUSSIAN noise model.
gaussianNoiseLogLikelihood.m: Log likelihood of the data under the GAUSSIAN noise model.
gaussianNoiseNuG.m: Compute nu and g for GAUSSIAN noise model.
gaussianNoiseOut.m: Compute the output of the GAUSSIAN noise given the input mean and variance.
gaussianNoiseParamInit.m: GAUSSIAN noise parameter initialisation.
gaussianNoisePointPlot.m: Plot the data-points for the GAUSSIAN noise model.
gaussianNoiseSites.m: Update the site parameters for the GAUSSIAN noise mode.
mgaussianNoise3dPlot.m: Draws a 3D or contour plot for the MGAUSSIAN noise model.
mgaussianNoiseDisplay.m: Display parameters of the MGAUSSIAN noise.
mgaussianNoiseExpandParam.m: Create noise structure from MGAUSSIAN noise's parameters.
mgaussianNoiseExtractParam.m: Extract parameters from the MGAUSSIAN noise structure.
mgaussianNoiseGradientParam.m: Gradient of MGAUSSIAN noise's parameters.
mgaussianNoiseGradVals.m: Gradient of MGAUSSIAN noise log Z with respect to input mean and variance.
mgaussianNoiseLikelihood.m: Likelihood of the data under the MGAUSSIAN noise model.
mgaussianNoiseLogLikelihood.m: Log likelihood of the data under the MGAUSSIAN noise model.
mgaussianNoiseOut.m: Compute the output of the MGAUSSIAN noise given the input mean and variance.
mgaussianNoiseParamInit.m: MGAUSSIAN noise parameter initialisation.
mgaussianNoisePointPlot.m: Plot the data-points for the MGAUSSIAN noise model.
ncnmNoise3dPlot.m: Draw a 3D or contour plot for the NCNM noise model.
ncnmNoiseDisplay.m: Display  parameters from null category noise model.
ncnmNoiseExpandParam.m: Expand null category noise model's structure from param vector.
ncnmNoiseExtractParam.m: Extract parameters from null category noise model.
ncnmNoiseGradientParam.m: Gradient of parameters for NCNM.
ncnmNoiseGradVals.m: Compute gradient with respect to inputs to noise model.
ncnmNoiseLikelihood.m: Likelihood of data under null category noise model.
ncnmNoiseLogLikelihood.m: Log-likelihood of data under null category noise model.
ncnmNoiseNuG.m: Update nu and g parameters associated with null category noise model.
ncnmNoiseOut.m: Ouput from null category noise model.
ncnmNoiseParamInit.m: null category noise model's parameter initialisation.
ncnmNoisePointPlot.m: Plot the data-points for null category noise model.
ncnmNoiseSites.m: Site updates for null category model.
negNoiseGradientParam.m: Wrapper function for calling noise gradients.
negNoiseLogLikelihood.m: Wrapper function for calling noise likelihoods.
ngaussNoise3dPlot.m: Draws a 3D or contour plot for the NGAUSS noise model.
ngaussNoiseDisplay.m: Display parameters of the NGAUSS noise.
ngaussNoiseExpandParam.m: Create noise structure from NGAUSS noise's parameters.
ngaussNoiseExtractParam.m: Extract parameters from the NGAUSS noise structure.
ngaussNoiseGradientParam.m: Gradient of NGAUSS noise's parameters.
ngaussNoiseGradVals.m: Gradient of NGAUSS noise log Z with respect to input mean and variance.
ngaussNoiseLikelihood.m: Likelihood of the data under the NGAUSS noise model.
ngaussNoiseLogLikelihood.m: Log likelihood of the data under the NGAUSS noise model.
ngaussNoiseNuG.m: Update nu and g parameters associated with noiseless Gaussian noise model.
ngaussNoiseOut.m: Compute the output of the NGAUSS noise given the input mean and variance.
ngaussNoiseParamInit.m: NGAUSS noise parameter initialisation.
ngaussNoisePointPlot.m: Plot the data-points for the NGAUSS noise model.
ngaussNoiseSites.m: Site updates for noiseless Gaussian noise model.
noise3dPlot.m: Draw a 3D or contour plot for the relevant noise model.
noiseCreate.m: Initialise a noise structure.
noiseDisplay.m: Display the parameters of the noise model.
noiseExpandParam.m: Expand the noise model's parameters from params vector.
noiseExtractParam.m: Extract the noise model's parameters.
noiseGradientParam.m: Gradient wrt the noise model's parameters.
noiseGradVals.m: Gradient of noise model wrt mu and varsigma.
noiseGradX.m: Returns the gradient of the log-likelihood wrt x.
noiseLikelihood.m: Return the likelihood for each point under the noise model.
noiseLogLikelihood.m: Return the log-likelihood under the noise model.
noiseOut.m: Give the output of the noise model given the mean and variance.
noiseParamInit.m: Noise model's parameter initialisation.
noisePointPlot.m: Plot the data-points for the given noise model.
noiseReadFromFID.m: Load from an FID written by the C++ implementation.
noiseReadParamsFromFID.m: Read the noise parameters from C++ file FID.
noiseTest.m: Run some tests on the specified noise model.
noiseUpdateNuG.m: Update nu and g for a given noise model.
noiseUpdateSites.m: Update site parameters for a given noise model.
orderedGradX.m: Gradient wrt x of log-likelihood for Ordered categorical model.
orderedNoise3dPlot.m: Draws a 3D or contour plot for the ORDERED noise model.
orderedNoiseDisplay.m: Display parameters of the ORDERED noise.
orderedNoiseExpandParam.m: Create noise structure from ORDERED noise's parameters.
orderedNoiseExtractParam.m: Extract parameters from the ORDERED noise structure.
orderedNoiseGradientParam.m: Gradient of ORDERED noise's parameters.
orderedNoiseGradVals.m: Gradient of ORDERED noise log Z with respect to input mean and variance.
orderedNoiseLikelihood.m: Likelihood of the data under the ORDERED noise model.
orderedNoiseLogLikelihood.m: Log likelihood of the data under the ORDERED noise model.
orderedNoiseOut.m: Compute the output of the ORDERED noise given the input mean and variance.
orderedNoiseParamInit.m: ORDERED noise parameter initialisation.
orderedNoisePointPlot.m: Plot the data-points for the ORDERED noise model.
orderedNoiseUpdateParams.m: Update parameters for ordered categorical noise model.
probit3dPlot.m: Draw a 3D or contour plot for the probit.
probitNoise3dPlot.m: Draws a 3D or contour plot for the PROBIT noise model.
probitNoiseDisplay.m: Display parameters of the PROBIT noise.
probitNoiseExpandParam.m: Create noise structure from PROBIT noise's parameters.
probitNoiseExtractParam.m: Extract parameters from the PROBIT noise structure.
probitNoiseGradientParam.m: Gradient of PROBIT noise's parameters.
probitNoiseGradVals.m: Gradient of PROBIT noise log Z with respect to input mean and variance.
probitNoiseLikelihood.m: Likelihood of the data under the PROBIT noise model.
probitNoiseLogLikelihood.m: Log likelihood of the data under the PROBIT noise model.
probitNoiseOut.m: Compute the output of the PROBIT noise given the input mean and variance.
probitNoiseParamInit.m: PROBIT noise parameter initialisation.
probitNoisePointPlot.m: Plot the data-points for the PROBIT noise model.
scaleNoiseDisplay.m: Display the parameters of the scaled noise model.
scaleNoiseExpandParam.m: Expand Scale noise structure from param vector.
scaleNoiseOut.m: A simple noise model that scales and centres the data.
scaleNoiseParamInit.m: Scale noise model's parameter initialisation.
scaleNoiseSites.m: Site updates for Scale noise model.
