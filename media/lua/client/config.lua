local function OnApply(self, val)
    self:resetLua()
end

-- Config object will hold all the configs we have, we are using our own object
-- to be independent on the options plugin. Aka our code will work even without the plugin.
local config = {};

local SETTINGS = {
    options_data = {
        display_slot_labels = {
            name = "Display cloting slot labels",
            tooltip = "Some tooltip",
            default = true,
            OnApplyMainMenu = OnApply
        },
        slot_label_margin = {
            "15",
            "25",
            "30",
            "35",
            name = "Cloting slot label margin",
            tooltip = "tooltip",
            default = 1,
            OnApplyMainMenu = OnApply
        }
    },
    mod_id = 'myclothinguimod',
    mod_shortname = 'Clothing UI',
    mod_fullname = 'PZ Clothing UI'
}

-- We need to setup the values from the plugin
function setupConfig()
    config.display_slot_labels = SETTINGS.options.display_slot_labels;
    config.slot_label_margin = SETTINGS.options_data.slot_label_margin[SETTINGS.options.slot_label_margin];
end

if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(SETTINGS);

    -- In case we click onApply even ingame we want to setup 
    function settings:OnApply()
        setupConfig();
    end

    ModOptions:loadFile();
    -- This is on the load of the game, we want to setup the config
    setupConfig();
else
    -- In case the user will not have ModOptions installed - default values will work without the plugin!
    config.display_slot_labels = SETTINGS.options_data.display_slot_labels.default;
    config.slot_label_margin = SETTINGS.options_data.slot_label_margin[SETTINGS.options_data.slot_label_margin.default];
end

return config;

