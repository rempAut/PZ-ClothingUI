local utils = {};

function utils.getBodySlotText(bodySlot)
    return getText("UI_CUI_" .. bodySlot);
end

function utils.getCategoryButtonText(category)
    return getText("UI_CUI_Category_" .. category);
end

return utils;
