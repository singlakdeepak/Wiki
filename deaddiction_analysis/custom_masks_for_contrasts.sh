#!/bin/bash
## Saves the masks for the custom areas of the brain using contrasts and the already available masks.
## Multiplies them both and then binarizes them.
## See more at: http://andysbrainblog.blogspot.com/2012/11/creating-masks-in-fsl.html
PROJECTFOLDER=/mnt/project2/home/ee3140506/Deaddiction_Project
FSLSTDFILEPATH=/usr/share/fsl/5.0/data/standard/MNI152_T1_2mm_brain
CUSTOM_MASKS=${PROJECTFOLDER}/custom_masks
thr=5
THRESHOLDED=${CUSTOM_MASKS}/thresholded_at_${thr}

Results_Folder=${PROJECTFOLDER}/results_20200116

suffix=.nii.gz
NEW_CONT_MASK_FOLDER=${CUSTOM_MASKS}/thresholded_at_${thr}_cont_masked
mkdir -p ${NEW_CONT_MASK_FOLDER}

for FOLDERI in SS MS MSvsSS
do
mkdir -p ${NEW_CONT_MASK_FOLDER}/${FOLDERI}
for CONTJ in ARCvsFixation NACvsFixation
do 
mkdir -p ${NEW_CONT_MASK_FOLDER}/${FOLDERI}/${CONTJ}
PREPORTNAME=${Results_Folder}/${FOLDERI}/${CONTJ}/logP_report
QREPORTNAME=${Results_Folder}/${FOLDERI}/${CONTJ}/logQ_report
for cont_thr in 2.0 2.3
do
mkdir -p ${NEW_CONT_MASK_FOLDER}/${FOLDERI}/${CONTJ}/thresolded_at_${cont_thr}
Pfolder=${NEW_CONT_MASK_FOLDER}/${FOLDERI}/${CONTJ}/thresolded_at_${cont_thr}/P_masks
Qfolder=${NEW_CONT_MASK_FOLDER}/${FOLDERI}/${CONTJ}/thresolded_at_${cont_thr}/Q_masks
mkdir -p ${Pfolder}
mkdir -p ${Qfolder}
for maskfile in $(ls ${THRESHOLDED}/*${suffix})
do
stripniimask=${maskfile%${suffix}}
stripniimask="${stripniimask##*/}"

fslmaths ${maskfile} -mul ${PREPORTNAME}/report_at_thr_${cont_thr}/cluster_index.nii.gz -bin ${Pfolder}/${stripniimask}_thr_cont${suffix}
fslmaths ${maskfile} -mul ${QREPORTNAME}/report_at_thr_${cont_thr}/cluster_index.nii.gz -bin ${Qfolder}/${stripniimask}_thr_cont${suffix}

echo ${Pfolder}/${stripniimask}_thr_cont${suffix} >> ${Pfolder}/report.txt
fslstats ${Pfolder}/${stripniimask}_thr_cont${suffix} -H 2 0 1 >> ${Pfolder}/report.txt
echo -en "\n">>${Pfolder}/report.txt


echo ${Qfolder}/${stripniimask}_thr_cont${suffix} >> ${Qfolder}/report.txt
fslstats ${Qfolder}/${stripniimask}_thr_cont${suffix} -H 2 0 1 >> ${Qfolder}/report.txt
echo -en "\n">>${Qfolder}/report.txt

echo ${Pfolder}/${stripniimask}_thr_cont${suffix} >> ${Pfolder}/masknames.txt
echo ${Qfolder}/${stripniimask}_thr_cont${suffix} >> ${Qfolder}/masknames.txt
done
done
done
done


