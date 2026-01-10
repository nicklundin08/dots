vim.keymap.set('n', '<leader>zp', function()
  local repo_link = vim.fn.input("Enter the repo link:");
  -- e.g. https://github.com/folke/which-key.nvim
  local github_info = parse_github_url(repo_link)
  local load_strategy = vim.fn.input("Enter the load strategy (start/opt):");
  local submodule_path = string.format(
	  "%s/home-manager/modules/nicksvim/lua/pack/%s/%s/%s",
	  vim.fs.root(0, '.git'),
	  github_info.owner,
	  load_strategy,
	  github_info.repo);

  -- vim.fn.system(
  --  'git',
  --  'submodule',
  --  'add',
  --  repo_link,
  --  submodule_path
  --
  -- )
  vim.fn.system(string.format("git submodule add %s %s", repo_link, submodule_path))
end, { desc = 'Interactive add a neovim [p]lugin' })

function parse_github_url(url)
    local result = {
        host = nil,
        owner = nil,
        repo = nil,
        type = nil,   -- "repo", "blob", "tree", "raw"
        ref = nil,    -- branch / tag / commit
        path = nil    -- file or directory path
    }

    -- Normalize
    url = url:gsub("%.git$", "")

    -- raw.githubusercontent.com URLs
    local owner, repo, ref, path =
        url:match("^https?://raw%.githubusercontent%.com/([^/]+)/([^/]+)/([^/]+)/(.*)$")

    if owner then
        result.host = "raw.githubusercontent.com"
        result.owner = owner
        result.repo = repo
        result.type = "raw"
        result.ref = ref
        result.path = path
        return result
    end

    -- github.com URLs
    local host, rest = url:match("^(https?://github%.com)/(.*)$")
    if not host then
        return nil, "Not a GitHub URL"
    end

    result.host = "github.com"

    local parts = {}
    for part in rest:gmatch("[^/]+") do
        table.insert(parts, part)
    end

    result.owner = parts[1]
    result.repo = parts[2]

    if not result.owner or not result.repo then
        return nil, "Invalid GitHub repository URL"
    end

    -- Just the repo
    if #parts == 2 then
        result.type = "repo"
        return result
    end

    -- blob / tree URLs
    result.type = parts[3]
    result.ref = parts[4]

    if #parts > 4 then
        result.path = table.concat(parts, "/", 5)
    end

    return result
end
