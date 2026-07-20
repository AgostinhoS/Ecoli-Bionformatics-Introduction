//nextflow.enable.dsl = 2

process CALL_VARIANTS {
    tag "$sample_id"
    container 'staphb/bcftools:1.19'
    publishDir 'results/variants', mode: 'copy'

    input:
    tuple val(sample_id), path(bam), path(bai)
    tuple path(reference), path(fai)

    output:
    path("${sample_id}.vcf.gz"), emit: vcf
    path("${sample_id}.vcf.gz.csi"), emit: csi

    script:
    """
    bcftools mpileup -f ${reference} ${bam} | bcftools call -mv -Oz -o ${sample_id}.vcf.gz
    bcftools index ${sample_id}.vcf.gz
    """
}

//workflow {
 //   bam_ch = Channel.of(['SRR2584863', file('results/alignments/SRR2584863.sorted.bam'), file('results/alignments/SRR2584863.sorted.bam.bai')])
//    ref_ch = Channel.of([file('results/reference/GCF_000005845.2.fasta'), file('results/reference/GCF_000005845.2.fasta.fai')])
 //   CALL_VARIANTS(bam_ch, ref_ch)
  //  CALL_VARIANTS.out.vcf.view()
}