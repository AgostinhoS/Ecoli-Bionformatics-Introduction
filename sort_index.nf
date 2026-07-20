//nextflow.enable.dsl = 2

process SORT_INDEX {
    tag '$sample_id'
    container 'staphb/samtools:1.19'
    publishDir 'results/alignments', mode: 'copy'

    input:
    tuple val(sample_id), path(sam)

    output:
    tuple val(sample_id), path("${sample_id}.sorted.bam"), path("${sample_id}.sorted.bam.bai")

    script:
    """
    samtools view -bS ${sam} | samtools sort -o ${sample_id}.sorted.bam
    samtools index ${sample_id}.sorted.bam
    """
}

//workflow {
//    sam_ch = Channel.of(tuple('SRR2584863', file('work/26/0c12405ed2e4846e6d85b9e37ef069/SRR2584863.sam')))
//    SORT_INDEX(sam_ch)
//    SORT_INDEX.out.view()
//}