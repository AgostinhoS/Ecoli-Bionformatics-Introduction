//nextflow.enable.dsl = 2

process DOWNLOAD_REFERENCE {
    container 'staphb/ncbi-datasets:16.15.0'
    publishDir 'results/reference', mode: 'copy'

    input:
    val accession

    output:
    path("${accession}.fasta")

    script:
    """
    datasets download genome accession ${accession} --include genome
    unzip ncbi_dataset.zip
    find ncbi_dataset -name "*.fna" -exec mv {} ${accession}.fasta \\;
    """
}

//workflow {
//    ref_ch = Channel.of('GCF_000005845.2')  // E. coli K-12 MG1655
//    DOWNLOAD_REFERENCE(ref_ch)
//    DOWNLOAD_REFERENCE.out.view()
//}