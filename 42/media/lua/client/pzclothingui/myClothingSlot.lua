require "ISUI/ISPanel"
require "ISUI/ISButton"
require "ISUI/ISInventoryPane"
require "ISUI/ISInventoryPage"
require "ISUI/ISResizeWidget"
require "ISUI/ISMouseDrag"
require "ISUI/ISLayoutManager"
require "ISUI/ISToolTipInv"
require "TimedActions/ISInventoryTransferAction"

local utils = require "utils/utils"
local config = require "config";

myClothingSlot = ISButton:derive("myClothingSlot");

-- same function in ISInventoryPaneContextMenu
local function predicateNotBroken(item)
    return not item:isBroken()
end

function myClothingSlot:new (x, y, width, height, bodyLocation, slotItem )
    local o = {}
    o = ISButton:new(x, y, width, height);
    setmetatable(o, self)
    self.__index = self

    o.borderColor.r = 0.5;
    o.borderColor.g = 0.9;
    o.borderColor.b = 0.5;
    o.borderColor.a = 0.7;

    o.backgroundColor.r = 0.5;
    o.backgroundColor.g = 0.5;
    o.backgroundColor.b = 0.5;
    o.backgroundColor.a = 0.3;

    o.backgroundColorMouseOver.a = 0.8;
    o.contextMenu = nil;
    o.slotItem = slotItem;
    o.bodyLocation = bodyLocation;
    o.activeItemTooltip = ISToolTipInv:new(slotItem);
    o.activeItemTooltip:setOwner(o);
    o.activeItemTooltip:setVisible(false);
    o.activeItemTooltip:addToUIManager();
    o:setClothingPicture(slotItem);
    return o
end

-- re-render and handle mouse event on the button
function myClothingSlot:render()

    ISButton.render(self);
    self:setClothingPicture(self.slotItem);

    --draw name of the slot    
    if config.display_slot_labels then
        local slotName = utils.getBodySlotText(self.bodyLocation);        
        self:drawText(slotName, 0 , -config.slot_label_margin, 1, 1, 1, 1);    
    end

    if self.slotItem then
        -- if item equipped, handle item tooltip
        if self.mouseOver and (self.contextMenu == nil or not self.contextMenu.visibleCheck ) then -- show tooltip when mouse over or context menu is not visible
            self.activeItemTooltip:bringToTop();
            self.activeItemTooltip:setVisible(true);
        else
            self.activeItemTooltip:setVisible(false);
        end;
    else
        -- else no item equipped, remove item tooltip
        self:removeItemTooltip();
    end

end

-- fctn called in render
function myClothingSlot:removeItemTooltip()

    if self.activeItemTooltip then
        self.activeItemTooltip:removeFromUIManager();
        self.activeItemTooltip:setVisible(false);
    end

end

function myClothingSlot:close()
    ISButton.close(self);
    self.activeItemTooltip:setVisible(false);
    self.activeItemTooltip:removeFromUIManager();
    
end

-- set item picture on the button
function myClothingSlot:setClothingPicture(item)

    if item == nil then
        self:setTextureRGBA(0.0, 0.0, 0.0, 0.0);
        return
    else
        self:setImage(item:getTexture());
        local visual = item:getVisual();
        local tint = nil;
        -- make sure tint of texture is defined
        if visual then
            tint = visual:getTint(item:getClothingItem());
        end
        if tint ~= nil then
            self:setTextureRGBA(tint:getRedFloat(), tint:getGreenFloat(), tint:getBlueFloat(), 1.0);
        end
        self:forceImageSize(self.width * 0.8, self.height * 0.8);
    end
end

-- equip item action when clicked in the menu
function myClothingSlot:equipItem(item)

    ISInventoryPaneContextMenu.onWearItems({ item }, getPlayer():getPlayerNum())

end


function myClothingSlot:doMenu(x,y)
	if UIManager.getSpeedControls():getCurrentGameSpeed() == 0 then
		return;
	end

    local playerObj = getPlayer();
    local playerInv = playerObj:getInventory();

	self.contextMenu = ISContextMenu.get(playerObj:getPlayerNum(), getMouseX(), getMouseY());
	local found = false;

    -- first check for remove
	if self.slotItem ~= nil then
		ISInventoryPaneContextMenu.createMenu(0, true, {self.slotItem}, self:getAbsoluteX() + x + 30, self:getAbsoluteY() + y)
		found = true;
	end

    local subMenuAttach;

    -- find a clothing item of this category
    for i=0, playerInv:getItems():size()-1 do
        local loopitem = playerInv:getItems():get(i);
        if (loopitem:getBodyLocation() == self.bodyLocation ) and not ( loopitem:isEquipped()) then

            if not subMenuAttach then
                local subOption = self.contextMenu:addOptionOnTop(getText("EQUIP"), nil);
                subMenuAttach = self.contextMenu:getNew(self.contextMenu);
                self.contextMenu:addSubMenu(subOption, subMenuAttach);
            end
            local option = subMenuAttach:addOption(loopitem:getDisplayName(), self, self.equipItem, loopitem);
            ISInventoryPaneContextMenu.doWearClothingTooltip(playerObj, loopitem, loopitem, option);
            found = true;

        end
    end

	if not found then
		local option = context:addOption("No avaliable item in inventory");
	end
end

function myClothingSlot:onMouseDoubleClick(x,y)

    if(self.slotItem) then
        ISInventoryPaneContextMenu.unequipItem( self.slotItem , getPlayer():getPlayerNum());
    else
    end

end


function myClothingSlot:onRightMouseUp(x, y)

    local playerObj = getPlayer();
    -- do nothing if sleeping
    if playerObj:isAsleep() then
        return
    end
    -- create right click context menu
    self:doMenu(x,y);

end
