arguments:
- {position: 2, valueFrom: $(inputs.gtf)}
baseCommand: [rpkmToTpm.py]
class: CommandLineTool
cwlVersion: v1.0
doc: Convert isoform.fpkm to TPM
hints:
- {class: DockerRequirement, dockerPull: 'quay.io/smc-rna-challenge/jeltje-9610378-fluxcapacitor:1.0.0'}
inputs:
- {id: gtf, type: File}
- {id: outfile, type: string}
outputs:
- {id: tpmfile, type: stdout}
requirements:
- {class: InlineJavascriptRequirement}
stdout: $(inputs.outfile)
