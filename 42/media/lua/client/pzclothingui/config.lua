--[[ Config and default values

This module provides default configuration values for PZ-ClothingUI.
The actual values are populated by the modOptions/options.lua file when the game loads.
Settings are managed through Build 42's native PZAPI.ModOptions system.

]] --

-- Config object will hold all the configs
local config = {}

-- INI file name for saving UI positions
config.ini_filename = "clothinguib42.ini"

-- Default values (used before options are loaded)
config.display_slot_labels = true
config.slot_label_margin = 25
config.slot_button_horizontal_spacing = 10
config.slot_button_vertical_spacing = 20
config.slot_button_size = 40

return config
