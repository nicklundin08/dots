-- ===========================================================
-- Example .nvim.lua
-- Purpose is to show how project specific keybinds can be set up
-- ===========================================================


-- Now you can require files from that folder directly
package.path = package.path .. ";./.nvim/?.lua"

require("hm")
require("plugin")
