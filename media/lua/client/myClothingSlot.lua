require "ISUI/ISPanel"
require "ISUI/ISButton"
require "ISUI/ISInventoryPane"
require "ISUI/ISInventoryPage"
require "ISUI/ISResizeWidget"
require "ISUI/ISMouseDrag"
require "ISUI/ISLayoutManager"
require "ISUI/ISToolTipInv"
require "TimedActions/ISInventoryTransferAction"

myClothingSlot = ISButton:derive("myClothingSlot");
local textMargin = 15;

-- same function in ISInventoryPaneContextMenu
local function predicateNotBroken(item)
    return not item:isBroken()
end

function myClothingSlot:new (x, y, width, height, slotTitle, slotItem )
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

    o.slotItem = slotItem;
    o.slotTitle = slotTitle;
    o.activeItemTooltip = ISToolTipInv:new(slotItem);
    o.activeItemTooltip:setVisible(false);
    o:setClothingPicture(slotItem);
    return o
end

-- re-render and handle mouse event on the button
function myClothingSlot:render()

    local equippedItem = self.slotItem;
    ISButton.render(self);
    self:setClothingPicture(equippedItem);

    --draw name of the slot
    local textWidth = getTextManager():MeasureStringX(UIFont.Small, self.slotTitle) + 10;
    self:drawTextRight(self.slotTitle, textWidth - 8 , -textMargin , 1, 1, 1, 1, UIFont.Small);

    if equippedItem then
        -- if item equip, handle item tooltip
        if self.mouseOver then
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

-- set item picture on the button
function myClothingSlot:setClothingPicture(item)

    if item == nil then
        self:setTextureRGBA(0.0,0.0,0.0, 0.0);
        return
    else
        self:setImage(item:getTexture());
        local tint = item:getVisual():getTint(item:getClothingItem());
        self:setTextureRGBA(tint:getRedFloat(), tint:getGreenFloat(), tint:getBlueFloat(), 1.0);
        self:forceImageSize(self.width*0.8, self.height*0.8);
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

	local context = ISContextMenu.get(getPlayer():getPlayerNum(), getMouseX(), getMouseY());
	local found = false;

    -- first check for remove
	if self.slotItem ~= nil then
		ISInventoryPaneContextMenu.createMenu(0, true, {self.slotItem}, self:getAbsoluteX() + x + 30, self:getAbsoluteY() + y)
		found = true;
	end

    local subMenuAttach;

    local replacements = {};

    -- seach tru our inventory
    local playerObj = getPlayer();
    local playerInv = playerObj:getInventory();

    -- find a clothing item of this category
    for i=0, playerInv:getItems():size()-1 do
        local loopitem = playerInv:getItems():get(i);
        if (loopitem:getBodyLocation() == self.slotTitle ) and not ( loopitem:isEquipped()) then
            table.insert(replacements, loopitem);

            if not subMenuAttach then
                local subOption = context:addOptionOnTop(getText("EQUIP"), nil);
                subMenuAttach = context:getNew(context);
                context:addSubMenu(subOption, subMenuAttach);
            end
            subMenuAttach:addOption(loopitem:getDisplayName(), self, self.equipItem, loopitem);
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
