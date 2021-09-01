test:
	bosh int baseline.yml \
	| cue vet baseline.cue postgres-persistent-disk.before.cue yaml: -
	bosh int baseline.yml -o ../postgres-persistent-disk.yml \
	| cue vet baseline.cue postgres-persistent-disk.after.cue yaml: -
	bosh int baseline.yml -v alternative_vm_type=fake_vm_type \
	| cue vet baseline.cue alternative-vm-type.before.cue yaml: -
	bosh int baseline.yml -v alternative_vm_type=fake_vm_type -o ../alternative-vm-type.yml \
	| cue vet baseline.cue alternative-vm-type.after.cue yaml: -
