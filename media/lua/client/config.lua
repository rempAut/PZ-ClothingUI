local function OnApply(self, val)
    self:resetLua()
end

-- Config object will hold all the configs we have, we are using our own object
-- to be independent on the options plugin. Aka our code will work even without the plugin.
local config = {};

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
            "45",
            "50",
            "55",
            "60",
            "65",
            "70",
            "75",
            "80",
            "85",
            "90",
            name = "IGUI_CUI_Slot_horizontal_spacing",
            tooltip = "IGUI_CUI_Slot_horizontal_spacing_tooltip",
            default = 1,
            OnApplyMainMenu = OnApply
        },
        slot_button_vertical_spacing = {
            "65",
            "70",
            "75",
            "80",
            "85",
            "90",
            "95",
            name = "IGUI_CUI_Slot_vertical_spacing",
            tooltip = "IGUI_CUI_Slot_vertical_spacing_tooltip",
            default = 1,
            OnApplyMainMenu = OnApply
        },
        slot_button_size = {
            "40",
            "45",
            "50",
            "55",
            "60",
            "65",
            name = "IGUI_CUI_Slot_button_size",
            tooltip = "IGUI_CUI_Slot_button_size_tooltip",
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
    config.slot_label_margin = tonumber(SETTINGS.options_data.slot_label_margin[SETTINGS.options.slot_label_margin]);
    config.slot_button_horizontal_spacing = tonumber(
        SETTINGS.options_data.slot_button_horizontal_spacing[SETTINGS.options.slot_button_horizontal_spacing]);
    config.slot_button_vertical_spacing = tonumber(SETTINGS.options_data.slot_button_vertical_spacing[SETTINGS.options
                                                       .slot_button_vertical_spacing]);
    config.slot_button_size = tonumber(SETTINGS.options_data.slot_button_size[SETTINGS.options.slot_button_size]);
end

if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(SETTINGS);
    -- In case we click onApply even ingame we want to run config setup 
    function settings:OnApply()
        setupConfig();
    end

    ModOptions:loadFile();
    -- This is on the load of the game, we want to setup the config
    setupConfig();
else
    -- In case the user will not have ModOptions installed - default values will work without the plugin!
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

return config;

