params.chunkSize = 10 
params.input = "$baseDir/sample.fa"
params.output = 'outcome.txt'

fasta = file(params.input)
seq = Channel.from(fasta).splitFasta(by: params.chunkSize)


/*
 * Send fasta 2 script
 */
 
process send2Script {
    input:
    file 'seq.fa' from seq

    output:
    file 'out' into result

    """
    perl $baseDir/script.pl seq.fa > out
    """
}

result
  .collectFile(name: file(params.output))
.println { "Result saved to file: $it" }
