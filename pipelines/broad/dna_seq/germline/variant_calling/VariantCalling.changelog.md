# 1.1.0
2021-06-17

* Added an optional step to reblock gVCFs, this step is included by default
    * The VariantCalling pipeline now outputs reblocked gVCFs by default. To skip reblocking, add '"VariantCalling.make_gvcf": false' in the inputs

# 1.0.0
2021-03-17

* Promoted VariantCalling to be a top-level workflow.