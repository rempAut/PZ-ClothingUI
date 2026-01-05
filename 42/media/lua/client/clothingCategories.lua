local clothingCategories = {};
--media\lua\shared\NPCs\BodyLocations.lua
local IBL = ItemBodyLocation

-- Clothing categories and their order
clothingCategories["HEAD"] = {};
clothingCategories["BODY"] = {};
clothingCategories["UNDIES"] = {};
clothingCategories["HANDS"] = {};
clothingCategories["LEGS"] = {};
clothingCategories["FEET"] = {};
clothingCategories["ACC"] = {};
clothingCategories["TRINKET"] = {};

clothingCategories["HEAD"]["displayRow"] = 0;
clothingCategories["BODY"]["displayRow"] = 1;
clothingCategories["UNDIES"]["displayRow"] = 2;
clothingCategories["HANDS"]["displayRow"] = 3;
clothingCategories["LEGS"]["displayRow"] = 4;
clothingCategories["FEET"]["displayRow"] = 5;
clothingCategories["ACC"]["displayRow"] = 6;
clothingCategories["TRINKET"]["displayRow"] = 7;

--[[ LIST OF ALL VANILLA BODYLOCATIONS FROM THE GAME FILES
 See media/lua/shared/BodyLocations.lua in the base game for reference
]] --

-- head items
clothingCategories["HEAD"][IBL.FULL_SUIT_HEAD] = true -- FullHelmet
clothingCategories["HEAD"][IBL.MASK_FULL] = true
clothingCategories["HEAD"][IBL.FULL_HAT] = true
clothingCategories["HEAD"][IBL.MASK_EYES] = true
clothingCategories["HEAD"][IBL.HAT] = true
clothingCategories["HEAD"][IBL.MASK] = true
clothingCategories["HEAD"][IBL.EYES] = true
clothingCategories["HEAD"][IBL.LEFT_EYE] = true
clothingCategories["HEAD"][IBL.RIGHT_EYE] = true

-- torso category
clothingCategories["BODY"][IBL.TANK_TOP] = true
clothingCategories["BODY"][IBL.TSHIRT] = true
clothingCategories["BODY"][IBL.SHORT_SLEEVE_SHIRT] = true
clothingCategories["BODY"][IBL.SHIRT] = true
clothingCategories["BODY"][IBL.JACKET] = true
clothingCategories["BODY"][IBL.JACKET_HAT] = true
clothingCategories["BODY"][IBL.SWEATER] = true
clothingCategories["BODY"][IBL.SWEATER_HAT] = true
clothingCategories["BODY"][IBL.DRESS] = true
clothingCategories["BODY"][IBL.FULL_TOP] = true
clothingCategories["BODY"][IBL.TORSO_EXTRA] = true
clothingCategories["BODY"][IBL.TORSO1LEGS1] = true
clothingCategories["BODY"][IBL.BATH_ROBE] = true
clothingCategories["BODY"][IBL.FULL_SUIT] = true
clothingCategories["BODY"][IBL.FULL_SUIT_HEAD] = true
clothingCategories["BODY"][IBL.SCARF] = true

-- underwear
clothingCategories["UNDIES"][IBL.TORSO1] = true -- UnderwearInner
clothingCategories["UNDIES"][IBL.UNDERWEAR] = true
clothingCategories["UNDIES"][IBL.UNDERWEAR_BOTTOM] = true
clothingCategories["UNDIES"][IBL.UNDERWEAR_TOP] = true
clothingCategories["UNDIES"][IBL.UNDERWEAR_EXTRA1] = true
clothingCategories["UNDIES"][IBL.UNDERWEAR_EXTRA2] = true

-- hands category
clothingCategories["HANDS"][IBL.HANDS] = true
clothingCategories["HANDS"][IBL.RIGHT_WRIST] = true
clothingCategories["HANDS"][IBL.LEFT_WRIST] = true

-- legs category
clothingCategories["LEGS"][IBL.LEGS1] = true
clothingCategories["LEGS"][IBL.PANTS] = true
clothingCategories["LEGS"][IBL.SKIRT] = true

-- feet category
clothingCategories["FEET"][IBL.SOCKS] = true
clothingCategories["FEET"][IBL.SHOES] = true

-- accessories
clothingCategories["ACC"][IBL.BELT] = true
clothingCategories["ACC"][IBL.BELT_EXTRA] = true
clothingCategories["ACC"][IBL.AMMO_STRAP] = true
clothingCategories["ACC"][IBL.FANNY_PACK_FRONT] = true
clothingCategories["ACC"][IBL.FANNY_PACK_BACK] = true
clothingCategories["ACC"][IBL.TAIL] = true

-- jewels
clothingCategories["TRINKET"][IBL.NECKLACE] = true
clothingCategories["TRINKET"][IBL.NECKLACE_LONG] = true
clothingCategories["TRINKET"][IBL.NECK] = true
clothingCategories["TRINKET"][IBL.EARS] = true
clothingCategories["TRINKET"][IBL.NOSE] = true
clothingCategories["TRINKET"][IBL.EAR_TOP] = true
clothingCategories["TRINKET"][IBL.RIGHT_MIDDLE_FINGER] = true
clothingCategories["TRINKET"][IBL.LEFT_MIDDLE_FINGER] = true
clothingCategories["TRINKET"][IBL.RIGHT_RING_FINGER] = true
clothingCategories["TRINKET"][IBL.LEFT_RING_FINGER] = true
clothingCategories["TRINKET"][IBL.BELLY_BUTTON] = true


-- MODDED ITEMS - SCAP ARMOR COMPATIBILITY

return clothingCategories;
