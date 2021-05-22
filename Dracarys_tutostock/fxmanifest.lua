
fx_version 'adamant'

game 'gta5'


server_script 	'@mysql-async/lib/MySQL.lua' 

client_scripts {
	'dep/menu.lua',
	'cl_dracoffre.lua',
	'@es_extended/locale.lua',
	 'config.lua'
}

server_scripts {
      'sv_dracoffre.lua',
	  '@mysql-async/lib/MySQL.lua',
	  '@es_extended/locale.lua',
}



