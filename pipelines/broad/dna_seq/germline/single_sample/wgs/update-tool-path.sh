#!/bin/bash

####### this bash script file updates the tool paths for onprem runs ############

echo "changing picard tool path"
sed -i  's|/usr/picard/picard.jar|/mnt/lustre/genomics/tools/picard.jar|g' *.wdl
sed -i  's|/usr/gitc/picard-private.jar|/mnt/lustre/genomics/tools/picard.jar|g' *.wdl
sed -i  's|/usr/gitc/picard.jar|/mnt/lustre/genomics/tools/picard.jar|g' *.wdl


echo "updating tool path for gatk"
sed -i 's|gatk --java|/mnt/lustre/genomics/tools/gatk/gatk --java|g' *.wdl
sed -i 's|/root/gatk.jar|/mnt/lustre/genomics/tools/gatk.jar --java|g' *.wdl


echo "updating tool path for samtools"
sed -i 's|samtools|/mnt/lustre/genomics/tools/samtools/samtools |g' *.wdl
sed -i 's|seq_cache_populate\.pl|/mnt/lustre/genomics/tools/samtools/misc/seq_cache_populate\.pl |g' *.wdl

echo "updating tool path for verifybamid"
sed -i 's|/usr/gitc/VerifyBamID|/mnt/lustre/genomics/tools/VerifyBamID/bin/VerifyBamID |g' BamProcessing.wdl


echo "updating tool path for bwa"
sed -i 's|/usr/gitc/bwa|/mnt/lustre/genomics/tools/bwa-0.7.17/bwa|g' *.wdl
sed -i 's|/usr/gitc/~{bwa_commandline}|/mnt/lustre/genomics/tools/bwa/~{bwa_commandline}|g' *.wdl
