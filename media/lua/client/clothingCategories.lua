local clothingCategories = {};

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
        BodyLocation = FannyPackFront,		
        BodyLocation = FannyPackBack,		
        BodyLocation = Hat,		
        BodyLocation = Mask,		
        BodyLocation = FullHat,		
        BodyLocation = MaskEyes,		
        BodyLocation = MaskFull,		
        BodyLocation = FullHelmet,		
        BodyLocation = Jacket,		
        BodyLocation = FullTop,		
        BodyLocation = JacketHat,		
        BodyLocation = Sweater,		
        BodyLocation = TorsoExtra,		
        BodyLocation = SweaterHat,		
        BodyLocation = Necklace,		
        BodyLocation = Necklace_Long,		
        BodyLocation = Neck,		
        BodyLocation = Nose,		
        BodyLocation = Ears,		
        BodyLocation = EarTop,		
        BodyLocation = Right_MiddleFinger,		
        BodyLocation = Left_MiddleFinger,		
        BodyLocation = Right_RingFinger,		
        BodyLocation = Left_RingFinger,		
        BodyLocation = RightWrist,		
        BodyLocation = LeftWrist,		
        BodyLocation = BellyButton,		
        BodyLocation = Eyes,		
        BodyLocation = LeftEye,		
        BodyLocation = RightEye,		
        BodyLocation = Hands,		
        BodyLocation = Scarf,		
        BodyLocation = Underwear,		
        BodyLocation = MakeUp_FullFace,		
        BodyLocation = MakeUp_Eyes,		
        BodyLocation = MakeUp_EyesShadow,		
        BodyLocation = MakeUp_Lips,		
        BodyLocation = Belt,		
        BodyLocation = BeltExtra,		
        BodyLocation = AmmoStrap,		
        BodyLocation = Tail,		
        BodyLocation = Legs1,		
        BodyLocation = Pants,		
        BodyLocation = Skirt,		
        BodyLocation = ShortSleeveShirt,		
        BodyLocation = Shirt,		
        BodyLocation = Tshirt,		
        BodyLocation = TankTop,		
        BodyLocation = Socks,		
        BodyLocation = UnderwearInner,		
        BodyLocation = Shoes,		
        BodyLocation = Torso1Legs1,		
        BodyLocation = BathRobe,		
        BodyLocation = FullSuit,		
        BodyLocation = FullSuitHead,		
        BodyLocation = Dress,		
        BodyLocation = UnderwearTop,		
        BodyLocation = UnderwearBottom,		
        BodyLocation = UnderwearExtra1,		
        BodyLocation = UnderwearExtra2,		
        BodyLocation = ZedDmg,		
        BodyLocation = Bandage,		
        BodyLocation = Wound,		

]] --

-- head items
clothingCategories["HEAD"]["FullHelmet"] = true;
clothingCategories["HEAD"]["MaskFull"] = true;
clothingCategories["HEAD"]["FullHat"] = true;
clothingCategories["HEAD"]["MaskEyes"] = true;
clothingCategories["HEAD"]["Hat"] = true;
clothingCategories["HEAD"]["Mask"] = true;
clothingCategories["HEAD"]["Eyes"] = true;
clothingCategories["HEAD"]["LeftEye"] = true;
clothingCategories["HEAD"]["RightEye"] = true;

-- torso category
clothingCategories["BODY"]["TankTop"] = true;
clothingCategories["BODY"]["Tshirt"] = true;
clothingCategories["BODY"]["ShortSleeveShirt"] = true;
clothingCategories["BODY"]["Shirt"] = true;
clothingCategories["BODY"]["Jacket"] = true;
clothingCategories["BODY"]["JacketHat"] = true;
clothingCategories["BODY"]["Sweater"] = true;
clothingCategories["BODY"]["SweaterHat"] = true;
clothingCategories["BODY"]["Dress"] = true;
clothingCategories["BODY"]["FullTop"] = true;
clothingCategories["BODY"]["TorsoExtra"] = true;
clothingCategories["BODY"]["Torso1Legs1"] = true;
clothingCategories["BODY"]["BathRobe"] = true;
clothingCategories["BODY"]["FullSuit"] = true;
clothingCategories["BODY"]["FullSuitHead"] = true;
clothingCategories["BODY"]["Scarf"] = true;

