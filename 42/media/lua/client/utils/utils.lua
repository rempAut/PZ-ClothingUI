local utils = {};

function utils.getBodySlotText(bodySlot)
    local slotId

    -- BodyLocation object (most common in B42 UI)
    if bodySlot.getId then
        slotId = bodySlot:getId()

    -- ItemBodyLocation enum
    else
        -- tostring(ItemBodyLocation.BELT) -> "BELT"
        slotId = tostring(bodySlot)
    end

    local key = "UI_CUI_" .. slotId
    local text = getText(key)

    -- If missing localization, return the raw id
    if text == key then
        return slotId
    end

    return text
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
