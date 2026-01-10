local plugins = {
	"oil",
	"btw"
}


for _, plugin in ipairs(plugins) do
  require("plugins." .. plugin)
end
