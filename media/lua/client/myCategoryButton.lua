require "ISUI/ISButton"

myCategoryButton = ISButton:derive("myCategoryButton");

-- same function in ISInventoryPaneContextMenu
local function predicateNotBroken(item)
    return not item:isBroken()
end

function myCategoryButton:new (x, y, width, height, category, locations )
    local o = {}
    o = ISButton:new(x, y, width, height, category);
    setmetatable(o, self)
    self.__index = self
    o.category = category
    o.locations = locations;
    return o
end

function myCategoryButton:onRightMouseUp(x, y)

    -- create equip menu from available items
    if UIManager.getSpeedControls():getCurrentGameSpeed() == 0 then
		return;
	end

    local player = getPlayer();
    local playerNum = player:getPlayerNum();
    local playerInv = player:getInventory();
    local playerItems = playerInv:getItems();
    local context = ISContextMenu.get(playerNum, getMouseX(), getMouseY());

    local bfound = false;

    -- browse all items in player's inventory
    for i=0, playerItems:size()-1 do
        local loopitem = playerItems:get(i);
        -- check if item is part of (body)locations of this category and not currently equipped
        if (self.locations[loopitem:getBodyLocation()]) and not loopitem:isEquipped() then
            local displayString = loopitem:getDisplayName().."  ["..loopitem:getBodyLocation().."]";
            context:addOption(displayString, self, self.equipItem, loopitem);
            bfound = true;
        end
    end

    if not bfound then
        local option = context:addOption("No avaliable item in inventory");
    end

end

-- equip item action when clicked in the menu
function myCategoryButton:equipItem(item)

    ISInventoryPaneContextMenu.onWearItems({ item }, getPlayer():getPlayerNum())

end
