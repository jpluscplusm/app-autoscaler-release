instance_groups: [..._ig]

_ig: _inscope | _notinscope

_inscope: _asnozzle | _asapi

_asnozzle: {
	name: "asnozzle"
	jobs: [ ..._job]
	_job: _metricsgateway | _notinscope
	_metricsgateway: {
		name: "metricsgateway"
		properties: autoscaler: metricsgateway: nozzle: loggregator_rlp_tls: {
			cert:    "((/bosh-autoscaler/cf/loggregator_tls_rlp.certificate))"
			key:     "((/bosh-autoscaler/cf/loggregator_tls_rlp.private_key))"
			ca_cert: "((/bosh-autoscaler/cf/loggregator_ca.certificate))"
		}
	}
	_notinscope: {
		name: !="metricsgateway"
	}
}
_asapi: {
	name: "asapi"
	jobs: [ ..._job]
	_job: _metricsforwarder | _loggregator_agent | _notinscope
	_metricsforwarder: {
		name: "metricsforwarder"
		properties: autoscaler: metricsforwarder: loggregator: tls: {
			ca_cert: "((/bosh-autoscaler/cf/loggregator_tls_agent.ca))"
			cert:    "((/bosh-autoscaler/cf/loggregator_tls_agent.certificate))"
			key:     "((/bosh-autoscaler/cf/loggregator_tls_agent.private_key))"
		}
	}
	_loggregator_agent: {
		name: "loggregator_agent"
		properties: loggregator: tls: {
			ca_cert: "((/bosh-autoscaler/cf/loggregator_ca.certificate))"
			agent: {
				cert: "((/bosh-autoscaler/cf/loggregator_tls_agent.certificate))"
				key:  "((/bosh-autoscaler/cf/loggregator_tls_agent.private_key))"
			}
		}
	}
	_notinscope: {
		name: !="metricsforwarder" & !="loggregator_agent"
	}
}

_notinscope: {
	name: !="asnozzle" & !="asapi"
}
