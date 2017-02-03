EXIT_CMDS = ['x', 'q', 'exit', 'quit']
RESPONSE_TYPES = ['keepalive', 'alive', 'short', 'open', 'recovery', 'rec', 'attenuation_warning', 'att', 'attenuation_recovery', 'att_rec']
DISPLAY_RESPONSE_TYPES = ['keepalive (alive)', 'short', 'open', 'recovery (rec)', 'attenuation_warning (att)', 'attenuation_recovery (att_rec)']
REQUIRED_PARAMS = {
	:keepalive => ['server_ip', 'device_id', 'device_version'],
	:short => ['server_ip', 'device_id', 'cable_id', 'distance'],
	:open => ['server_ip', 'device_id', 'cable_id', 'distance'],
	:recovery => ['server_ip', 'device_id', 'cable_id'],
	:attenuation_warning => ['server_ip', 'device_id', 'cable_id', 'att_db'],
	:attenuation_recovery => ['server_ip', 'device_id', 'cable_id',]
}
DISPLAY_PARAMS_PATTERNS = {
	'server_ip' => ['A.B.C.D[:PORT]', 'default: 127.0.0.1'],
	'device_id' => ['1645001', 'default: 132456'],
	'device_version' => ['1.3.11.1', 'default: 1.3.11'],
	'cable_id' => ['5421', 'default: 654321'],
	'distance' => ['1000', 'default: 500'],
	'att_db' => ['3.5', 'default: 3'],
}
PARAMS_PATTERNS = {
	'server_ip' => /[0-9]{1,3}\.[0-9\.]+{3}\:?[0-9]{1,5}/,
	'device_id' => /[0-9]{5,6}/,
	'device_version' => /[0-9\.]+/,
	'cable_id' => /[0-9]+/,
	'distance' => /[0-9]+/,
	'att_db' => /[0-9]+\.?[0-9]?+/,
}