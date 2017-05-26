baseCommand: [flux-capacitor]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- id: bam
  inputBinding: {prefix: --input}
  type: File
- id: index
  inputBinding: {prefix: --annotation, valueFrom: $(self.path)/gencode.v19.gtf}
  type: Directory
- default: PAIRED
  id: mapping
  inputBinding: {prefix: --annotation-mapping}
  type: string
- default: sample.gtf
  doc: name for gtf format output file
  id: output_filename
  inputBinding: {prefix: --output}
  type: string
- default: MATE2_SENSE
  id: strand
  inputBinding: {prefix: --read-strand}
  type: string
- default: 8
  id: threads
  inputBinding: {prefix: --threads}
  type: int
outputs:
- id: gtf
  outputBinding: {glob: $(inputs.output_filename)}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: jeltje/fluxcapacitor}
