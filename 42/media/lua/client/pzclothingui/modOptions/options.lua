-- Using example of mod options as template
local config = {}
local options = PZAPI.ModOptions:create("myclothinguimod", "PZ-ClothingUI Settings")

-- define your options here .....
options:addKeyBind("keybind_open_equiped", "Open/Close equiped clothes window", Keyboard.KEY_NONE)

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
            config[k] = v:getValue()
        end
    end
end

Events.OnMainMenuEnter.Add(function()
    options:apply()
end)

-- We now return the `config` object, so it can be used as a module!
return config
