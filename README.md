# ms-spycams
 Deployable spy cameras for QBCore

## Dependencies
* [qb-core](https://github.com/qbcore-framework/qb-core)
* [ox_target](https://github.com/overextended/ox_target)

## Install
* Drag `ms-spycams` into your `resources` directory
* Add `ensure ms-spycams` to your  `server.cfg` AFTER `qb-core`
* The inventory images and items list are in the `INVENTORY` directory
* Adjust `config/config_client.lua` and `config/config_server.lua` to you liking
* Restart you server

## Usage
* Use the `spycam` item from your inventory to deploy a new spy camera
* Use the `spycam_tablet` item to connect to and control your deployed spy camera(s)
* Retrieve a spy camera by targeting it

If you don't want to utilise the `spycam_tablet` item, you can trigger the following events:

* 'spycams:client:connect' - connects to the spy cameras (if any are deployed)
* 'spycams:client:disconnect' - disconnects from the spy cameras

## Contributing
* Pull requests are welcome
