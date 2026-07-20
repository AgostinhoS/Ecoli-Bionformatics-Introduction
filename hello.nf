//nextflow.enable.dsl = 2

process SAY_HELLO {
    input: val name
    output: stdout
    script: """echo Hello, ${name}!"""

}

//workflow {
 //   names_ch = Channel.of('World', 'Nextflow')
 //   SAY_HELLO(names_ch)
  //  SAY_HELLO.out.view()
//}