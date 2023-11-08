fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Mobius1'
description 'Deployable spy cameras for QBCore'
version '0.4.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'shared/utils.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/config_server.lua',
    'server/main.lua'
}

client_scripts {
    'config/config_client.lua',
    'client/main.lua'
}

dependencies {
    'qb-core',
    'ox_target',
}