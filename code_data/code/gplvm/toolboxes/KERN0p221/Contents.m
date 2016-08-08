% KERN toolbox
% Version 0.221		17-Apr-2009
% Copyright (c) 2009, Neil D. Lawrence
% 
, Neil D. Lawrence
% GGKERNCOMPUTE Compute the GG kernel given the parameters and X.
% KERNSETINDEX Set the indices on a compound kernel.
% SIMWHITEXSIMWHITEKERNCOMPUTE Compute a cross kernel between two SIM-WHITE
% ARDKERNEXPANDPARAM Create kernel structure from ARD kernel's parameters.
% SIMWHITEXRBFINFWHITEKERNCOMPUTE Compute a cross kernel between a SIM-WHITE
% GAUSSIANKERNEXTRACTPARAM Extract parameters from the gaussian kernel structure.
% WHITEFIXEDKERNPARAMINIT WHITEFIXED kernel parameter initialisation.
% KERNPCA performs KPCA.
% LINKERNGRADIENT Gradient of LIN kernel's parameters.
% RATQUADKERNPARAMINIT RATQUAD kernel parameter initialisation.
% RBFPERIODICKERNEXPANDPARAM Create kernel structure from RBFPERIODIC kernel's parameters.
% KERNEXTRACTPARAM Extract parameters from kernel structure.
% GIBBSKERNSETLENGTHSCALEFUNC Set the length scale function of the GIBBS kernel.
% TENSORKERNGRADX Gradient of TENSOR kernel with respect to a point x.
% OUKERNGRADIENT Gradient of OU kernel's parameters (see ouKernCompute or
% KERNELCENTER Attempts to Center Kernel Matrix
% POLYARDKERNGRADX Gradient of POLYARD kernel with respect to input locations.
% RBFPERIODICKERNGRADIENT Gradient of RBFPERIODIC kernel's parameters.
% RATQUADKERNEXTRACTPARAM Extract parameters from the RATQUAD kernel structure.
% GIBBSKERNCOMPUTE Compute the GIBBS kernel given the parameters and X.
% FILEKERNREAD Read kernel values from file or cache.
% BIASKERNDIAGGRADIENT Compute the gradient of the BIAS kernel's diagonal wrt parameters.
% GGWHITEKERNEXPANDPARAM Create kernel structure from GG white kernel's parameters.
% DISIMXDISIMKERNCOMPUTE Compute a cross kernel between two DISIM kernels.
% GAUSSIANWHITEKERNGRADIENT Gradient of gaussian white kernel's parameters.
% MATERN52KERNDIAGCOMPUTE Compute diagonal of MATERN52 kernel.
% WHITEXWHITEKERNGRADX
% POLYKERNEXPANDPARAM Create kernel structure from POLY kernel's parameters.
% LFMWHITEKERNGRADIENT Gradient of LFM-WHITE kernel's parameters.
% LFMKERNGRADIENT Gradient of LFM kernel's parameters.
% WHITEXNONEKERNGRADIENT Compute a cross gradient between WHITE and DUMMY kernels.
% GIBBSPERIODICKERNDISPLAY Display parameters of the GIBBSPERIODIC kernel.
% MULTIKERNGRADIENT Gradient of MULTI kernel's parameters.
% LFMXLFMKERNCOMPUTE Compute a cross kernel between two LFM kernels.
% MLPARDKERNEXTRACTPARAM Extract parameters from the MLPARD kernel structure.
% MLPKERNEXPANDPARAM Create kernel structure from MLP kernel's parameters.
% LFMOPTIONS Creates a set of default options for a LFM model.
% GGWHITEKERNPARAMINIT GG WHITE kernel parameter initialisation.
% RBFKERNDIAGGRADIENT Compute the gradient of the RBF kernel's diagonal wrt parameters.
% GGWHITEXGGWHITEKERNGRADIENT Compute a cross gradient between two GG WHITE kernels.
% ARDKERNDIAGGRADIENT Compute the gradient of the ARD kernel's diagonal wrt parameters.
% TENSORKERNDIAGGRADIENT Compute the gradient of the TENSOR kernel's diagonal wrt parameters.
% RBFARDKERNGRADX Gradient of RBFARD kernel with respect to input locations.
% WIENERKERNPARAMINIT WIENER kernel parameter initialisation.
% SIMKERNDIAGGRADX Gradient of SIM kernel's diagonal with respect to X.
% GIBBSPERIODICKERNCOMPUTE Compute the GIBBSPERIODIC kernel given the parameters and X.
% POLYARDKERNPARAMINIT POLYARD kernel parameter initialisation.
% OUKERNDIAGCOMPUTE Compute diagonal of OU kernel (see ouKernCompute or
% LFMKERNDIAGGRADIENT Compute the gradient of the LFM kernel's diagonal wrt parameters.
% RBFINFWHITEKERNEXTRACTPARAM Extract parameters from the RBF-WHITE kernel
% RBFWHITEKERNDISPLAY Display parameters of the RBF-WHITE kernel.
% SIMWHITEXWHITEKERNCOMPUTE Compute a cross kernel between the SIM-WHITE
% TRANSLATEKERNGRADIENT Gradient of TRANSLATE kernel's parameters.
% RBFPERIODICKERNGRADX Gradient of RBFPERIODIC kernel with respect to a point x.
% RBFINFWHITEKERNPARAMINIT RBF-WHITE kernel (with integration limits between
% GGWHITEKERNCOMPUTE Compute the GG white kernel given the parameters and X.
% LFMEXTRACTPARAM Extract the parameters of an LFM model.
% RBFXNONEKERNCOMPUTE Compute a cross kernel between RBF and NONE kernels.
% NONEKERNCOMPUTE Compute the NONE kernel given the parameters and X.
% NONEKERNDISPLAY Display parameters of the NONE kernel.
% GAUSSIANKERNGRADX Gradient of gaussian kernel with respect to input locations.
% RBFINFWHITEXRBFINFWHITEKERNGRADIENT Compute a cross gradient between two
% GAUSSIANKERNPARAMINIT Gaussian kernel parameter initialisation.
% OUKERNEXPANDPARAM Create kernel structure from OU kernel's parameters
% LFMKERNEXPANDPARAM Create kernel structure from LFM kernel's parameters.
% BIASKERNDISPLAY Display parameters of the BIASkernel.
% ARDKERNEXTRACTPARAM Extract parameters from the ARD kernel structure.
% KERNCOMPUTE Compute the kernel given the parameters and X.
% SIMWHITEKERNEXPANDPARAM Create kernel structure from SIM-WHITE kernel's
% WHITEKERNDIAGCOMPUTE Compute diagonal of WHITE kernel.
% RBFKERNEXTRACTPARAM Extract parameters from the RBF kernel structure.
% SQEXPKERNEXPANDPARAM Create kernel structure from SQEXP kernel's parameters.
% GIBBSPERIODICKERNEXTRACTPARAM Extract parameters from the GIBBSPERIODIC kernel structure.
% DISIMXRBFKERNCOMPUTE Compute a cross kernel between the DISIM and RBF kernels.
% LFMCOMPUTEH4 Helper function for computing part of the LFM kernel.
% DISIMKERNDIAGGRADIENT Compute the gradient of the DISIM kernel's diagonal wrt parameters.
% NONEKERNEXPANDPARAM Create kernel structure from NONE kernel's parameters.
% RBFINFWHITEXWHITEKERNCOMPUTE Compute a cross kernel between the RBF-WHITE
% KERNCREATE Initialise a kernel structure.
% WHITEFIXEDKERNDIAGCOMPUTE Compute diagonal of WHITEFIXED kernel.
% SIMWHITEKERNDISPLAY Display parameters of the SIM-WHITE kernel.
% WHITEKERNDIAGGRADX Gradient of WHITE kernel's diagonal with respect to X.
% SPARSEKERNDISPLAY Display parameters of the SPARSE kernel.
% GIBBSKERNEXTRACTPARAM Extract parameters from the GIBBS kernel structure.
% WIENERKERNCOMPUTE Compute the WIENER kernel given the parameters and X.
% GGWHITEKERNGRADIENT Gradient of GG WHITE kernel's parameters.
% FILEKERNGRADIENT Gradient of FILE kernel's parameters.
% EXPKERNPARAMINIT EXP kernel parameter initialisation.
% EXPKERNGRADIENT Gradient of EXP kernel's parameters.
% GGXGGKERNCOMPUTE Compute a cross kernel between two GG kernels.
% RBFWHITEXWHITEKERNCOMPUTE Compute a cross kernel between the RBF-WHITE
% MATERN32KERNDIAGCOMPUTE Compute diagonal of MATERN32 kernel.
% CMPNDKERNDIAGCOMPUTE Compute diagonal of CMPND kernel.
% BIASKERNPARAMINIT BIAS kernel parameter initialisation.
% GIBBSPERIODICKERNDIAGCOMPUTE Compute diagonal of GIBBSPERIODIC kernel.
% CMPNDKERNEXTRACTPARAM Extract parameters from the CMPND kernel structure.
% SIMWHITEKERNGRADIENT Gradient of SIM-WHITE kernel's parameters.
% SIMXRBFKERNCOMPUTE Compute a cross kernel between the SIM and RBF kernels.
% LFMWHITEKERNGRADX Gradient of LFM-WHITE kernel with respect to a point t.
% GGXGAUSSIANKERNGRADX Compute gradient between the GG and GAUSSIAN
% LINARDKERNDISPLAY Display parameters of the LINARD kernel.
% MULTIKERNDIAGGRADX Gradient of MULTI kernel's diagonal with respect to X.
% POLYKERNDIAGGRADX Gradient of POLY kernel's diagonal with respect to X.
% LFMWHITEXRBFWHITEKERNCOMPUTE Compute a cross kernel between an LFM-WHITE
% SIMWHITEXRBFINFWHITEKERNGRADIENT Compute a cross gradient between a
% RBFWHITEKERNGRADX Gradient of RBF-WHITE kernel with respect to a point t.
% WHITEXRBFKERNGRADIENT Compute a cross gradient between WHITE and RBF kernels.
% LINARDKERNPARAMINIT LINARD kernel parameter initialisation.
% MULTIKERNCACHEBLOCK
% KERNGETVARIANCE Get the signal associated with a the kernel.
% MULTIKERNTEST Run some tests on the multiple output block kernel.
% COMPONENTKERNWRITEPARAMSTOFID Write a component based kernel to a stream.
% RBFARDKERNDISPLAY Display parameters of the RBFARD kernel.
% POLYKERNCOMPUTE Compute the POLY kernel given the parameters and X.
% SIMKERNPARAMINIT SIM kernel parameter initialisation.
% LINKERNDIAGCOMPUTE Compute diagonal of LIN kernel.
% PSKERNELGRADIENT Gradient on likelihood approximation for point set IVM.
% MULTIKERNDIAGCOMPUTE Compute diagonal of MULTI kernel.
% WHITEXWHITEKERNGRADIENT Compute a cross gradient between two WHITE kernels.
% KERNPRIORGRADIENT Compute gradient terms associated with kernel priors.
% SIMCOMPUTETEST Test the file simComputeH.
% DISIMKERNEXTRACTPARAM Extract parameters from the DISIM kernel structure.
% DISIMKERNGRADX Gradient of DISIM kernel with respect to a point x.
% LINKERNDIAGGRADX Gradient of LIN kernel's diagonal with respect to X.
% DISIMCOMPUTEH Helper function for comptuing part of the DISIM kernel.
% BIASKERNDIAGGRADX Gradient of BIAS kernel's diagonal with respect to X.
% KERNGRADIENT Compute the gradient wrt the kernel's parameters.
% CMPNDKERNSETINDEX Set the indices in the compound kernel.
% GGWHITEXGAUSSIANWHITEKERNCOMPUTE Compute a cross kernel between the GG white and GAUSSIAN white kernels.
% KERNTEST Run some tests on the specified kernel.
% GGXGAUSSIANKERNCOMPUTE Compute a cross kernel between the GG and GAUSSIAN kernels.
% SIMKERNDIAGGRADIENT Compute the gradient of the SIM kernel's diagonal wrt parameters.
% LFMGRADIENTH31 Gradient of the function h_i(z) with respect to some of the
% MLPKERNCOMPUTE Compute the MLP kernel given the parameters and X.
% SIMKERNEXTRACTPARAM Extract parameters from the SIM kernel structure.
% GGWHITEKERNDIAGCOMPUTE Compute diagonal of GG WHITE kernel.
% MULTIKERNFIXBLOCKS
% SQEXPKERNCOMPUTE Compute the SQEXP kernel given the parameters and X.
% MLPARDKERNPARAMINIT MLPARD kernel parameter initialisation.
% RATQUADKERNDISPLAY Display parameters of the RATQUAD kernel.
% LINKERNGRADX Gradient of LIN kernel with respect to input locations.
% GIBBSKERNDIAGGRADX Gradient of GIBBS kernel's diagonal with respect to X.
% MLPARDKERNEXPANDPARAM Create kernel structure from MLPARD kernel's parameters.
% DISIMXSIMKERNGRADIENT Compute gradient between the DISIM and SIM kernels.
% POLYKERNGRADX Gradient of POLY kernel with respect to input locations.
% GAUSSIANWHITEKERNEXPANDPARAM Create kernel structure from gaussian white 
% LFMWHITEKERNEXTRACTPARAM Extract parameters from the LFM-WHITE kernel
% SIMXSIMKERNCOMPUTE Compute a cross kernel between two SIM kernels.
% SQEXPKERNEXTRACTPARAM Extract parameters from the SQEXP kernel structure.
% GAUSSIANKERNCOMPUTE Compute the Gaussian kernel given the parameters and X.
% GGWHITEXGAUSSIANWHITEKERNGRADX Compute gradient between the GG white and
% MLPARDKERNCOMPUTE Compute the MLPARD kernel given the parameters and X.
% MLPKERNGRADX Gradient of MLP kernel with respect to input locations.
% CMPNDKERNDISPLAY Display parameters of the CMPND kernel.
% SIMWHITEKERNEXTRACTPARAM Extract parameters from the SIM-WHITE kernel
% GAUSSIANWHITEKERNGRADX Gradient of gaussian white kernel with respect 
% LFMGRADIENTH32 Gradient of the function h_i(z) with respect to some of the
% LFMGRADIENTSIGMAH4 Gradient of the function h_i(z) with respect \sigma.
% LINARDKERNCOMPUTE Compute the LINARD kernel given the parameters and X.
% EXPKERNDIAGGRADX Gradient of EXP kernel's diagonal with respect to X.
% POLYKERNDIAGCOMPUTE Compute diagonal of POLY kernel.
% WHITEFIXEDKERNEXTRACTPARAM Extract parameters from the WHITEFIXED kernel structure.
% MATERN32KERNGRADIENT Gradient of MATERN32 kernel's parameters.
% GGKERNPARAMINIT GG kernel parameter initialisation.
% DISIMKERNEXPANDPARAM Create kernel structure from DISIM kernel's parameters.
% LFMXRBFKERNCOMPUTE Compute a cross kernel between the LFM and RBF kernels.
% WHITEFIXEDKERNEXPANDPARAM Create kernel structure from WHITEFIXED kernel's parameters.
% KERNGRADX Compute the gradient of the kernel wrt X.
% MATERN52KERNGRADIENT Gradient of MATERN52 kernel's parameters.
% CMPNDKERNEXPANDPARAM Create kernel structure from CMPND kernel's parameters.
% MLPKERNDIAGCOMPUTE Compute diagonal of MLP kernel.
% LFMWHITEKERNDISPLAY Display parameters of the LFM-WHITE kernel.
% MULTIKERNGRADIENTBLOCK
% TENSORKERNDIAGGRADX Gradient of TENSOR kernel's diagonal with respect to X.
% DISIMCOMPUTEHPRIME Helper function for comptuing part of the DISIM kernel.
% RBFPERIODICKERNDIAGCOMPUTE Compute diagonal of RBFPERIODIC kernel.
% GAUSSIANKERNDIAGGRADIENT Compute the gradient of the gaussian kernel's diagonal wrt parameters.
% WHITEFIXEDKERNGRADX Gradient of WHITEFIXED kernel with respect to a point x.
% RATQUADKERNCOMPUTE Compute the RATQUAD kernel given the parameters and X.
% OUKERNDISPLAY Display parameters of the OU kernel (see ouKernCompute or
% LINKERNDISPLAY Display parameters of the LIN kernel.
% RBFINFWHITEXWHITEKERNGRADIENT Compute gradient between the RBF-WHITE kernel
% FILEKERNEXPANDPARAM Create kernel structure from FILE kernel's parameters.
% RBFARDKERNDIAGGRADIENT Compute the gradient of the RBFARD kernel's diagonal wrt parameters.
% LFMKERNDIAGCOMPUTE Compute diagonal of LFM kernel.
% RBFWHITEKERNDIAGGRADX Gradient of RBF-WHITE kernel's diagonal w.r.t. t.
% RBFWHITEXRBFWHITEKERNCOMPUTE Compute a cross kernel between two RBF-WHITE
% LINARDKERNEXPANDPARAM Create kernel structure from LINARD kernel's parameters.
% GGXGAUSSIANKERNGRADIENT Compute gradient between the GG and GAUSSIAN kernels.
% KERNPRIORLOGPROB Compute penalty terms associated with kernel priors.
% LINARDKERNGRADX Gradient of LINARD kernel with respect to input locations.
% LFMCOMPUTEH3 Helper function for computing part of the LFM kernel.
% EXPKERNDISPLAY Display parameters of the EXP kernel.
% GIBBSKERNDISPLAY Display parameters of the GIBBS kernel.
% POLYKERNEXTRACTPARAM Extract parameters from the POLY kernel structure.
% RBFKERNDIAGGRADX Gradient of RBF kernel's diagonal with respect to X.
% LINARDKERNDIAGCOMPUTE Compute diagonal of LINARD kernel.
% GGKERNGRADIENT Gradient of GG kernel's parameters.
% SQEXPKERNDISPLAY Display parameters of the SQEXP kernel.
% POLYARDKERNEXPANDPARAM Create kernel structure from POLYARD kernel's parameters.
% KERNREADFROMFID Load from an FID written by the C++ implementation.
% RBFKERNDIAGCOMPUTE Compute diagonal of RBF kernel.
% COMPONENTKERNREADPARAMSFROMFID Read a component based kernel from a C++ file.
% LFMGRADIENTUPSILON Gradient of the function \upsilon(z) with respect to
% TRANSLATEKERNPARAMINIT TRANSLATE kernel parameter initialisation.
% SIMWHITEKERNPARAMINIT SIM-WHITE kernel parameter initialisation.
% LFMWHITECOMPUTEGRADTHETAH1 computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
% RBFARDKERNCOMPUTE Compute the RBFARD kernel given the parameters and X.
% GAUSSIANWHITEKERNDISPLAY Display parameters of the GAUSSIAN white kernel.
% GAUSSIANWHITEKERNCOMPUTE Compute the covariance of the output samples 
% MULTIKERNDISPLAY Display parameters of the MULTI kernel.
% TRANSLATEKERNCOMPUTE Compute the TRANSLATE kernel given the parameters and X.
% LFMWHITEKERNDIAGGRADX Gradient of LFM-WHITE kernel's diagonal w.r.t. t.
% RBFARDKERNEXTRACTPARAM Extract parameters from the RBFARD kernel structure.
% LFMCOMPUTEH Helper function for computing part of the LFM kernel.
% WHITEFIXEDKERNCOMPUTE Compute the WHITEFIXED kernel given the parameters and X.
% GIBBSPERIODICKERNEXPANDPARAM Create kernel structure from GIBBSPERIODIC kernel's parameters.
% DISIMKERNDIAGCOMPUTE Compute diagonal of DISIM kernel.
% LFMGRADIENTSIGMAH3 Gradient of the function h_i(z) with respect \sigma.
% LINARDKERNGRADIENT Gradient of LINARD kernel's parameters.
% GIBBSPERIODICKERNPARAMINIT GIBBSPERIODIC kernel parameter initialisation.
% MLPKERNPARAMINIT MLP kernel parameter initialisation.
% CMPNDKERNPARAMINIT CMPND kernel parameter initialisation.
% LFMLOGLIKELIHOOD Compute the log likelihood of a LFM model.
% EXPKERNEXTRACTPARAM Extract parameters from the EXP kernel structure.
% CMPNDKERNDIAGGRADX Gradient of CMPND kernel's diagonal with respect to X.
% WHITEKERNEXTRACTPARAM Extract parameters from the WHITE kernel structure.
% SIMKERNGRADIENT Gradient of SIM kernel's parameters.
% RATQUADKERNDIAGGRADX Gradient of RATQUAD kernel's diagonal with respect to X.
% WHITEKERNDIAGGRADIENT Compute the gradient of the WHITE kernel's diagonal wrt parameters.
% NONEKERNPARAMINIT NONE kernel parameter initialisation.  
% EXPKERNEXPANDPARAM Create kernel structure from EXP kernel's parameters.
% RBFINFWHITEKERNDIAGCOMPUTE Compute diagonal of RBF-WHITE kernel (with
% WIENERKERNDIAGGRADX Gradient of WIENER kernel's diagonal with respect to X.
% RBFPERIODICKERNDIAGGRADIENT Compute the gradient of the RBFPERIODIC kernel's diagonal wrt parameters.
% LFMWHITECOMPUTEH Helper function for computing part of the LFM-WHITE
% LFMWHITEXWHITEKERNCOMPUTE Compute a cross kernel between the LFM-WHITE
% RBFINFWHITEKERNGRADIENT Gradient of the parameters of the RBF-WHITE kernel
% DISIMXSIMKERNCOMPUTE Compute a cross kernel between DISIM and SIM kernels.
% RBFARDKERNDIAGGRADX Gradient of RBFARD kernel's diagonal with respect to X.
% LFMWHITEXLFMWHITEKERNGRADIENT Compute a cross gradient between two
% SQEXPKERNGRADIENT Gradient of SQEXP kernel's parameters.
% KERNTOOLBOXES Load in the relevant toolboxes for kern.
% SIMWHITEKERNCOMPUTE Compute the SIM-WHITE kernel given the parameters, t1
% EXPKERNCOMPUTE Compute the EXP kernel given the parameters and X.
% POLYARDKERNDIAGCOMPUTE Compute diagonal of POLYARD kernel.
% EXPKERNGRADX Gradient of EXP kernel with respect to a point x.
% GGKERNEXPANDPARAM Create kernel structure from GG kernel's parameters.
% GAUSSIANWHITEKERNDIAGCOMPUTE Compute diagonal of gaussian white kernel.
% OUKERNCOMPUTE Compute the Ornstein-Uhlenbeck (OU) kernel arising from the
% LINKERNEXPANDPARAM Create kernel structure from LIN kernel's parameters.
% DISIMKERNDIAGGRADX Gradient of DISIM kernel's diagonal with respect to X.
% NONEKERNGRADX Gradient of NONE kernel with respect to a point x.
% RATQUADKERNDIAGCOMPUTE Compute diagonal of RATQUAD kernel.
% MLPARDKERNDISPLAY Display parameters of the MLPARD kernel.
% KERNCORRELATION Compute the correlation matrix kernel given the parameters and X.
% GIBBSPERIODICKERNDIAGGRADIENT Compute the gradient of the GIBBSPERIODIC kernel's diagonal wrt parameters.
% POLYARDKERNDISPLAY Display parameters of the POLYARD kernel.
% LINKERNCOMPUTE Compute the LIN kernel given the parameters and X.
% RBFPERIODICKERNPARAMINIT RBFPERIODIC kernel parameter initialisation.
% LFMWHITEXWHITEKERNGRADIENT Compute gradient between the LFM-WHITE and
% GIBBSKERNDIAGGRADIENT Compute the gradient of the GIBBS kernel's diagonal wrt parameters.
% TRANSLATEKERNDIAGCOMPUTE Compute diagonal of TRANSLATE kernel.
% BIASKERNCOMPUTE Compute the BIAS kernel given the parameters and X.
% MULTIKERNDIAGGRADIENT Compute the gradient of the MULTI kernel's diagonal wrt parameters.
% MULTIKERNCOMPUTE Compute the MULTI kernel given the parameters and X.
% RBFKERNCOMPUTE Compute the RBF kernel given the parameters and X.
% LFMXRBFKERNGRADIENT Compute gradient between the LFM and RBF kernels.
% MATERN32KERNPARAMINIT MATERN32 kernel parameter initialisation.
% WIENERKERNDIAGCOMPUTE Compute diagonal of WIENER kernel.
% SIMWHITEXRBFWHITEKERNGRADIENT Compute a cross gradient between a SIM-WHITE
% ARDKERNPARAMINIT ARD kernel parameter initialisation.
% LFMWHITEKERNDIAGCOMPUTE Compute diagonal of LFM-WHITE kernel.
% MATERN32KERNDISPLAY Display parameters of the MATERN32 kernel.
% RBFKERNPARAMINIT RBF kernel parameter initialisation.
% MATERN52KERNPARAMINIT MATERN52 kernel parameter initialisation.
% GGWHITEKERNDISPLAY Display parameters of the GG WHITE kernel.
% POLYARDKERNGRADIENT Gradient of POLYARD kernel's parameters.
% SIMWHITEKERNDIAGCOMPUTE Compute diagonal of SIM-WHITE kernel.
% LFMKERNPARAMINIT LFM kernel parameter initialisation. The latent force
% RBFINFWHITEKERNDISPLAY Display parameters of the RBF-WHITE kernel (with
% KERNDISPLAY Display the parameters of the kernel.
% FILEKERNPARAMINIT FILE kernel parameter initialisation.
% DISIMKERNCOMPUTE Compute the DISIM kernel given the parameters and X.
% LFMGRADIENTH41 Gradient of the function h_i(z) with respect to some of the
% LFMGRADIENTSIGMAH Gradient of the function h_i(z) with respect \sigma.
% GAUSSIANWHITEKERNDIAGGRADIENT Compute the gradient of the gaussian white 
% RBFINFWHITEKERNDIAGGRADX Gradient of RBF-WHITE kernel's (with integration
% TENSORKERNSLASH Tensor kernel created by removing ith component.
% KERNDIAGCOMPUTE Compute the kernel given the parameters and X.
% CMPNDKERNGRADIENT Gradient of CMPND kernel's parameters.
% RATQUADKERNEXPANDPARAM Create kernel structure from RATQUAD kernel's parameters.
% MATERN32KERNDIAGGRADIENT Compute the gradient of the MATERN32 kernel's diagonal wrt parameters.
% TRANSLATEKERNEXPANDPARAM Create kernel structure from TRANSLATE kernel's parameters.
% TENSORKERNSETINDEX Set the indices in the tensor kernel.
% MATERN32KERNGRADX Gradient of MATERN32 kernel with respect to input locations.
% SQEXPKERNDIAGCOMPUTE Compute diagonal of SQEXP kernel.
% KERNDIAGGRADX Compute the gradient of the  kernel wrt X.
% GIBBSPERIODICKERNDIAGGRADX Gradient of GIBBSPERIODIC kernel's diagonal with respect to X.
% MATERN52KERNEXPANDPARAM Create kernel structure from MATERN52 kernel's parameters.
% BIASKERNEXTRACTPARAM Extract parameters from the BIAS kernel structure.
% WIENERKERNDISPLAY Display parameters of the WIENER kernel.
% GGKERNDIAGCOMPUTE Compute diagonal of GG kernel.
% RBFARDKERNGRADIENT Gradient of RBFARD kernel's parameters.
% MATERN52KERNDIAGGRADX Gradient of MATERN52 kernel's diagonal with respect to X.
% RBFWHITEKERNEXPANDPARAM Create kernel structure from RBF-WHITE kernel's
% LFMWHITEXLFMWHITEKERNCOMPUTE Compute a cross kernel between two LFM-WHITE
% ARDKERNDISPLAY Display parameters of the ARD kernel.
% LFMKERNGRADX Gradient of LFM kernel with respect to a point x.
% MATERN32KERNDIAGGRADX Gradient of MATERN32 kernel's diagonal with respect to X.
% MLPARDKERNDIAGCOMPUTE Compute diagonal of MLPARD kernel.
% RBFWHITEXWHITEKERNGRADIENT Compute gradient between the RBF-WHITE and
% LFMWHITEXRBFWHITEKERNGRADIENT Compute a cross gradient between an LFM-WHITE
% NONEKERNDIAGCOMPUTE Compute diagonal of NONE kernel.
% RBFPERIODICKERNDISPLAY Display parameters of the RBFPERIODIC kernel.
% POLYARDKERNEXTRACTPARAM Extract parameters from the POLYARD kernel structure.
% TRANSLATEKERNDISPLAY Display parameters of the TRANSLATE kernel.
% LFMXLFMKERNGRADIENT Compute a cross gradient between two LFM kernels.
% SQEXPKERNGRADX Gradient of SQEXP kernel with respect to a point x.
% WHITEKERNDISPLAY Display parameters of the WHITEkernel.
% KERNEXPANDPARAM Expand parameters to form a kernel structure.
% GIBBSPERIODICKERNGRADX Gradient of GIBBSPERIODIC kernel with respect to a point x.
% LFMCOMPUTETEST Test the file lfmComputeH.
% KERNREADPARAMSFROMFID Read the kernel parameters from C++ file FID.
% ARDKERNGRADIENT Gradient of ARD kernel's parameters.
% SIMWHITEXWHITEKERNGRADIENT Compute gradient between the SIM-WHITE and WHITE kernels.
% TENSORKERNGRADIENT Gradient of TENSOR kernel's parameters.
% RBFKERNDISPLAY Display parameters of the RBF kernel.
% MATERN52KERNDISPLAY Display parameters of the MATERN52 kernel.
% NONEKERNDIAGGRADX Gradient of NONE kernel's diagonal with respect to X.
% GGWHITEXGAUSSIANWHITEKERNGRADIENT Compute gradient between the GG white 
% SIMCOMPUTEH Helper function for comptuing part of the SIM kernel.
% ARDKERNDIAGGRADX Gradient of ARD kernel's diagonal with respect to X.
% RBFWHITEKERNGRADIENT Gradient of RBF-WHITE kernel's parameters.
% SIMWHITEKERNGRADX Gradient of SIM-WHITE kernel with respect to a point t.
% MATERN52KERNCOMPUTE Compute the MATERN52 kernel given the parameters and X.
% ARDKERNDIAGCOMPUTE Compute diagonal of ARD kernel.
% WHITEXNONEKERNCOMPUTE Compute a cross kernel between WHITE and NONE kernels.
% GIBBSKERNPARAMINIT GIBBS kernel parameter initialisation.
% LFMKERNDIAGGRADX Gradient of LFM kernel's diagonal with respect to X.
% RBFARDKERNPARAMINIT RBFARD kernel parameter initialisation.
% SQEXPKERNDIAGGRADIENT Compute the gradient of the SQEXP kernel's diagonal wrt parameters.
% SIMWHITEKERNDIAGGRADX Gradient of SIM-WHITE kernel's diagonal w.r.t. t.
% NONEKERNEXTRACTPARAM Extract parameters from the NONE kernel structure.
% MATERN32KERNEXTRACTPARAM Extract parameters from the MATERN32 kernel structure.
% MULTIKERNGRADIENTBLOCKX
% BIASKERNDIAGCOMPUTE Compute diagonal of BIAS kernel.
% RBFPERIODICKERNDIAGGRADX Gradient of RBFPERIODIC kernel's diagonal with respect to X.
% RBFWHITEKERNDIAGCOMPUTE Compute diagonal of RBF-WHITE kernel.
% OUKERNPARAMINIT Ornstein-Uhlenbeck (OU) kernel parameter initialisation.
% MLPKERNEXTRACTPARAM Extract parameters from the MLP kernel structure.
% SIMKERNCOMPUTE Compute the SIM kernel given the parameters and X.
% GGWHITEXGGWHITEKERNCOMPUTE Compute a cross kernel between two GG white kernels.
% MATERN32KERNCOMPUTE Compute the MATERN32 kernel given the parameters and X.
% LFMGRADIENTSIGMAUPSILON Gradient of the function \upsilon(z) with respect
% MULTIKERNEXTRACTPARAM Extract parameters from the MULTI kernel structure.
% GGKERNEXTRACTPARAM Extract parameters from the GG kernel structure.
% WIENERKERNEXTRACTPARAM Extract parameters from the WIENER kernel structure.
% LFMWHITECOMPUTEGRADTHETAH2 computes a portion of the LFM-WHITE kernel's gradient w.r.t. theta.
% RBFPERIODICKERNCOMPUTE Compute the RBFPERIODIC kernel given the parameters and X.
% DISIMXRBFKERNGRADIENT Compute gradient between the DISIM and RBF kernels.
% GIBBSKERNEXPANDPARAM Create kernel structure from GIBBS kernel's parameters.
% KERNDIAGGRADIENT Compute the gradient of the kernel's parameters for the diagonal.
% TENSORKERNPARAMINIT TENSOR kernel parameter initialisation.
% POLYARDKERNDIAGGRADX Gradient of POLYARD kernel's diagonal with respect to X.
% RATQUADKERNGRADIENT Gradient of RATQUAD kernel's parameters.
% RBFWHITEKERNEXTRACTPARAM Extract parameters from the RBF-WHITE kernel
% DISIMKERNDISPLAY Display parameters of the DISIM kernel.
% SIMKERNDISPLAY Display parameters of the SIM kernel.
% WHITEFIXEDXWHITEFIXEDKERNGRADIENT Compute a cross gradient between two WHITEFIXED kernels.
% MLPARDKERNDIAGGRADX Gradient of MLPARD kernel's diagonal with respect to X.
% GGXGGKERNGRADIENT Compute a cross gradient between two GG kernels.
% GAUSSIANKERNDISPLAY Display parameters of the GAUSSIAN kernel.
% LFMGRADIENTH Gradient of the function h_i(z) with respect to some of the
% WHITEFIXEDKERNDIAGGRADX Gradient of WHITEFIXED kernel's diagonal with respect to X.
% WHITEFIXEDXWHITEFIXEDKERNCOMPUTE Compute a cross kernel between two WHITEFIXED kernels.
% RATQUADKERNGRADX Gradient of RATQUAD kernel with respect to input locations.
% KERNWRITETOFID Load from an FID written by the C++ implementation.
% GIBBSKERNGRADX Gradient of GIBBS kernel with respect to input locations.
% WHITEKERNEXPANDPARAM Create kernel structure from WHITE kernel's parameters.
% BIASKERNGRADX Gradient of BIAS kernel with respect to input locations.
% MLPKERNGRADIENT Gradient of MLP kernel's parameters.
% FILEKERNGRADX Gradient of FILE kernel with respect to a point x.
% GAUSSIANWHITEKERNEXTRACTPARAM Extract parameters from the gaussian white 
% SQEXPKERNDIAGGRADX Gradient of SQEXP kernel's diagonal with respect to X.
% LFMWHITEKERNEXPANDPARAM Create kernel structure from LFM-WHITE kernel's
% LFMUPDATEKERNELS Updates the kernel representations in the LFM structure.
% EXPKERNDIAGCOMPUTE Compute diagonal of EXP kernel.
% RBFINFWHITEKERNGRADX Gradient of RBF-WHITE kernel (with integration limits
% RBFINFWHITEKERNEXPANDPARAM Create kernel structure from RBF-WHITE kernel's
% LINKERNEXTRACTPARAM Extract parameters from the LIN kernel structure.
% RBFWHITEKERNCOMPUTE Compute the RBF-WHITE kernel given the parameters, t1
% GAUSSIANKERNDIAGCOMPUTE Compute diagonal of gaussian kernel.
% MULTIKERNPARAMINIT MULTI kernel parameter initialisation.
% TENSORKERNEXTRACTPARAM Extract parameters from the TENSOR kernel structure.
% LINARDKERNEXTRACTPARAM Extract parameters from the LINARD kernel structure.
% RBFXNONEKERNGRADIENT Compute a cross gradient between RBF and DUMMY
% GAUSSIANKERNGRADIENT Gradient of gaussian kernel's parameters.
% RBFINFWHITEKERNCOMPUTE Compute the RBF-WHITE kernel (with integration limits
% LFMCREATE Create a LFM model.
% LFMCOMPUTEUPSILON Helper function for comptuing part of the LFM kernel.
% BIASKERNEXPANDPARAM Create kernel structure from BIAS kernel's parameters.
% FILEKERNDIAGCOMPUTE Compute diagonal of FILE kernel.
% GIBBSKERNGRADIENT Gradient of GIBBS kernel's parameters.
% GGKERNDISPLAY Display parameters of the GG kernel.
% LFMTEST Test the gradients of the LFM model.
% TENSORKERNDISPLAY Display parameters of the TENSOR kernel.
% WHITEXWHITEKERNCOMPUTE Compute a cross kernel between two WHITE kernels.
% WHITEFIXEDKERNGRADIENT Gradient of WHITEFIXED kernel's parameters.
% CMPNDKERNDIAGGRADIENT Compute the gradient of the CMPND kernel's diagonal wrt parameters.
% MULTIKERNEXPANDPARAM Create kernel structure from MULTI kernel's parameters.
% RBFARDKERNDIAGCOMPUTE Compute diagonal of RBFARD kernel.
% FILEKERNDISPLAY Display parameters of the FILE kernel.
% SIMKERNEXPANDPARAM Create kernel structure from SIM kernel's parameters.
% MULTIKERNGRADX Gradient of MULTI kernel with respect to a point x.
% OUKERNEXTRACTPARAM Extract parameters from the OU kernel structure (see
% ARDKERNCOMPUTE Compute the ARD kernel given the parameters and X.
% BIASKERNGRADIENT Gradient of BIAS kernel's parameters.
% LFMWHITEKERNPARAMINIT LFM-WHITE kernel parameter initialisation.
% WHITEKERNCOMPUTE Compute the WHITE kernel given the parameters and X.
% SIMKERNGRADX Gradient of SIM kernel with respect to a point x.
% SIMWHITEXRBFWHITEKERNCOMPUTE Compute a cross kernel between a SIM-WHITE
% NONEKERNGRADIENT Gradient of NONE kernel's parameters.
% POLYKERNDISPLAY Display parameters of the POLY kernel.
% GAUSSIANWHITEKERNPARAMINIT Gaussian white kernel parameter initialisation.
% COMPUTEKERNEL Compute the kernel given the parameters and X.
% LFMGRADIENTH42 Gradient of the function h_i(z) with respect to some of the
% WHITEKERNGRADIENT Gradient of WHITE kernel's parameters.
% SIMKERNDIAGCOMPUTE Compute diagonal of SIM kernel.
% MLPKERNDIAGGRADX Gradient of MLP kernel's diagonal with respect to X.
% LFMKERNCOMPUTE Compute the LFM kernel given the parameters and X.
% GIBBSPERIODICKERNGRADIENT Gradient of GIBBSPERIODIC kernel's parameters.
% WIENERKERNGRADIENT Gradient of WIENER kernel's parameters.
% SQEXPKERNPARAMINIT SQEXP kernel parameter initialisation.
% RBFINFWHITEXRBFINFWHITEKERNCOMPUTE Compute a cross kernel between two
% WHITEFIXEDKERNDISPLAY Display parameters of the WHITEFIXED kernel.
% WHITEFIXEDKERNDIAGGRADIENT Compute the gradient of the WHITEFIXED kernel's diagonal wrt parameters.
% SIMXRBFKERNGRADIENT Compute gradient between the SIM and RBF kernels.
% DISIMKERNGRADIENT Gradient of DISIM kernel's parameters.
% POLYKERNGRADIENT Gradient of POLY kernel's parameters.
% MATERN52KERNEXTRACTPARAM Extract parameters from the MATERN52 kernel structure.
% MATERN52KERNGRADX Gradient of MATERN52 kernel with respect to input locations.
% GAUSSIANWHITEKERNDIAGGRADX Gradient of gaussian white kernel's diagonal with respect to X.
% TRANSLATEKERNGRADX Gradient of TRANSLATE kernel with respect to a point x.
% GAUSSIANKERNEXPANDPARAM Create kernel structure from gaussian kernel's parameters.
% LFMLOGLIKEGRADIENTS Compute the gradients of the log likelihood of a LFM model.
% OUKERNGRADX Gradient of OU kernel with respect to a point x (see
% TENSORKERNEXPANDPARAM Create kernel structure from TENSOR kernel's parameters.
% POLYKERNPARAMINIT POLY kernel parameter initialisation.
% MULTIKERNCOMPUTEBLOCK
% CMPNDKERNGRADX Gradient of CMPND kernel with respect to a point x.
% LFMKERNDISPLAY Display parameters of the LFM kernel.
% LFMEXPANDPARAM Expand the given parameters into a LFM structure.
% RBFWHITEKERNPARAMINIT RBF-WHITE kernel parameter initialisation. The RBF-
% WHITEKERNGRADX Gradient of WHITE kernel with respect to input locations.
% KERNWRITEPARAMSTOFID Write the kernel parameters to a stream.
% TRANSLATEKERNDIAGGRADX Gradient of TRANSLATE kernel's diagonal with respect to X.
% MATERN32KERNEXPANDPARAM Create kernel structure from MATERN32 kernel's parameters.
% FILEKERNEXTRACTPARAM Extract parameters from the FILE kernel structure.
% MATERN52KERNDIAGGRADIENT Compute the gradient of the MATERN52 kernel's diagonal wrt parameters.
% RBFWHITEXRBFWHITEKERNGRADIENT Compute a cross gradient between two
% TENSORKERNCOMPUTE Compute the TENSOR kernel given the parameters and X.
% KERNSETWHITE Helper function to set the white noise in a kernel if it exists.
% DISIMKERNPARAMINIT DISIM kernel parameter initialisation.
% DISIMXDISIMKERNGRADIENT Compute a cross gradient between two DISIM kernels.
% LINKERNPARAMINIT LIN kernel parameter initialisation.
% LFMKERNEXTRACTPARAM Extract parameters from the LFM kernel structure.
% TENSORKERNDIAGCOMPUTE Compute diagonal of TENSOR kernel.
% POLYARDKERNCOMPUTE Compute the POLYARD kernel given the parameters and X.
% GGWHITEKERNEXTRACTPARAM Extract parameters from the GG WHITE kernel structure.
% TRANSLATEKERNEXTRACTPARAM Extract parameters from the TRANSLATE kernel structure.
% MLPARDKERNGRADIENT Gradient of MLPARD kernel's parameters.
% FILEKERNCOMPUTE Compute the FILE kernel given the parameters and X.
% LFMSAMPLE Sample from LFM kernel
% RBFARDKERNEXPANDPARAM Create kernel structure from RBFARD kernel's parameters.
% WHITEKERNPARAMINIT WHITE kernel parameter initialisation.
% RBFKERNGRADX Gradient of RBF kernel with respect to input locations.
% GAUSSIANKERNDIAGGRADX Gradient of gaussian kernel's diagonal with respect to X.
% WIENERKERNGRADX Gradient of WIENER kernel with respect to a point x.
% MLPARDKERNGRADX Gradient of MLPARD kernel with respect to input locations.
% SIMWHITEXSIMWHITEKERNGRADIENT Compute a cross gradient between two
% LFMWHITEKERNCOMPUTE Compute the LFM-WHITE kernel given the parameters, t1
% CMPNDKERNCOMPUTE Compute the CMPND kernel given the parameters and X.
% KERNPARAMINIT Kernel parameter initialisation.
% RBFPERIODICKERNEXTRACTPARAM Extract parameters from the RBFPERIODIC kernel structure.
% RATQUADKERNDIAGGRADIENT Compute the gradient of the RATQUAD kernel's diagonal wrt parameters.
% RBFKERNGRADIENT Gradient of RBF kernel's parameters.
% KERNFACTORS Extract factors associated with transformed optimisation space.
% LFMWHITECOMPUTEPSI Helper function for comptuing part of the LFM-WHITE
% WIENERKERNEXPANDPARAM Create kernel structure from WIENER kernel's parameters.
% OUKERNDIAGGRADX Gradient of OU kernel's diagonal with respect to t (see
% MLPKERNDISPLAY Display parameters of the MLP kernel.
% SIMXSIMKERNGRADIENT Compute a cross gradient between two SIM kernels.
% GIBBSKERNDIAGCOMPUTE Compute diagonal of GIBBS kernel.
% RBFKERNEXPANDPARAM Create kernel structure from RBF kernel's parameters.
% ARDKERNGRADX Gradient of ARD kernel with respect to a point x.
% PSKERNELOBJECTIVE Likelihood approximation for point set IVM.
% LINARDKERNDIAGGRADX Gradient of LINARD kernel's diagonal with respect to X.
