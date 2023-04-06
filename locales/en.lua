local Translations = {
    controls = {
        cancel      = "Cancel",
        place       = "Place Spycam",
        disconnect  = "Disconnect",
        destroy     = "Self-destruct",
        mode        = "Vision Mode",
        zoomin      = "Zoom In",
        zoomout     = "Zoom Out",
        moveright   = "Move Right",
        movedown    = "Move Down",
        moveleft    = "Move Left",
        moveup      = "Move Up",        
    },
    
    errors = {
        placed        = "You have the maximum number of spy cameras deployed",
        missing       = "You don't have any spy cameras deployed",
        invalid       = "Invalid placement",
    },

    general = {
        destroy     = "Spy camera will self-destruct in %{time} seconds",
        destroyed   = "Spy camera destroyed",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})