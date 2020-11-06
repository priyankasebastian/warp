version 1.0

import "../../../../../../tasks/broad/GermlineVariantDiscovery.wdl" as Calling

workflow ReblockGVCF {

  String pipeline_version = "1.1.1"

  input {
    File gvcf
    File gvcf_index
    File ref_dict
    File ref_fasta
    File ref_fasta_index
  }

  String gvcf_basename = basename(gvcf, ".g.vcf.gz")

  call Calling.Reblock as Reblock {
    input:
      gvcf = gvcf,
      gvcf_index = gvcf_index,
      ref_fasta = ref_fasta,
      ref_fasta_index = ref_fasta_index,
      ref_dict = ref_dict,
      output_vcf_filename = gvcf_basename + ".reblocked.g.vcf.gz"
  }

  output {
    File output_vcf = Reblock.output_vcf
    File output_vcf_index = Reblock.output_vcf_index
  }
  meta {
    allowNestedInputs: true
  }
}
