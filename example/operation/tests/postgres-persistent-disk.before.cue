instance_groups: [...#ig]

#ig: #pg | #notpg

#pg: {
	name: "postgres_autoscaler"
	// "assert that a key is missing" probably has a better representation in CUE ...
	persistent_disk_type?: true & false
	...
}

#notpg: {
	name: != "postgres_autoscaler"
	...
}
