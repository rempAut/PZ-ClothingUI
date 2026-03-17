-- Using example of mod options as template
-- Import the actual config module that is shared across the mod
local config = require "pzclothingui/config"
local options = PZAPI.ModOptions:create("myclothinguimod", "PZ-ClothingUI Settings")

-- Add informational text
options:addDescription("Note: Close and reopen the Clothing UI window to see changes")

-- Keybind option
options:addKeyBind("keybind_open_equiped", "Open/Close equiped clothes window", Keyboard.KEY_NONE)

-- Checkbox for display_slot_labels
options:addTickBox("display_slot_labels", "Display clothing slot labels", true, "Display or hide slot label")

-- Slider for slot_label_margin (15-35, step 5, default 25)
options:addSlider("slot_label_margin", "Clothing slot label margin", 15, 35, 5, 25, "Distance between the label and icon. Increase to move up")

-- Slider for slot_button_horizontal_spacing (5-50, step 5, default 10)
options:addSlider("slot_button_horizontal_spacing", "Clothing slot horizontal spacing", 5, 50, 5, 10, "Horizontal gap between the slot icons.")

-- Slider for slot_button_vertical_spacing (15-40, step 5, default 20)
options:addSlider("slot_button_vertical_spacing", "Clothing slot vertical spacing", 15, 40, 5, 20, "Vertical gap between the slot icons.")

-- Slider for slot_button_size (30-65, step 5, default 40)
options:addSlider("slot_button_size", "Clothing slot icon size", 30, 65, 5, 40, "Size of the button")

-- This is a helper function that will automatically populate the "config" table.
--- Retrieve each option as: config."ID"
options.apply = function(self)
    for k, v in pairs(self.dict) do
        if v.type == "multipletickbox" then
            for i = 1, #v.values do
                config[(k .. "_" .. tostring(i))] = v:getValue(i)
            end
        elseif v.type == "button" then
            -- do nothing
        else
            -- For sliders, tickboxes, and other controls, getValue() returns the actual value
            config[k] = v:getValue()
        end
    end
end

Events.OnMainMenuEnter.Add(function()
    options:apply()
end)

-- We now return the `config` object, so it can be used as a module!
return config
