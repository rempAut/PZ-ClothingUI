--[[ Config and default values

We are using the options mod for user ability to setup the mods https://steamcommunity.com/sharedfiles/filedetails/?id=2169435993&searchtext=options
All the values should be configured in the SETTINGS object. All the texts should be in in the IG_UI_EN.txt files and linked via IGUI_CUI_<yourName>

The final config for the plugin is suppose to be in the object config. That's where the rest of the code takes the values. 

There are 3 ways how the config object can be initliazed and when adding new option you need to fix and verify all 3 ways:
1. Option plugin is installed
   See the function setupConfig(), over here you need to take the values from the plugin and save it into the config object. 

2. Option plugin is not installed
   See the function setupDefaultConfig(), over here you need to take the values from the SETTINGS object and save them into cofig.

3. Option plugin has been installed in the past / is not enabled on multiplayer
   In this case, there exists the "mods_options.ini" file, we want to read it and check if there are any settings we are looking for and 
   in case we found them. Use them.


]] --
local utils = require "pzclothingui/utils/utils"

-- Config object will hold all the configs we have, we are using our own object
-- to be independent on the options plugin. Aka our code will work even without the plugin.
local config = {};

local function OnApply(self, val)
    self:resetLua()
end

local SETTINGS = {
    options_data = {
        display_slot_labels = {
            name = "IGUI_CUI_Display_slot_label",
            tooltip = "IGUI_CUI_Display_slot_label_tooltip",
            default = true,
            OnApplyMainMenu = OnApply
        },
        slot_label_margin = {
            "15",
            "25",
            "30",
            "35",
            name = "IGUI_CUI_Slot_label_margin",
            tooltip = "IGUI_CUI_Slot_label_margin_tooltip",
            default = 1,
            OnApplyMainMenu = OnApply
        },
        slot_button_horizontal_spacing = {
            "5",
            "10",
            "15",
            "20",
            "25",
            "30",
            "35",
            "40",
            "45",
            "50",
            name = "IGUI_CUI_Slot_horizontal_spacing",
            tooltip = "IGUI_CUI_Slot_horizontal_spacing_tooltip",
            default = 2,
            OnApplyMainMenu = OnApply
        },
        slot_button_vertical_spacing = {
            "15",
            "20",
            "25",
            "30",
            "25",
            "30",
            "35",
            "40",
            name = "IGUI_CUI_Slot_vertical_spacing",
            tooltip = "IGUI_CUI_Slot_vertical_spacing_tooltip",
            default = 2,
            OnApplyMainMenu = OnApply
        },
        slot_button_size = {
            "30",
            "35",
            "40",
            "45",
            "50",
            "55",
            "60",
            "65",
            name = "IGUI_CUI_Slot_button_size",
            tooltip = "IGUI_CUI_Slot_button_size_tooltip",
            default = 3,
            OnApplyMainMenu = OnApply
        }
    },
    mod_id = 'myclothinguimod',
    mod_shortname = 'Clothing UI',
    mod_fullname = 'PZ Clothing UI'
}

-- In case the user will not have ModOptions installed - default values will work without the plugin!
-- 2# Option of loding config
local function setupDefaultConfig()
    config.display_slot_labels = SETTINGS.options_data.display_slot_labels.default;
    config.slot_label_margin = tonumber(SETTINGS.options_data.slot_label_margin[SETTINGS.options_data.slot_label_margin
                                            .default]);
    config.slot_button_horizontal_spacing = tonumber(
        SETTINGS.options_data.slot_button_horizontal_spacing[SETTINGS.options_data.slot_button_horizontal_spacing
            .default]);
    config.slot_button_vertical_spacing = tonumber(
        SETTINGS.options_data.slot_button_vertical_spacing[SETTINGS.options_data.slot_button_vertical_spacing.default]);
    config.slot_button_size = tonumber(SETTINGS.options_data.slot_button_size[SETTINGS.options_data.slot_button_size
                                           .default]);
end

local function triggerConfigLoad()
     -- No config file, let's load the default values
    setupDefaultConfig()
end

-- Trigger the options when you launch the game
triggerConfigLoad();

config.triggerConfigLoad = triggerConfigLoad;

return config;
