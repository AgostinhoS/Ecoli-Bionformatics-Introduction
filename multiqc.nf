//nextflow.enable.dsl = 2

process MULTIQC {
    container 'multiqc/multiqc:v1.21'
    publishDir 'results/multiqc', mode: 'copy'

    input:
    path(files)

    output:
    path("multiqc_report.html")

    script:
    """
    multiqc .
    """
}

//workflow {
 //   qc_files = Channel.fromPath([
  //      'results/fastqc/*.zip',
   //     'results/trimmed/*.json'
 //   ]).collect()
//
 //   MULTIQC(qc_files)
  //  MULTIQC.out.view()
//}