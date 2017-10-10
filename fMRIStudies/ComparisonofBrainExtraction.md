# A Comparative Study: The Novel Brain Extraction Techniques using Auto Context Convolutional Neural Networks vs the Previous Threshold/Watershed Segmentation Algorithms in Functionl Brain Scans


## Motivation 

The brain extraction remains a hot topic in research for finding out the valid voxels in a magnetic resonance imaging scan. The conventional toolkits for preprocessing of functional scan of a subject(MRI image) use FSL's Brain Extraction Tool (BET), BrainSuite’s Brain Surface Extractor (BSE), AFNI’s 3dIntracranial for brain extraction. Since the brain extraction remains an integral and the first step in preprocessing, the whole analysis and the various hypothesis testings on the brain depend on the identification of the right portion of brain in a subject. Thus, segmenting it out from the skull and the neck portion of body is essential for research purposes. 

Moreover, since I work in the Neuroimaging lab at SIT, the making of such a tool will reduce a great burden of using the FSL's BET and verifying whether it has performed good or not.

## Problem Statement & Solution

We are given a set of functional MRI scans and also the sets of coarse
brain portions. (Run length identification (RLI) scheme is used for region
labeling and searching. Then a set of segmentation processes such
as morphological operations and connected component analysis
(CCA) are done to produce a fine brain.) In overall, the methods used are unsupervised. 


The dice coefficient, False Positive Rate and False Negative Rates are used as the measures for comparing the models.

* [Paper on brain extraction using region labeling and morphological operations](http://www.sciencedirect.com/science/article/pii/S0010482511001284)
    * Feature Extraction: The main feature we try to identify is the scalp or the brain. 
        * Thresholding and 2 labeling process: An optimal intensity threshold value T<sub>opt</sub> for the pixels of the input is calculated using Ridler's method (yet to be read). It separates the scalp and the brain from background, CSF and the skull.
        * Next, detect the boundary between the scalp and background to produce a head mask.
        * Now, we do a 3 labelling process where the inner dark region is marked as 2.
        * Now, we make a rough brain mask using SRP(Scalp Removal Process) or BEP (run length identification scheme).
    * Segmentation: 
        * Perform Binary erosion using octagonal structuring element with a 7x7 size.
        * We calculate the connected region with the largest area and remove the rest.

The rest of the things in the paper will be discussed later.
 
* [Paper on Auto-Context based CNN for Brain Extraction](http://ieeexplore.ieee.org/document/7961201/#full-text-section)

In this paper, they talk about the Auto-Context CNN. The proposed network has nine types of input features and nine corresponding pathways which are merged in two
levels. Each pathway contains three convolutional layers. This
architecture segments a 3D image voxel-by-voxel. For all
voxels in the 3D image three sets of in-plane patches in axial,
coronal, and sagittal planes are used. Each set contains three
patches with window sizes of 15×15, 25×25 and 51×51. By using these sets of patches with different window size, both local and global features of each voxel are considered during training. Network parameters are learned simultaneously based
on orthogonal-plane inputs, so 3D features are learned without
using 3D convolution which is computationally expensive.

![](1.png)

