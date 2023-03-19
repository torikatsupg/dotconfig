-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/torikatsu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/torikatsu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/torikatsu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/torikatsu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/torikatsu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\n:\0\0\4\0\3\1\a4\0\3\0006\1\0\0009\1\1\1'\3\2\0B\1\2\0?\1\0\0L\0\2\0\r%Y-%m-%d\tdate\aos\3ÄÄ¿ô\4∑\2\1\0\22\0\14\1\0286\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0003\b\t\0009\t\n\0+\v\0\0005\f\f\0004\r\3\0\18\14\1\0005\16\v\0004\17\3\0\18\18\5\0\18\20\b\0004\21\0\0B\18\3\0?\18\0\0B\14\3\0?\14\0\0=\r\r\fB\t\3\1K\0\1\0\ball\1\0\0\1\0\3\tdscr#Date in the form of YYYY-MM-DD\ttrig\17datedatedate\tnamr\tDate\17add_snippets\0\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\3ÄÄ¿ô\4\0" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after = { "nvim-cmp" },
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    config = { "\27LJ\2\n£\1\0\0\a\0\n\0\0166\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0005\6\a\0=\6\b\5B\2\3\0019\2\t\0\18\4\1\0B\2\2\1K\0\1\0\nsetup\voption\1\0\1\19keyword_length\3\n\1\0\1\tname\vbuffer\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer",
    wants = { "nvim-cmp" }
  },
  ["cmp-dictionary"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-dictionary/after/plugin/cmp_dictionary.vim" },
    config = { "\27LJ\2\n´\2\0\0\6\0\n\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0B\2\3\0019\2\a\0\18\4\1\0B\2\2\0016\2\0\0'\4\b\0B\2\2\0029\3\a\0025\5\t\0B\3\2\1K\0\1\0\1\0\b\nexact\3\2\rdocument\2\nasync\2\rcapacity\3\5\14max_items\3\n\ndebug\2\21document_command\16wn %s -over\27first_case_insensitive\1\19cmp_dictionary\nsetup\1\0\2\tname\15dictionary\19keyword_length\3\4\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary",
    wants = { "nvim-cmp" }
  },
  ["cmp-emoji"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    config = { "\27LJ\2\n\127\0\0\6\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0B\2\3\0019\2\a\0\18\4\1\0B\2\2\1K\0\1\0\nsetup\1\0\1\tname\nemoji\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji",
    wants = { "nvim-cmp" }
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\4¿\tbody\15lsp_expand^\0\1\5\2\4\0\n-\1\0\0009\1\0\1B\1\1\2-\2\1\0008\2\0\0029\2\1\0025\4\2\0=\1\3\4B\2\2\1K\0\1\0\1¿\2¿\17capabilities\1\0\0\nsetup\25default_capabilities¨\2\1\0\n\0\18\0$6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0026\4\0\0'\6\5\0B\4\2\0029\5\6\0B\5\1\0025\6\t\0003\a\b\0=\a\n\6=\6\a\0059\6\v\0034\b\3\0003\t\f\0>\t\1\bB\6\2\0016\6\r\0009\6\14\0069\b\15\0055\t\16\0B\6\3\0019\6\17\0\18\b\5\0B\6\2\0012\0\0ÄK\0\1\0\nsetup\1\0\1\tname\rnvim_lsp\fsources\vinsert\ntable\0\19setup_handlers\vexpand\1\0\0\0\fsnippet\15get_config\fluasnip\20mason-lspconfig\14lspconfig\17cmp_nvim_lsp\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp",
    wants = { "nvim-cmp", "nvim-lspconfig", "mason-lspconfig.nvim", "cmp_luasnip" }
  },
  ["cmp-path"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    config = { "\27LJ\2\n~\0\0\6\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0B\2\3\0019\2\a\0\18\4\1\0B\2\2\1K\0\1\0\nsetup\1\0\1\tname\tpath\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path",
    wants = { "nvim-cmp" }
  },
  cmp_luasnip = {
    after = { "LuaSnip" },
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1¿\tbody\15lsp_expand”\1\1\0\t\0\14\0\0276\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0B\2\1\0026\3\4\0009\3\5\3\18\5\2\0005\6\t\0005\a\a\0003\b\6\0=\b\b\a=\a\n\6B\3\3\0016\3\4\0009\3\5\0039\5\v\0025\6\f\0B\3\3\0019\3\r\0\18\5\2\0B\3\2\0012\0\0ÄK\0\1\0\nsetup\1\0\1\tname\fluasnip\fsources\fsnippet\1\0\0\vexpand\1\0\0\0\vinsert\ntable\15get_config\fluasnip\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip",
    wants = { "nvim-cmp", "LuaSnip" }
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim",
    wants = { "nvim-treesitter" }
  },
  ["lspsaga.nvim"] = {
    after = { "nvim-web-devicons" },
    config = { "\27LJ\2\n~\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\aui\1\0\1\vborder\frounded\22symbols_in_winbar\1\0\0\1\0\1\venable\1\nsetup\flspsaga\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    config = { "\27LJ\2\nÃ\2\0\1\t\0\23\0 4\1\0\0\a\0\0\0X\2\21Ä5\2\18\0005\3\3\0005\4\2\0=\4\4\0035\4\6\0005\5\5\0=\5\a\4=\4\b\0035\4\r\0006\5\t\0009\5\n\0059\5\v\5'\a\f\0+\b\2\0B\5\3\2=\5\14\4=\4\15\0035\4\16\0=\4\17\3=\3\19\2=\2\1\0016\2\20\0'\4\21\0B\2\2\0028\2\0\0029\2\22\2\18\4\1\0B\2\2\1K\0\1\0\nsetup\14lspconfig\frequire\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\rsettings\vlua_ls≤\1\1\0\5\0\b\0\0146\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\0019\1\6\0004\3\3\0003\4\a\0>\4\1\3B\1\2\1K\0\1\0\0\19setup_handlers\21ensure_installed\1\0\1\27automatic_installation\2\1\3\0\0\vlua_ls\18rust_analyzer\nsetup\20mason-lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim",
    wants = { "mason.nvim", "nvim-lspconfig" }
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\nâ\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\foptions\1\0\0\1\0\1\16transparent\2\nsetup\rnightfox\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim",
    wants = { "nvim-treesitter" }
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs",
    wants = { "nvim-treesitter" }
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\ná\3\0\0\b\0\24\00026\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0025\2\6\0009\3\4\0009\3\3\0039\3\5\3B\3\1\2=\3\a\0029\3\4\0009\3\3\0039\3\5\3B\3\1\2=\3\b\2=\2\3\0019\2\t\0009\2\n\0029\2\v\0025\4\r\0009\5\t\0009\5\f\5)\a¸ˇB\5\2\2=\5\14\0049\5\t\0009\5\f\5)\a\4\0B\5\2\2=\5\15\0049\5\t\0009\5\16\5B\5\1\2=\5\17\0049\5\t\0009\5\18\5B\5\1\2=\5\19\0049\5\t\0009\5\20\0055\a\21\0B\5\2\2=\5\22\4B\2\2\2=\2\t\0019\2\23\0\18\4\1\0B\2\2\1K\0\1\0\nsetup\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\18documentation\15completion\1\0\0\rbordered\vconfig\vwindow\15get_config\bcmp\frequire\0" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n;\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\ndebug\18set_log_level\blsp\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nD\0\0\4\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0=\0\1\1K\0\1\0\bvim\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nI\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag",
    wants = { "nvim-treesitter" }
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\2\nq\0\0\3\0\6\0\b6\0\0\0'\2\1\0B\0\2\0025\1\4\0005\2\3\0=\2\5\1=\1\2\0K\0\1\0\26context_commentstring\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
    wants = { "nvim-treesitter" }
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/mrjones2014/nvim-ts-rainbow",
    wants = { "nvim-treesitter" }
  },
  ["nvim-web-devicons"] = {
    load_after = {
      ["lspsaga.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  nvim_context_vt = {
    config = { "\27LJ\2\nä\1\0\3\b\0\6\0\0176\3\0\0'\5\1\0B\3\2\2\18\6\0\0009\4\2\0B\4\2\2\a\4\3\0X\4\2Ä+\4\0\0L\4\2\0'\4\4\0009\5\5\3\18\a\0\0B\5\2\2:\5\1\5&\4\5\4L\4\2\0\18get_node_text\t--> \rfunction\ttype\26nvim_context_vt.utils\frequireÆ\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\18custom_parser\0\29disable_virtual_lines_ft\1\2\0\0\tyaml\15disable_ft\1\2\0\0\rmarkdown\1\0\1\fenabled\2\nsetup\20nvim_context_vt\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt",
    wants = { "nvim-treesitter" }
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["sqlite.lua"] = {
    load_after = {
      ["telescope-frecency.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    after = { "sqlite.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim",
    wants = { "sqlite.lua" }
  },
  ["telescope-ghq.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/telescope-ghq.nvim",
    url = "https://github.com/nvim-telescope/telescope-ghq.nvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nÀ\1\0\0\n\0\n\1\0246\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0004\6\3\0009\a\4\0014\t\0\0B\a\2\0?\a\0\0=\6\6\5=\5\b\4B\2\2\0016\2\0\0'\4\1\0B\2\2\0029\2\t\2'\4\6\0B\2\2\1K\0\1\0\19load_extension\15extensions\1\0\0\14ui-select\1\0\0\15get_cursor\nsetup\21telescope.themes\14telescope\frequire\3ÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "plenary.nvim" },
    config = { "\27LJ\2\nœ\1\0\0\t\0\16\0\0226\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\14\0005\5\4\0005\6\b\0005\a\6\0009\b\5\1=\b\a\a=\a\t\0065\a\n\0009\b\5\1=\b\v\a=\a\f\6=\6\r\5=\5\15\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6i\n<Esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\1\0\1\18prompt_prefix\tüîç\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "plenary.nvim", "nvim-treesitter" }
  },
  ["vim-auto-save"] = {
    config = { "\27LJ\2\nT\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\29auto_save_in_insert_mode\14auto_save\6g\bvim\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-auto-save",
    url = "https://github.com/vim-scripts/vim-auto-save"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\2\ng\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\fmatchup\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup",
    wants = { "nvim-treesitter" }
  },
  ["vim-repeat"] = {
    config = { "\27LJ\2\në\1\0\0\b\0\b\0\0166\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\3\0029\2\4\2'\4\5\0+\5\2\0+\6\1\0+\a\2\0B\2\5\0026\3\0\0009\3\6\0039\3\a\3B\0\3\1K\0\1\0\ncount\6v\25<Plug>MyWonderfulMap\27nvim_replace_termcodes\bapi\15repeat#set\afn\bvim\0" },
    load_after = {
      ["vim-surround"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    after = { "vim-repeat" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround",
    wants = { "vim-repeat" }
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "nvim-cmp",
  ["^cmp_luasnip"] = "cmp_luasnip",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^luasnip"] = "LuaSnip",
  ["^mason%-lspconfig"] = "mason-lspconfig.nvim",
  ["^telescop%._extensions%.media_files"] = "telescope-media-files.nvim",
  ["^telescope%._extensions%.frecency"] = "telescope-frecency.nvim",
  ["^telescope%._extensions%.ghq"] = "telescope-ghq.nvim",
  ["^telescope%._extensions%.live_grep_args"] = "telescope-live-grep-args.nvim",
  ["^telescope%._extensions%.ui%-select"] = "telescope-ui-select.nvim",
  ["mason.*"] = "mason.nvim",
  ["nvim-treesitter.*"] = "nvim-treesitter",
  ["plenary.*"] = "plenary.nvim",
  ["telescope.*"] = "telescope.nvim",
  ["ts_context_commentstring.*"] = "nvim-ts-context-commentstring"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: telescope-frecency.nvim
time([[Setup for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\n´\1\0\0\n\0\n\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\t\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\rfrecency\15extensions\15<Leader>fr\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\28plugin.telescope.helper\frequire\0", "setup", "telescope-frecency.nvim")
time([[Setup for telescope-frecency.nvim]], false)
-- Setup for: telescope-live-grep-args.nvim
time([[Setup for telescope-live-grep-args.nvim]], true)
try_loadstring("\27LJ\2\n±\1\0\0\n\0\n\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\t\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\19live_grep_args\15extensions\15<Leader>fg\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\28plugin.telescope.helper\frequire\0", "setup", "telescope-live-grep-args.nvim")
time([[Setup for telescope-live-grep-args.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\nﬂ\2\0\0\t\0\16\0-6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0B\6\2\2\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\n\0009\6\b\0'\b\v\0B\6\2\2\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\f\0009\6\b\0'\b\r\0B\6\2\2\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0009\6\b\0'\b\15\0B\6\2\2\18\a\1\0B\2\5\1K\0\1\0\nmarks\15<leader>fm\14help_tags\15<leader>fh\20command_history\15<leader>f:\15find_files\fbuiltin\15<Leader>ff\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\28plugin.telescope.helper\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: telescope-media-files.nvim
time([[Setup for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\nÆ\1\0\0\n\0\n\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\t\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\16media_files\15extensions\15<Leader>fM\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\28plugin.telescope.helper\frequire\0", "setup", "telescope-media-files.nvim")
time([[Setup for telescope-media-files.nvim]], false)
-- Setup for: mason.nvim
time([[Setup for mason.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\topen\rmason.ui\frequire\\\1\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0003\4\4\0005\5\5\0B\1\4\1K\0\1\0\1\0\1\tbang\2\0\nMason\29nvim_create_user_command\bapi\bvim\0", "setup", "mason.nvim")
time([[Setup for mason.nvim]], false)
-- Setup for: telescope-ghq.nvim
time([[Setup for telescope-ghq.nvim]], true)
try_loadstring("\27LJ\2\n´\1\0\0\n\0\v\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\n\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\tlist\bghq\15extensions\15<Leader>fq\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\28plugin.telescope.helper\frequire\0", "setup", "telescope-ghq.nvim")
time([[Setup for telescope-ghq.nvim]], false)
-- Setup for: telescope-ui-select.nvim
time([[Setup for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\no\2\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0G\2\0\0A\0\0\1K\0\1\0\16code_action\bbuf\blsp\bvim$telescope._extensions.ui-select\frequire\\\1\0\b\0\a\0\v3\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0\18\a\1\0B\2\5\1K\0\1\0\aga\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope-ui-select.nvim")
time([[Setup for telescope-ui-select.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nD\0\0\4\0\4\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\3\0=\0\1\1K\0\1\0\bvim\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: vim-auto-save
time([[Config for vim-auto-save]], true)
try_loadstring("\27LJ\2\nT\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\29auto_save_in_insert_mode\14auto_save\6g\bvim\0", "config", "vim-auto-save")
time([[Config for vim-auto-save]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim_context_vt'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'nvim_context_vt'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType hbs ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "hbs" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType handlebars ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "handlebars" }, _G.packer_plugins)]]
vim.cmd [[au FileType rescript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "rescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType glimmer ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "glimmer" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nightfox.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'cmp_luasnip', 'nvim-autopairs', 'vim-surround', 'cmp-buffer', 'cmp-dictionary', 'cmp-emoji', 'cmp-nvim-lsp', 'cmp-path'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'mason-lspconfig.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'mason-lspconfig.nvim'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufAdd * ++once lua require("packer.load")({'mason-lspconfig.nvim'}, { event = "BufAdd *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'hlargs.nvim', 'lspsaga.nvim', 'nvim-ts-autotag', 'nvim-ts-rainbow', 'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
