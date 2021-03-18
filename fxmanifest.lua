fx_version 'bodacious'
games {'gta5'}

description 'SKIN CREATOR'

ui_page 'ui/index.html'
files {
    'ui/index.html',
	'ui/assets/*',
    'ui/assets/heritage/*',
    'ui/fonts/*',
    'ui/css/*',
    'ui/js/*',
}

-- Client Scripts
client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/fr.lua',
	'config.lua',
	'client/main.lua'
}

dependencies {
	'es_extended',
	'skinchanger'
}