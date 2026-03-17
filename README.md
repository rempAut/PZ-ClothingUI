# PZ-ClothingUI

This mod was created to provide a better overview of equipped items. Often, it was not very clear to me which clothing goes to which slot.

**Download from Steam workshop** https://steamcommunity.com/sharedfiles/filedetails/?id=2695471997

If you have any issue or idea, feel free to create a ticket under [issues](https://github.com/rempAut/PZ-ClothingUI/issues)

## Options / configuration
To be able to configure the mod, you need to install [Mod Options mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2169435993).

1. Start the game and enable the Options mod (Don't forget to enable it also on your save file)
2. Load into Single Player Game
3. Open game settings, click on tab Mods (Doesn't show in the Multiplayer games!)
4. Configure the mod to you liking (To be able to see the changes, you need to open/close the Clothing UI window)
![example](https://user-images.githubusercontent.com/8086995/147850514-0adce024-68fb-448a-ad9a-cb8f86611c45.png)


**Multiplayer support**
- The Mod Options doesn't work / is displayed in multiplayer, however the values are loaded in MP games. 
- Configure your window in the single player / main menu before loading to multiplayer games.
- Server doesn't need to have Mod Options installed.

The values are saved in file `C:\Users\<user>\Zomboid\Lua\mods_options.ini` to reset / remove the config either edit this file and remove the lines bellow `[myclothinguimod]` or if you don't use mod options for anything else - delete the whole file. 

## Multiplayer support
To be able to use this mod in multiplayer(coop) you need to enable this mod in your server settings.
This mod doesn't require any special settings and is setup as any other mod on multiplayer. **You can follow any guide explaining PZ mods in multiplayer.**

#### Option 1 - using the game interface
1. Start your game
2. Click on HOST
3. Select your server and click on Manage settings 
4. Click on Edit Selected Settings (Or create a new one)
5. Click on Mods, select the mod. You should see it under Mods userd by this server.
6. Click on SAVE. 

![image](https://user-images.githubusercontent.com/8086995/147775030-ca46728e-f6f0-44f5-a50b-21057bd207cf.png)

#### Option 2 - edit the config file
1. Find your server configuration files, for example `servertest.ini`. If you are on windows `C:\Users\<user>\Zomboid\Server`.
2. Follow [this tutorial](https://pingperfect.com/index.php/knowledgebase/276/Project-Zomboid--How-to-Add-Mods.html)


## How to add translation

### For Build 42 (Current)
1. Go into the folder `42/media/lua/shared/Translate` [here](https://github.com/rempAut/PZ-ClothingUI/tree/master/42/media/lua/shared/Translate)
2. Copy the folder `EN`
3. Rename the folder to the code of your language, you can find them [here](https://github.com/TheIndieStone/ProjectZomboidTranslations)
4. Edit the files `UI.json` and `IGUI.json`:
   - Translate the **values** (keep the keys unchanged)
   - Example: `"UI_CUI_window_title": "Equipped items"` → `"UI_CUI_window_title": "Your Translation"`
5. Save the files with **UTF-8 encoding** (this is important!)

### For Build 41 (Legacy)
1. Go into the folder `media/lua/shared/Translate` [here](https://github.com/rempAut/PZ-ClothingUI/tree/master/media/lua/shared/Translate)
2. Copy the folder `EN`
3. Rename the folder to the code of your language
4. Change the name of the files `UI_EN.txt` and `IG_UI_EN.txt` to `UI_YOURCODE.txt` and `IG_UI_YOURCODE.txt`
5. Change the first line of the file from `UI_EN = {` to `UI_YOURCODE = {`
6. Translate the texts in the file
7. Save with appropriate encoding (see [PZ encoding list](https://github.com/TheIndieStone/ProjectZomboidTranslations/blob/master/.gitattributes))

### Submitting Your Translation
In case you don't know how to work with GIT, please create a new [ISSUE](https://github.com/rempAut/PZ-ClothingUI/issues) / [thread on steam](https://steamcommunity.com/sharedfiles/filedetails/discussions/2695471997) with your translated files and we can add them to the project.

## How to report issues
1. Start the game with -debug parameter
2. When ingame, press F11 to open debug console.
3. Make sure "General" is included in the log file
![image](https://user-images.githubusercontent.com/80215310/147794177-a65f8d26-a3c9-412d-b7c6-3602b15e7745.png)
4. Close the debug console and replicate your errors.
5. Close the game
6. Find the log in C:\Users\[username]\Zomboid\console.txt and upload it together with your issue
7. List the name of your additional mods or any other technical information which can help debug and reproduce the issue, if possible try to disable your other mods to pin point the problem. 

For reporting the problems use GitHub issues or [discussion](https://steamcommunity.com/sharedfiles/filedetails/discussions/2695471997) on Steam. Do NOT use comments on the mod page. Any comments saying just "doesn't work" will be ignored. We don't have crystal ball to see your spefic setup...

## Manual Inslation
- Select the release https://github.com/rempAut/PZ-ClothingUI/releases
- Download the zip, extract it, put it into `C:\Users\<username>\Zomboid\mods`
