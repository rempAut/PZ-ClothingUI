--[[ UI Position Manager

This module handles saving and loading UI element positions (toggle button and main window).
Positions are persisted to the INI file specified in config.

]] --

json = require "libs/json"
local config = require "pzclothingui/config"

local uiPositionManager = {}

-- Make sure parameter object is always valid
-- Checks if positions are within screen bounds
function uiPositionManager.checkParameters(paramIn)
    local xres = getCore():getScreenWidth()
    local yres = getCore():getScreenHeight()

    -- check if we are not rendering outside of game window
    if paramIn["toggleButton"].x > xres then
        paramIn["toggleButton"].x = xres * 0.5
    end
    if paramIn["instance"].x > xres then
        paramIn["instance"].x = xres * 0.5
    end

    if paramIn["toggleButton"].y > yres then
        paramIn["toggleButton"].y = yres * 0.5
    end
    if paramIn["instance"].y > yres then
        paramIn["instance"].y = yres * 0.5
    end

    return paramIn
end

-- Load saved UI positions from file
-- Returns table with toggleButton and instance positions
function uiPositionManager.loadSavedParameters()
    local reader = getFileReader(config.ini_filename, false)
    local parameters = {}

    local loadDefaults = false

    -- file found parse the json
    if reader then
        print("CUI - reading parameters from config file")
        local line = reader:readLine()
        reader:close()

        -- we need a protection against empty file or other malformed files
        if not line or line == nil or line == "" then
            print("CUI - invalid parameters files")
            loadDefaults = true
        else
            parameters = json.parse(line)
            -- parsed OK but key doesnt exists
            if not parameters["toggleButton"] or not parameters["instance"] then
                loadDefaults = true
                -- both keys exists but any member is missing
            elseif not (parameters["toggleButton"].x and parameters["toggleButton"].y and parameters["instance"].x and
                parameters["instance"].y and parameters["instance"].width and parameters["instance"].height) then
                loadDefaults = true
            end
        end

    else
        -- no file found, load default parameters
        loadDefaults = true
        print("CUI - No parameters file found")
    end

    if loadDefaults == true then
        print("CUI - Loading default parameters")
        parameters["toggleButton"] = {
            x = 500,
            y = 500
        }
        parameters["instance"] = {
            x = 300,
            y = 300,
            width = 8 * config.slot_button_size,
            height = 9 * (config.slot_button_vertical_spacing + config.slot_button_size)
        }
    end

    return parameters
end

-- Create parameters table from current UI element positions
-- Returns table with current toggleButton and instance positions
function uiPositionManager.createSavedParameters(toggleButton, instance)
    print("CUI - Saving button locations")
    local parameters = {}

    if toggleButton then
        parameters["toggleButton"] = {
            x = toggleButton.x,
            y = toggleButton.y
        }
    else
        parameters["toggleButton"] = {
            x = 500,
            y = 500
        }
    end

    if instance then
        parameters["instance"] = {
            x = instance.x,
            y = instance.y,
            width = instance.width,
            height = instance.height
        }
    else
        parameters["instance"] = {
            x = 300,
            y = 300,
            width = instance.width,
            height = instance.height
        }
    end

    return parameters
end

-- Save current UI positions to file
function uiPositionManager.saveToFile(toggleButton, instance)
    -- Check if the game window instance is created, if not it means that
    -- save was not triggered from the loaded game (new game route).
    if instance then
        -- get file
        print("CUI - Writing button location parameters to file")
        local writer = getFileWriter(config.ini_filename, true, false)

        -- write button locations parameters
        local savedParameters = uiPositionManager.createSavedParameters(toggleButton, instance)
        writer:write(json.stringify(savedParameters))
        writer:close()
    end
end

-- Reset UI positions to default values immediately
-- This is called from the mod options reset button
function uiPositionManager.resetToDefaults(toggleButton, instance)
    print("CUI - Resetting UI positions to defaults immediately")

    -- Reset toggle button position
    if toggleButton then
        toggleButton:setX(500)
        toggleButton:setY(500)
        print("CUI - Toggle button position reset to (500, 500)")
    end

    -- Reset instance window position
    if instance then
        instance:setX(300)
        instance:setY(300)
        print("CUI - Instance window position reset to (300, 300)")
    end
end

return uiPositionManager

