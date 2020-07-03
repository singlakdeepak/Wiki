#!/bin/bash
prepreHTTPS="http://htmlpreview.github.io/?"
HTTPS="https://github.com/singlakdeepak"
PROJECTFOLDER=Wiki/tree/master/deaddiction_analysis

thr=5
# THRESHOLDED=${CUSTOM_MASKS}/thresholded_at_${thr}

Results_Folder=results_20200116

suffix=.nii.gz
NEW_CONT_MASK_FOLDER=thresholded_at_${thr}_cont_masked
echo "# Results for Deaddiction Project" > readme.md
echo >> readme.md
echo "The time series for areas of intersection between ROIs and clusters (averaged over all the subjects) have been organized in directories. Further, the cluster reports are available for seeing all the significant activations.">>readme.md
echo >> readme.md

for FOLDERI in SS MS MSvsSS
do
	if [ "${FOLDERI}" = "SS" ]
	then
		echo "## Single Sensory (${FOLDERI}) Paradigm" >> readme.md
	elif [ "${FOLDERI}" = "MS" ]
	then
		echo "## Multi Sensory (${FOLDERI}) Paradigm" >> readme.md
	elif [ "${FOLDERI}" = "MSvsSS" ]
	then
		echo "## Group Contrasts for Multi Sensory vs Single Sensory (${FOLDERI})" >> readme.md
	fi
echo >> readme.md
for CONTJ in ARCvsFixation NACvsFixation
do 
	if [ "${CONTJ}" = "ARCvsFixation" ]
	then
		echo "### [Contrasts for ARC vs Fixation (${CONTJ})](${Results_Folder}/${FOLDERI}/${CONTJ})" >> readme.md
	elif [ "${CONTJ}" = "NACvsFixation" ]
	then
		echo "### [Contrasts for NAC vs Fixation (${CONTJ})](${Results_Folder}/${FOLDERI}/${CONTJ})" >> readme.md
	fi

PREPORTNAME=${Results_Folder}/${FOLDERI}/${CONTJ}/logP_report
QREPORTNAME=${Results_Folder}/${FOLDERI}/${CONTJ}/logQ_report
for cont_thr in 2.0 2.3
do

Pfolder=${NEW_CONT_MASK_FOLDER}/${FOLDERI}/${CONTJ}/thresolded_at_${cont_thr}/P_masks
Qfolder=${NEW_CONT_MASK_FOLDER}/${FOLDERI}/${CONTJ}/thresolded_at_${cont_thr}/Q_masks
echo "* **Threshold = ${cont_thr}** applied to the statistics" >> readme.md

if [ "${FOLDERI}" = "MSvsSS" ]
then
	echo -e "\t * For **P-values**: [Cluster Report](${PREPORTNAME}/report_at_thr_${cont_thr}/report.txt)">>readme.md
	echo -e "\t * For **Q-values**: [Cluster Report](${QREPORTNAME}/report_at_thr_${cont_thr}/report.txt)">>readme.md
else
echo -e "\t * For **P-values**: [Cluster Report](${PREPORTNAME}/report_at_thr_${cont_thr}/report.txt), [Average time series](${HTTPS}/${PROJECTFOLDER}/${Pfolder}/bokeh_timeseries_plo.png)">>readme.md
echo -e "\t * For **Q-values**: [Cluster Report](${QREPORTNAME}/report_at_thr_${cont_thr}/report.txt), [Average time series](${HTTPS}/${PROJECTFOLDER}/${Qfolder}/bokeh_timeseries_plo.png)">>readme.md
fi
echo >> readme.md

done
echo >> readme.md
done
echo >>readme.md
done



