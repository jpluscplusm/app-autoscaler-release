instance_groups: [...#ig]

#ig: #inscope | #notinscope

#inscope: {
	name: "asactors" | "asmetrics" | "asnozzle" | "asapi" | "postgres_autoscaler"
	vm_type: "fake_vm_type"
	...
}

#notinscope: {
	name: != "asactors" & != "asmetrics" & != "asnozzle" & != "asapi" & != "postgres_autoscaler"
	...
}
