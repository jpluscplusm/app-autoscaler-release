// This file disagrees with template.yml in several places, but `cue vet` will
// stop as soon as it finds a definitive error that means the schema (.cue)
// invalidates the input (template.yml). This might not be the obvious,
// top-level value disagreements that you imagine!  Comment out various
// elements in this file in order to observe different `cue vet` failure
// messages.

name: "deliberate test failure"

releases: [ ...#release ]

#release: #inscope | #notinscope
#inscope:  {
	name: "app-autoscaler"
	version: "earliest"
}

#notinscope: {
	name: string & != #inscope.name
	...
}

features: use_dns_addresses: "maybe"

update: {
  canaries: -1
  max_in_flight: 12345
}
