//nextflow.enable.dsl = 2

process DOWNLOAD_SRA {
    tag "$sra_id"
    container 'ncbi/sra-tools:3.2.1'
    publishDir 'results/raw_reads', mode: 'copy'
    shell '/bin/sh'

    input:
    val sra_id

    output:
    tuple val(sra_id), path("${sra_id}_1.fastq.gz"), path("${sra_id}_2.fastq.gz")

    script:
    """
    prefetch ${sra_id}
    fasterq-dump --split-files ${sra_id}
    gzip ${sra_id}_1.fastq
    gzip ${sra_id}_2.fastq
    """
}

//workflow {
 //   sra_ch = Channel.of('SRR2584863')  // E. coli, paired-end Illumina
 //   DOWNLOAD_SRA(sra_ch)
 //   DOWNLOAD_SRA.out.view()
//}

//ls -lh results/raw_reads/ to see results