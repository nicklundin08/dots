-- Gets the current path of the lua script
function get_script_dir()
    -- Get the source string (starts with '@' for filenames)
    local source = debug.getinfo(1, 'S').source

    -- Remove the leading '@'
    local path = source:sub(2)

    -- Determine the platform-specific path separator
    local separator = package.config:sub(1, 1)

    -- Use string pattern matching to extract the directory part
    -- The pattern matches everything up to the last separator
    local directory = path:match("(.+" .. separator .. ")")

    -- Return the directory, or a default value (e.g., '.') if no directory part is found
    return directory or '.'
end


-- Warning! Only works on unix-like filesystems
-- Loads all plugins folders in the directory
-- The convention is that each plugin should be a flat folder structure with an init.lua
-- File at the root level
function load_plugins_by_convention(root_plugin_dir)
	-- print("Plugin dir: " .. root_plugin_dir)
	local pluginDirectories = io.popen("ls -pa " .. root_plugin_dir .. " | grep /")

	if pluginDirectories then
	    for plugin in pluginDirectories:lines() do
		if plugin ~= "./" and plugin ~= "../" then
		    -- print("Plugin: " ..plugin)
		    require("plugins." .. plugin)
		end
	    end
	    pluginDirectories:close()
	end

end

load_plugins_by_convention(get_script_dir())
