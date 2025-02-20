# 2.0.0
2021-08-17

Updated to ReblockGVCF in [GATK 4.2.2.0](https://github.com/broadinstitute/gatk/releases/tag/4.1.1.0).  Now output GVCFs: 
  *  Cover every position
  *  Do not contain overlapping reference blocks
  *  Have correct reference allele following trimmed deletions
Tool, task, and workflow now require a reference.

# 1.1.0
2020-09-25

* Updated GATK docker image for all tasks from [GATK 4.1.1.0](https://github.com/broadinstitute/gatk/releases/tag/4.1.1.0) to [GATK 4.1.8.0](https://github.com/broadinstitute/gatk/releases/tag/4.1.8.0).
    * Numerous bug fixes and improvements, including better VQSR reliability for allele-specific filtering.
    * Addition of new Scattered CrosscheckFingerprints to pipeline

# 1.0.1
2020-08-28

* Added 'allowNestedInputs: true' metadata parameter to wdl to support Cromwell version 48 and above

# 1.0
Initial release of the ReblockGVCF pipeline. This is a WDL 1.0 version of the [workflow run in Terra](https://portal.firecloud.org/?return=terra#methods/methodsDev/ReblockGVCF-gatk4_exomes_goodCompression/4) for joint-genotyping projects. 