instance_groups: [...#ig]

#ig: #interesting | #notinteresting

#interesting: {
	name: "asactors" | "asmetrics" | "asnozzle" | "asapi" | "postgres_autoscaler"
	vm_type: "fake_vm_type"
	...
}

#notinteresting: {
	name: != "asactors" & != "asmetrics" & != "asnozzle" & != "asapi" & != "postgres_autoscaler"
	...
}
