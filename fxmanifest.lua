fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Mobius1'
description 'Deployable spy cameras for QBCore'
version '0.2.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
}

server_scripts {
    'config/config_server.lua',
    'server/main.lua'
}

client_scripts {
    'config/config_client.lua',
    'client/utils.lua',
    'client/main.lua'
}

dependencies {
    'qb-core',
    'ox_target',
}