local utils = {};

---@param bodySlot BodyLocation|ItemBodyLocation
---@return string
function utils.getBodySlotText(bodySlot)
    local slotId

    -- BodyLocation object (most common in B42 UI)
    if bodySlot.getId then
        slotId = bodySlot:getId()

    -- ItemBodyLocation enum
    else
        -- fallback for some mods?
        -- tostring(ItemBodyLocation.BELT) -> "BELT"
        slotId = tostring(bodySlot)
    end

    local translation_name = bodySlot:getTranslationName()
    local localization_key = "UI_CUI_" .. translation_name
    local localized_text = getText(localization_key)

    -- If missing localization, return the translation name of a bodyslot
    if localized_text == localization_key then
        return translation_name
    end

    return localized_text
end

function utils.getCategoryButtonText(category)
    return getText("UI_CUI_Category_" .. category);
end

function utils.toBoolean(str)
    local bool = false
    if str == "true" then
        bool = true
    end
    return bool
end

return utils;
