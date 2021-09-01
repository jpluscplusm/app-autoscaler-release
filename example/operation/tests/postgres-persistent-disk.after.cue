instance_groups: [...#ig]

#ig: #pg | #notpg

#pg: {
	name: "postgres_autoscaler"
	persistent_disk_type: "10GB"
	...
}

#notpg: {
	name: != "postgres_autoscaler"
	...
}
