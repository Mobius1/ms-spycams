Config = {}

-- Targeting
Config.TargetLib        = 'ox' -- 'ox' or 'qb'
Config.TargetDistance   = 2.5
Config.TargetIcon       = 'fa-solid fa-hand'

-- Placement config
Config.MaxPlaceHeight   = 0.6               -- Maximum allowed height above player in meters
Config.MaxPlaceDistance = 10.0              -- Maximum placement distance away from player in meters
Config.PlaceOnFloor     = true              -- Allows spycams to be placed on the floor / horizontal surfaces
Config.PlaceOnObjects   = true              -- Allows spycams to be placed on objects
Config.DrawOutline      = true              -- Draw outline during spy cam placement

-- Camera config
Config.ScreenEffect     = "heliGunCam"      -- Screen effect when viewing the camera
Config.EffectStrength   = 1.0               -- The strenght of the ScreenEffect between 0.0 and 1.0
Config.SignalDistance   = 100               -- Maximum distance in meters before signal loss occurs
Config.MaxRotationX     = 60.0              -- Maximum camera rotation on the x axis
Config.MaxRotationZ     = 60.0              -- Maximum camera rotation on the z axis
Config.DefaultFOV       = 80.0              -- The default FOV of the camera
Config.MinFOV           = 10.0              -- Minimum allowed FOV of the camera
Config.MaxFOV           = 80.0              -- Maximum allowed FOV of the camera
Config.ZoomStep         = 10.0              -- Change in FOV when zooming in / out
Config.MoveStep         = 0.8               -- Rate of change of rotation (degrees per frame)

Config.SelfDestructTime = 5                 -- Time in seconds before spycam self-destructs when triggered

-- Controls config
Config.Controls = {
    --!!!! DO NOT CHANGE THE TABLE KEYS UNLESS YOU KNOW WHAT YOU'RE DOING !!!!--

    -- Placement controls
    ['place'] = {
        ['cancel']  = { button = 25, label = Lang:t('controls.cancel') },
        ['place']   = { button = 24, label = Lang:t('controls.place') }
    },

    -- Camera controls
    ['camera'] = {
        ['disconnect']  = { button = 194,   label = Lang:t('controls.disconnect') },
        ['destroy']     = { button = 73,    label = Lang:t('controls.destroy') },
        ['mode']        = { button = 23,    label = Lang:t('controls.mode') },
        ['zoomin']      = { button = 96,    label = Lang:t('controls.zoomin') },
        ['zoomout']     = { button = 97,    label = Lang:t('controls.zoomout') },
        ['moveright']   = { button = 35,    label = Lang:t('controls.moveright') },
        ['movedown']    = { button = 33,    label = Lang:t('controls.moveright') },
        ['moveleft']    = { button = 34,    label = Lang:t('controls.moveleft') },
        ['moveup']      = { button = 32,    label = Lang:t('controls.moveup')},
    }    
}

-- Callback fired when entering the camera view
Config.OnEnterCam = function()
    
end

-- Callback fired when exiting the camera view
Config.OnExitCam = function()
    
end

-- List of material hashes a player can't place a spycam on
-- https://gist.github.com/DurtyFree/b37463ea9bfd3089fab696f554509977
Config.MaterialsBlacklist = {
    [-840216541] = true,
    [-124769592] = true,
    [2137197282] = true,
    [-979647862] = true,
    [2130571536] = true,
    [1247281098] = true,
    [602884284] = true,
    [1070994698] = true,
    [-1721915930] = true,
    [513061559] = true,
    [122789469] = true,
    [483400232] = true,
    [-460535871] = true,
    [652772852] = true,
    [1926285543] = true,
    [-236981255] = true,
    [-446036155] = true,
    [-1369136684] = true,
    [-1922286884] = true,
    [-1140112869] = true,
    [1457572381] = true,
    [32752644] = true,
    [-1469616465] = true,
    [-510342358] = true,
    [1045062756] = true,
    [113101985] = true,
    [-1557288998] = true,
    [1501153539] = true,
    [1777921590] = true,
    [2000961972] = true,
    [1718294164] = true,
    [-735392753] = true,
    [286224918] = true,
    [-1916939624] = true,
    [999829011] = true,
    [1345867677] = true,
    [-93061983] = true,
    [1913209870] = true,
    [-1595148316] = true,
    [510490462] = true,
    [909950165] = true,
    [-1907520769] = true,
    [-1136057692] = true,
    [509508168] = true,
    [1288448767] = true,
    [-786060715] = true,
    [-1931024423] = true,
    [-1937569590] = true,
    [-878560889] = true,
    [1619704960] = true,
    [1550304810] = true,
    [951832588] = true,
    [2128369009] = true,
    [-356706482] = true,
    [1925605558] = true,
    [-1885547121] = true,
    [-1942898710] = true,
    [312396330] = true,
    [1635937914] = true,
    [-273490167] = true,
    [1109728704] = true,
    [223086562] = true,
    [1584636462] = true,
    [-461750719] = true,
    [1333033863] = true,
    [-1286696947] = true,
    [-1833527165] = true,
    [581794674] = true,
    [-913351839] = true,
    [-2041329971] = true,
    [-309121453] = true,
    [-1915425863] = true,
    [1429989756] = true,
    [673696729] = true,
    [244521486] = true,
    [435688960] = true,
    [-634481305] = true,
    [-1634184340] = true,
    [-426118011] = true,
    [2100727187] = true,
    [-1693813558] = true,
    [-256704763] = true,
    [-235302683] = true,
    [2016463089] = true,
    [1345867677] = true,
    [-291631035] = true,
    [-1170043733] = true,
    [-2013761145] = true,
    [-1543323456] = true,
}