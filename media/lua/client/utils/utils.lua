local utils = {};

function utils.getBodySlotText(bodySlot)
    return getText("UI_CUI_" .. bodySlot);
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
