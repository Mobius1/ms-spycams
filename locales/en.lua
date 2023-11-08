local Translations = {
    target = {
        label = "Retrieve"
    },
    
    controls = {
        cancel      = "Cancel",
        place       = "Place Spycam",
        disconnect  = "Disconnect",
        destroy     = "Self-destruct",
        mode        = "Mode",
        zoomin      = "Zoom In",
        zoomout     = "Zoom Out",
        moveright   = "Right",
        movedown    = "Down",
        moveleft    = "Left",
        moveup      = "Up",
        prev        = "Previous Cam",
        next        = "Next Cam",
    },
    
    errors = {
        placed        = "You have the maximum number of spy cameras deployed",
        missing       = "You don't have any spy cameras deployed",
        invalid       = "Invalid placement",
        range         = "Camera out of range - cannot send self-destruct signal",
    },

    notifications = {
        placed = 'Camera Placed'
    },

    general = {
        destroy     = "Spy camera will self-destruct in %{time} seconds",
        destroyed   = "Spy camera destroyed",
        nosignal    = "NO SIGNAL",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})