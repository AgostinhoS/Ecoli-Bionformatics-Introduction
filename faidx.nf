nextflow.enable.dsl = 2

process FAIDX {
    container 'staphb/samtools:1.19'
    publishDir 'results/reference', mode: 'copy'

    input:
    path(reference)

    output:
    tuple path(reference), path("${reference}.fai")

    script:
    """
    samtools faidx ${reference}
    """
}

workflow{
    ref_ch = Channel.of(file('results/reference/GCF_000005845.2.fasta'))
    FAIDX(ref_ch)
    FAIDX.out.view()
}