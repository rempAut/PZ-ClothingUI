--[[ options.lua

This is code from the options mod. 
https://steamcommunity.com/sharedfiles/filedetails/?id=2169435993&searchtext=options

The mode doesn't work in the MP. So we need to load the mods data regardles. 

--]]


local function loadIniData() --print('loadIniData!')
	print('ModOptions: Loading ini data...')
	local ini_data = {Base={}}
	local reader = getFileReader("mods_options.ini", false)
	if not reader then
		return
	end
	local current_mod = "Base"
	while true do
		local line = reader:readLine()
		if not line then
			reader:close()
			break
		end
		line = line:trim()
		if line ~= "" then
			local k,v = line:match("^([^=%[]+)=([^=]+)$")
			if k then
				k = k:trim()
				ini_data[current_mod][k] = v:trim()
				--print(k,'=',v)
			else
				local mod = line:match("^%[([^%[%]%%]+)%]$")
				if mod then
					current_mod = mod:trim()
					--print('modname = ',current_mod)
					if not ini_data[current_mod] then
						ini_data[current_mod] = {}
					end
				end
			end
		end
	end

    return ini_data;
end

return loadIniData;