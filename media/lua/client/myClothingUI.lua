require "ISUI/ISCollapsableWindow"
require "ISUI/ISPanelJoypad"
require "ISUI/ISLabel"
json = require "libs/json"
local config = require "config";
local clothingCategories = require "clothingCategories";

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)

local buttonVerticalOffset = 5; -- offset from the top of main window
local buttonHorizontalOffset = 20; -- offset from the category button
local toggleButton = {};
local instance = {};


myClothingUI = ISCollapsableWindow:derive("myClothingUI");

function myClothingUI:new(x, y, width, height)

    local o = {}
    o = ISCollapsableWindow:new(x, y, width, height); -- like inventory window
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = {
        r = 0,
        g = 0,
        b = 0,
        a = 0.8
    };
    o.borderColor = {
        r = 0.4,
        g = 0.4,
        b = 0.4,
        a = 1
    };

    o.categoryButtons = {};

    return o
end


function myClothingUI:update()
    
    -- return if window not initialized
    if instance == nil then 
        return 
    end

    if not instance:getIsVisible() then
        return
    end

    --get currently equipped items.
    local playerObj = getPlayer();
    local playerInv = playerObj:getInventory();
    local playerItems =  playerInv:getItems();
    
    local currentlyEquipped = {};
    currentlyEquipped.items = {};
    currentlyEquipped.count = 0;
    
    -- find equipped clothing items
    for i=0, playerItems:size()-1 do
        local loopitem = playerItems:get(i);
        if loopitem:isEquipped() and loopitem:IsClothing() then
            currentlyEquipped.items[loopitem:getBodyLocation()] = loopitem; --body location is a key.
            currentlyEquipped.count = currentlyEquipped.count + 1;
        end
    end

    -- you are naked
    if currentlyEquipped.count == 0 then
        myClothingUI:removeItemButtons();
        return;
    end;


    if instance.itemCount then
         -- if different number of items detected, redraw
        if instance.itemCount ~= currentlyEquipped.count then
            myClothingUI:drawButtonsFromItems(currentlyEquipped.items,currentlyEquipped.count);
            return;
        end;

        -- check if there are differences in equipped and shown items
        local myInstance = instance.displayedSlots;
        for k, v in pairs(currentlyEquipped.items) do
             -- category not found or item has changed
             if (not instance.displayedSlots[k]) or (instance.displayedSlots[k].item ~= v ) then
                    myClothingUI:drawButtonsFromItems(currentlyEquipped.items,currentlyEquipped.count);
                return;
             end
        end
    end

end

function myClothingUI:getClothingItemCategory(itemBodyLocation)

    local itemCategory = nil;

    -- find assigned category to this body location
    for k, v in pairs(clothingCategories) do
        if v[itemBodyLocation] then
            itemCategory = k;
            break;
        end;
    end

    return itemCategory;

end

local function addClothingCategory(category, bodyLocation, inClothingCategories)
    if inClothingCategories[category] then
        inClothingCategories[category][bodyLocation] = true;
    end
end

function myClothingUI:drawButtonsFromItems(itemSet, itemCount)
    print("/////////redrawing//////////");
    -- create mySlotIstance for each clothing item category
    myClothingUI:removeItemButtons();
    instance.displayedSlots = {};
    instance.itemCount = itemCount;
    local idx = 0;

    -- init category indexes - store position of displayed button for this category
    local categoryIdx = {};
    for k, v in pairs(clothingCategories) do
        categoryIdx[k] = 1;
    end

    -- handle drawing of item categories
    local itemBodyLocation = {};

    for k, item in pairs(itemSet) do

        itemBodyLocation = item:getBodyLocation();

        -- decide master category for this item's location
        local itemCategory = myClothingUI:getClothingItemCategory(itemBodyLocation);

        -- choose where to draw based on category.
        if itemCategory ~= nil then
            print("drawing " .. item:getDisplayName() .. " on slot " .. itemCategory);
        else -- else category unknown
            print("category unknown, item: " .. item:getDisplayName())
            addClothingCategory("ACC", itemBodyLocation, clothingCategories);-- force add the category to ACC
            itemCategory = myClothingUI:getClothingItemCategory(itemBodyLocation); -- get the category again
        end

        local category = clothingCategories[itemCategory];
        local categoryRow = category["displayRow"];
        instance.displayedSlots[k] = myClothingSlot:new(((config.slot_button_horizontal_spacing +
                                                            config.slot_button_size) * categoryIdx[itemCategory]) +
                                                            config.slot_button_size + buttonHorizontalOffset,
            (categoryRow * (config.slot_button_vertical_spacing + config.slot_button_size)) + config.slot_button_size /
                2 + config.slot_button_vertical_spacing + buttonVerticalOffset, config.slot_button_size,
            config.slot_button_size, itemBodyLocation, item);
        instance.displayedSlots[k].item = item;
        instance:addChild(instance.displayedSlots[k]);
        categoryIdx[itemCategory] = categoryIdx[itemCategory] + 1;

    end

end

-- removes all instance.displayedSlots children
function myClothingUI:removeItemButtons()

    if not instance.displayedSlots then
        return;
    end

    for k, v in pairs(instance.displayedSlots) do
        instance:removeChild(instance.displayedSlots[k]);
    end

end


function myClothingUI:handleToggle()

    print(self:getIsVisible());
    if self:getIsVisible() then
        self:setVisible(false);
    else
        self:renderCategoryButtons();
        self:setVisible(true);
    end

end

