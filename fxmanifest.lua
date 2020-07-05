fx_version 'adamant'

game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'sv_main.lua',
	'config.lua'
}

client_scripts {
	'cl_main.lua',
	'config.lua'
}