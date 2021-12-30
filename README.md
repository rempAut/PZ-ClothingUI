# PZ-ClothingUI

This mod was created to provide a better overview of equipped items. Often, it was not very clear to me which clothing goes to which slot.

**Download from Steam workshop** https://steamcommunity.com/sharedfiles/filedetails/?id=2695471997


### Bugs, Issues or other ideas
If you have any issue or idea, feel free to create a ticket under [issues](https://github.com/rempAut/PZ-ClothingUI/issues)


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
1. Go into a folder `media/lua/shared/Translate`
1. Copy the folder `EN` 
2. Rename the folder to the code of your language, you can find them [here](https://github.com/TheIndieStone/ProjectZomboidTranslations)
3. Change the name of the file from `UI_EN` to `UI_YOURCODE`
4. Change the first line of the file from `UI_EN` to `UI_YOURCODE`
5. Translate the texts in the file. 

In case you don't know how to work with GIT, please create a new [ISSUE](https://github.com/rempAut/PZ-ClothingUI/issues) / [thread on steam](https://steamcommunity.com/sharedfiles/filedetails/discussions/2695471997) with translated file and we can add that file to the project.