function myClothingUI:renderCategoryButtons()

    -- on toggle remove all old category buttons
    for key, button in pairs(self.categoryButtons) do
        self:removeChild(button);
    end
    self.categoryButtons = {};

    -- display categories buttons
    for k, v in pairs(clothingCategories) do
        print("CUI - Creating category button " .. k .. " on row " .. v["displayRow"]);
        local catButton = myCategoryButton:new(10,
            (v["displayRow"] * (config.slot_button_vertical_spacing + config.slot_button_size)) +
                config.slot_button_size / 2 + config.slot_button_vertical_spacing + buttonVerticalOffset, 2 * config.slot_button_size,
            config.slot_button_size, k, v);
        self.categoryButtons[k] = catButton;
        self:addChild(catButton);
    end

end



function myClothingUI.onMainButtonClicked()

    if instance == nil then
        print("window not initialized - create new window")
        instance = myClothingUI:new(loadedParams["instance"].x, loadedParams["instance"].y, 8 * config.slot_button_size,
            9 * (config.slot_button_vertical_spacing + config.slot_button_size));
        instance:addToUIManager();
        instance.itemCount = 0;
        instance:setTitle(getText("UI_CUI_window_title"));
    else
        print("window exists - handle toggling")
        instance:handleToggle();
        instance.itemCount = 0; -- setting to zero forces update if player wears any clothing
    end

end

function myClothingUI:onGameStart()

    -- load saved parameters
    local loadedParams = myClothingUI:loadSavedParameters();
    loadedParams = myClothingUI:checkParameters(loadedParams);

    -- trigger the default configs
    config.triggerConfigLoad();

    -- place toggle button on the main screen
    toggleButton = ISPanel:new(loadedParams["toggleButton"].x, loadedParams["toggleButton"].y, 50, 50);
    toggleButton.moveWithMouse = true;
    toggleButton.mybutton = ISButton:new(10, 10, 30, 30, "INV", toggleButton.mybutton, myClothingUI.onMainButtonClicked);
    toggleButton:addChild(toggleButton.mybutton);
    toggleButton:addToUIManager();

    print("CUI - Create new window on game start")
    instance = myClothingUI:new(loadedParams["instance"].x, loadedParams["instance"].y, 8 * config.slot_button_size,
        9 * (config.slot_button_vertical_spacing + config.slot_button_size));
    instance:addToUIManager();
    instance.itemCount = 0;
    instance:setTitle(getText("UI_CUI_window_title"));
    instance:setVisible(false);
end


-- make sure parameter object is always valid
function myClothingUI:checkParameters(paramIn)

    local xres = getCore():getScreenWidth()
	local yres = getCore():getScreenHeight()

    -- check if we are not rendering outside of game window
    if paramIn["toggleButton"].x > xres then
        paramIn["toggleButton"].x = xres*0.5;
    end
    if paramIn["instance"].x > xres then
        paramIn["instance"].x = xres*0.5;
    end

    if paramIn["toggleButton"].y > yres then
        paramIn["toggleButton"].y = yres*0.5;
    end
    if paramIn["instance"].y > yres then
        paramIn["instance"].y = yres*0.5;
    end

    return paramIn;


end

function myClothingUI:loadSavedParameters()

    local reader = getFileReader("clothingui.ini", false);
    local parameters = {};

    local loadDefaults = false;

    -- file found parse the json
    if reader then
        print("CUI - reading parameters from config file");
        local line = reader:readLine();
        reader:close();

        -- we need a protection against empty file or other malformed files
        if not line or line == nil or line == "" then
            print("CUI - invalid parameters files");
            loadDefaults = true;
        else
            parameters = json.parse(line);
            -- parsed OK but key doesnt exists
            if not parameters["toggleButton"] or not parameters["instance"] then
                loadDefaults = true;
            -- both keys exists but one member is missing
            elseif  not (parameters["toggleButton"].x and parameters["toggleButton"].y and parameters["instance"].x and parameters["instance"].y)    then
                loadDefaults = true;
            end;
        end

    else
        -- no file found, load default parameters
        loadDefaults = true;
        print("CUI - No parameters file found");
    end

    if loadDefaults == true then
        print("CUI - Loading default parameters");
        parameters["toggleButton"] = {
            x = 500,
            y = 500
        };
        parameters["instance"] = {
            x = 300,
            y = 300
        };
    end

    return parameters

end


-- returns table with parameters
-- returns "none" if no value found.
function myClothingUI:createSavedParameters()
    print("CUI - Saving button locations");
    local parameters = {};

    if toggleButton then
        parameters["toggleButton"] = {x = toggleButton.x, y = toggleButton.y};
    else
        parameters["toggleButton"] = {
            x = 500,
            y = 500
        };
    end

    if instance then
        parameters["instance"] = {x = instance.x, y = instance.y};
    else
        parameters["instance"] = {
            x = 300,
            y = 300
        };
    end
    
    return parameters

end

function myClothingUI:onSave()

    -- Check if the game window instance is created, if not it means that 
    -- save was not triggered from the loaded game (new game route).
    if instance then
        -- get file
        print("CUI - Writing button location parameters to file");
        local writer = getFileWriter("clothingui.ini", true, false)

        -- write button locations parameters
        local savedParameters = myClothingUI:createSavedParameters();
        writer:write(json.stringify(savedParameters));
        writer:close();
    end

end


Events.OnSave.Add(myClothingUI.onSave);
Events.OnGameStart.Add(myClothingUI.onGameStart);