-- underwear
clothingCategories["UNDIES"]["UnderwearInner"] = true;
clothingCategories["UNDIES"]["Underwear"] = true;
clothingCategories["UNDIES"]["UnderwearBottom"] = true;
clothingCategories["UNDIES"]["UnderwearTop"] = true;
clothingCategories["UNDIES"]["UnderwearExtra1"] = true;
clothingCategories["UNDIES"]["UnderwearExtra2"] = true;

-- hands category
clothingCategories["HANDS"]["Hands"] = true;
clothingCategories["HANDS"]["RightWrist"] = true;
clothingCategories["HANDS"]["LeftWrist"] = true;

-- legs category
clothingCategories["LEGS"]["Legs1"] = true;
clothingCategories["LEGS"]["Pants"] = true;
clothingCategories["LEGS"]["Skirt"] = true;

-- feet category
clothingCategories["FEET"]["Socks"] = true;
clothingCategories["FEET"]["Shoes"] = true;

-- accessories
clothingCategories["ACC"]["Belt"] = true;
clothingCategories["ACC"]["BeltExtra"] = true;
clothingCategories["ACC"]["AmmoStrap"] = true;
clothingCategories["ACC"]["FannyPackFront"] = true;
clothingCategories["ACC"]["FannyPackBack"] = true;
clothingCategories["ACC"]["Tail"] = true;

-- jewels
clothingCategories["TRINKET"]["Necklace"] = true;
clothingCategories["TRINKET"]["Necklace_Long"] = true;
clothingCategories["TRINKET"]["Neck"] = true;
clothingCategories["TRINKET"]["Ears"] = true;
clothingCategories["TRINKET"]["Nose"] = true;
clothingCategories["TRINKET"]["EarTop"] = true;
clothingCategories["TRINKET"]["Right_MiddleFinger"] = true;
clothingCategories["TRINKET"]["Left_MiddleFinger"] = true;
clothingCategories["TRINKET"]["Right_RingFinger"] = true;
clothingCategories["TRINKET"]["Left_RingFinger"] = true;
clothingCategories["TRINKET"]["BellyButton"] = true;


-- MODDED ITEMS - SCAP ARMOR COMPATIBILITY
--[[
        https://steamcommunity.com/sharedfiles/filedetails/?id=2658619264&searchtext=Scrap+Armor

        SpecialBelt
        SwordSheath
        TorsoRig
        TorsoRig2
        waistbags
        UpperArmLeft
        UpperArmRight
        ThighLeft
        ThighRight
        LowerBody
        Pauldrons
        HandPlateLeft
        HandPlateRight
        ShinPlateLeft
        ShinPlateRight
        SpecialMask
]] -- 

clothingCategories["HEAD"]["SpecialMask"] = true;

clothingCategories["ACC"]["SpecialBelt"] = true;
clothingCategories["ACC"]["SwordSheath"] = true;
clothingCategories["ACC"]["waistbags"] = true;

clothingCategories["BODY"]["TorsoRig"] = true;
clothingCategories["BODY"]["TorsoRig2"] = true;
clothingCategories["BODY"]["LowerBody"] = true;
clothingCategories["BODY"]["Pauldrons"] = true;

clothingCategories["HANDS"]["HandPlateLeft"] = true;
clothingCategories["HANDS"]["HandPlateRight"] = true;
clothingCategories["HANDS"]["UpperArmLeft"] = true;
clothingCategories["HANDS"]["UpperArmRight"] = true;

clothingCategories["LEGS"]["ShinPlateLeft"] = true;
clothingCategories["LEGS"]["ShinPlateRight"] = true;
clothingCategories["LEGS"]["ThighLeft"] = true;
clothingCategories["LEGS"]["ThighRight"] = true;


return clothingCategories;
