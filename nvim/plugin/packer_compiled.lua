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
local package_path_str = "/Users/katsuyatorii/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/katsuyatorii/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/katsuyatorii/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/katsuyatorii/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/katsuyatorii/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  CamelCaseMotion = {
    keys = { { "", "<Plug>CamelCaseMotion_w" }, { "", "<Plug>CamelCaseMotion_b" }, { "", "<Plug>CamelCaseMotion_e" }, { "", "<Plug>CamelCaseMotion_ge" }, { "", "<Plug>CamelCaseMotion_iw" }, { "", "<Plug>CamelCaseMotion_ib" }, { "", "<Plug>CamelCaseMotion_ie" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcomment\18others.config\frequire\0" },
    load_after = {
      ["vim-context-commentstring"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fluasnip\23foundations.config\frequire\0" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    after = { "nvim-web-devicons" },
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15bufferline\23_bufferline.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vbuffer\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer",
    wants = { "nvim-cmp" }
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcmdline\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline",
    wants = { "nvim-cmp", "cmp-path" }
  },
  ["cmp-cmdline-history"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history/after/plugin/cmp_cmdline_history.lua" },
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20cmdline_history\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history",
    wants = { "nvim-cmp" }
  },
  ["cmp-dictionary"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-dictionary/after/plugin/cmp_dictionary.lua" },
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15dictionary\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary",
    wants = { "nvim-cmp" }
  },
  ["cmp-emoji"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nemoji\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji",
    wants = { "nvim-cmp" }
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp_luasnip", "nvim-cmp", "nvim-lspconfig" },
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\blsp\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp",
    wants = { "nvim-cmp", "nvim-lspconfig", "LuaSnip" }
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    config = { "\27LJ\2\nF\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\23lsp_signature_help\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
    wants = { "nvim-cmp" }
  },
  ["cmp-path"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tpath\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path",
    wants = { "nvim-cmp" }
  },
  cmp_luasnip = {
    after = { "LuaSnip" },
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fluasnip\16_cmp.config\frequire\0" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip",
    wants = { "nvim-cmp", "LuaSnip" }
  },
  ["copilot-cmp"] = {
    after = { "copilot.lua" },
    commands = { "Copilot" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fcopilot\16_cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp",
    wants = { "nvim-cmp", "copilot.lua" }
  },
  ["copilot.lua"] = {
    load_after = {
      ["copilot-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["deepl.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/deepl.nvim",
    url = "https://github.com/torikatsupg/deepl.nvim",
    wants = { "plenary.nvim" }
  },
  ["formatter.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rgitsigns\18others.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vhlargs\23_treesitter.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim",
    wants = { "nvim-treesitter" }
  },
  ["indent-blankline.nvim"] = {
    after = { "nightfox.nvim" },
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim/after/plugin/commands.lua" },
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\21indent_blankline\29_indent_blankline.config\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim",
    wants = { "nightfox.nvim" }
  },
  ["lspkind.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\flspkind\16_cmp.config\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    commands = { "Lspsaga" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\flspsaga\20_lspsaga.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    commands = { "Mason" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim",
    wants = { "mason-lspconfig.nvim", "formatter.nvim" }
  },
  ["neo-tree.nvim"] = {
    after = { "plenary.nvim", "nui.nvim" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fneotree\20_neotree.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    wants = { "plenary.nvim", "nvim-web-devicons", "nui.nvim" }
  },
  ["nightfox.nvim"] = {
    after = { "nvim-treesitter" },
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\rnightfox\23_treesitter.config\frequire\0" },
    load_after = {
      ["indent-blankline.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim",
    wants = { "nvim-treesitter" }
  },
  ["noice.nvim"] = {
    after = { "nvim-notify" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nnoice\18_noice.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim",
    wants = { "nui.nvim", "nvim-notify" }
  },
  ["nui.nvim"] = {
    load_after = {
      ["neo-tree.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14autopairs\23_treesitter.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs",
    wants = { "nvim-treesitter", "nvim-cmp" }
  },
  ["nvim-cmp"] = {
    after = { "lspkind.nvim" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bcmp\16_cmp.config\frequire\0" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp",
    wants = { "lspkind.nvim" }
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14colorizer\22_colorizer.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19config_hlslens\27_nvim_scrollbar.config\frequire\0" },
    load_after = {
      ["nvim-scrollbar"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    after = { "formatter.nvim", "mason-lspconfig.nvim", "mason.nvim" },
    commands = { "LspInfo", "LspLog" },
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lspconfig\23foundations.config\frequire\0" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig",
    wants = { "mason.nvim", "mason-lspconfig.nvim" }
  },
  ["nvim-notify"] = {
    load_after = {
      ["noice.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    after = { "nvim-hlslens" },
    config = { "\27LJ\2\nT\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\26config_nvim_scrollbar\27_nvim_scrollbar.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar",
    wants = { "nvim-hlslens" }
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15treesitter\23foundations.config\frequire\0" },
    load_after = {
      ["nightfox.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15ts_autotag\23_treesitter.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag",
    wants = { "nvim-treesitter" }
  },
  ["nvim-ts-context-commentstring"] = {
    config = { "\27LJ\2\nX\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\"nvim_ts_context_commentstring\23_treesitter.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
    wants = { "nvim-treesitter" }
  },
  ["nvim-ts-rainbow2"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow2",
    url = "https://github.com/HiPhish/nvim-ts-rainbow2",
    wants = { "nvim-treesitter" }
  },
  ["nvim-web-devicons"] = {
    load_after = {
      ["bufferline.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  nvim_context_vt = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15context_vt\23_treesitter.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt",
    wants = { "nvim-treesitter" }
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      ["neo-tree.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["sqlite.lua"] = {
    load_after = {
      ["telescope-frecency.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    after = { "sqlite.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim",
    wants = { "sqlite.lua", "telescope.nvim" }
  },
  ["telescope-ghq.nvim"] = {
    after = { "telescope.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/telescope-ghq.nvim",
    url = "https://github.com/nvim-telescope/telescope-ghq.nvim",
    wants = { "telescope.nvim" }
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
    wants = { "telescope.nvim" }
  },
  ["telescope-media-files.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim",
    wants = { "telescope.nvim" }
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14ui_select\22_telescope.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    wants = { "telescope.nvim" }
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\22_telescope.config\frequire\0" },
    load_after = {
      ["telescope-ghq.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim",
    wants = { "plenary.nvim", "nvim-treesitter" }
  },
  ["vim-auto-save"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14auto_save\18others.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/vim-auto-save",
    url = "https://github.com/vim-scripts/vim-auto-save"
  },
  ["vim-better-whitespace"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-context-commentstring"] = {
    after = { "Comment.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/vim-context-commentstring",
    url = "https://github.com/suy/vim-context-commentstring"
  },
  ["vim-matchup"] = {
    after_files = { "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\2\nB\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fmatchup\23_treesitter.config\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup",
    wants = { "nvim-treesitter" }
  },
  ["vim-repeat"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15vim_repeat\25_vim_surround.config\frequire\0" },
    load_after = {
      ["vim-surround"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    after = { "vim-repeat" },
    keys = { { "", "<Plug>CSurround" }, { "", "<Plug>Csurround" }, { "", "<Plug>Dsurround" }, { "", "<Plug>ISurround" }, { "", "<Plug>Isurround" }, { "", "<Plug>SurroundRepeat" }, { "", "<Plug>VSurround" }, { "", "<Plug>VgSurround" }, { "", "<Plug>YSsurround" }, { "", "<Plug>YSurround" }, { "", "<Plug>Yssurround" }, { "", "<Plug>Yssurround" }, { "", "<Plug>Ysurround" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround",
    wants = { "vim-repeat" }
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14which_key\18others.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katsuyatorii/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "nvim-cmp",
  ["^cmp_luasnip"] = "cmp_luasnip",
  ["^deepl"] = "deepl.nvim",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^luasnip"] = "LuaSnip",
  ["^neo%-tree"] = "neo-tree.nvim",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^telescop%._extensions%.media_files"] = "telescope-media-files.nvim",
  ["^telescope%._extensions%.frecency"] = "telescope-frecency.nvim",
  ["^telescope%._extensions%.ghq"] = "telescope-ghq.nvim",
  ["^telescope%._extensions%.live_grep_args"] = "telescope-live-grep-args.nvim",
  ["^telescope%._extensions%.ui%-select"] = "telescope-ui-select.nvim",
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

-- Setup for: telescope-live-grep-args.nvim
time([[Setup for telescope-live-grep-args.nvim]], true)
try_loadstring("\27LJ\2\nj\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\4\0009\1\3\0019\1\3\1D\1\1\0\15extensions\19live_grep_args\19load_extension\14telescope\frequireV\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\tƒ©\6n\bset\vkeymap\bvim\0", "setup", "telescope-live-grep-args.nvim")
time([[Setup for telescope-live-grep-args.nvim]], false)
-- Setup for: telescope-media-files.nvim
time([[Setup for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\4\0009\1\3\0019\1\3\1D\1\1\0\15extensions\16media_files\19load_extension\14telescope\frequireU\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\bƒM\6n\bset\vkeymap\bvim\0", "setup", "telescope-media-files.nvim")
time([[Setup for telescope-media-files.nvim]], false)
-- Setup for: neo-tree.nvim
time([[Setup for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20open_filesystem\20_neotree.config\frequireK\1\0\5\0\5\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0003\3\4\0004\4\0\0B\0\4\1K\0\1\0\0\6E\29nvim_create_user_command\bapi\bvim\0", "setup", "neo-tree.nvim")
time([[Setup for neo-tree.nvim]], false)
-- Setup for: telescope-ui-select.nvim
time([[Setup for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\no\2\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0G\2\0\0A\0\0\1K\0\1\0\16code_action\bbuf\blsp\bvim$telescope._extensions.ui-select\frequireV\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\tƒå\6n\bset\vkeymap\bvim\0", "setup", "telescope-ui-select.nvim")
time([[Setup for telescope-ui-select.nvim]], false)
-- Setup for: telescope-frecency.nvim
time([[Setup for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\4\0009\1\3\0019\1\3\1D\1\1\0\15extensions\rfrecency\19load_extension\14telescope\frequireV\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\tƒ®\6n\bset\vkeymap\bvim\0", "setup", "telescope-frecency.nvim")
time([[Setup for telescope-frecency.nvim]], false)
-- Setup for: deepl.nvim
time([[Setup for deepl.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\3\0\a\0\n6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\14translate\ndeepl\frequire\5\22deepl_nvim_apikey\benv\bvimW\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\n<C-t>\6v\bset\vkeymap\bvim\0", "setup", "deepl.nvim")
time([[Setup for deepl.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\1\2\0\a6\0\0\0'\2\1\0B\0\2\2-\1\0\0008\0\1\0004\2\0\0D\0\2\0\0�\22telescope.builtin\frequire\20\1\1\2\0\1\0\0033\1\0\0002\0\0�L\1\2\0\0�\2\1\0\v\0\16\0/3\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\3\5\0\18\4\2\0\18\6\3\0'\a\6\0\18\b\0\0'\n\a\0B\b\2\2\18\t\1\0B\4\5\1\18\4\2\0\18\6\3\0'\a\b\0\18\b\0\0'\n\t\0B\b\2\2\18\t\1\0B\4\5\1\18\4\2\0\18\6\3\0'\a\n\0\18\b\0\0'\n\v\0B\b\2\2\18\t\1\0B\4\5\1\18\4\2\0\18\6\3\0'\a\f\0\18\b\0\0'\n\r\0B\b\2\2\18\t\1\0B\4\5\1\18\4\2\0\18\6\3\0'\a\14\0\18\b\0\0'\n\15\0B\b\2\2\18\t\1\0B\4\5\1K\0\1\0\rjumplist\nƒ∆\nmarks\tƒµ\14help_tags\tƒ˙\20command_history\nƒ…\15find_files\tƒƒ\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: vim-surround
time([[Setup for vim-surround]], true)
try_loadstring("\27LJ\2\n�\5\0\0\n\0\"\0Y6\0\0\0009\0\1\0+\1\2\0=\1\2\0005\0\3\0'\1\4\0006\2\0\0009\2\5\0029\2\6\0025\3\a\0\18\4\2\0\18\6\1\0'\a\b\0009\b\t\3\18\t\0\0B\4\5\1\18\4\2\0\18\6\1\0'\a\n\0009\b\v\3\18\t\0\0B\4\5\1\18\4\2\0\18\6\1\0'\a\f\0009\b\r\3\18\t\0\0B\4\5\1\18\4\2\0\18\6\1\0'\a\14\0009\b\15\3\18\t\0\0B\4\5\1\18\4\2\0\18\6\1\0'\a\16\0009\b\17\3\18\t\0\0B\4\5\1\18\4\2\0\18\6\1\0'\a\18\0009\b\19\3\18\t\0\0B\4\5\1\18\4\2\0\18\6\1\0'\a\20\0009\b\21\3\18\t\0\0B\4\5\1\18\4\2\0\18\6\1\0'\a\22\0009\b\21\3\18\t\0\0B\4\5\1\18\4\2\0'\6\23\0'\a\24\0009\b\25\3\18\t\0\0B\4\5\1\18\4\2\0'\6\23\0'\a\26\0009\b\27\3\18\t\0\0B\4\5\1\18\4\2\0'\6\28\0'\a\29\0009\b\30\3\18\t\0\0B\4\5\1\18\4\2\0'\6\28\0'\a\31\0009\b\30\3\18\t\0\0B\4\5\1\18\4\2\0'\6\28\0'\a \0009\b!\3\18\t\0\0B\4\5\1K\0\1\0\aIS\v<C-G>S\v<C-G>s\aIs\n<C-S>\6i\bVgS\agS\aVS\6S\6x\bySS\bYSs\bySs\bYss\byss\aYS\ayS\aYs\ays\aCS\acS\aCs\acs\aDs\ads\1\0\v\aCS\20<Plug>CSurround\aDs\20<Plug>Dsurround\aIs\20<Plug>Isurround\aIS\20<Plug>ISurround\aCs\20<Plug>Csurround\bVgS\21<Plug>VgSurround\aVS\20<Plug>VSurround\bYSs\21<Plug>YSsurround\bYss\21<Plug>Yssurround\aYS\20<Plug>YSurround\aYs\20<Plug>Ysurround\bset\vkeymap\6n\1\0\2\vsilent\2\fnoremap\2\25surround_no_mappings\6g\bvim\0", "setup", "vim-surround")
time([[Setup for vim-surround]], false)
-- Setup for: telescope-ghq.nvim
time([[Setup for telescope-ghq.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\6\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\4\0009\1\3\0019\1\5\1D\1\1\0\tlist\15extensions\bghq\19load_extension\14telescope\frequireV\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\tƒœ\6n\bset\vkeymap\bvim\0", "setup", "telescope-ghq.nvim")
time([[Setup for telescope-ghq.nvim]], false)
-- Setup for: CamelCaseMotion
time([[Setup for CamelCaseMotion]], true)
try_loadstring("\27LJ\2\n�\2\0\0\v\0\19\0008'\0\0\0006\1\1\0009\1\2\0019\1\3\0015\2\4\0005\3\5\0005\4\6\0\18\5\1\0\18\a\3\0'\b\a\0\18\t\0\0'\n\b\0&\t\n\t\18\n\2\0B\5\5\1\18\5\1\0\18\a\3\0'\b\t\0\18\t\0\0'\n\n\0&\t\n\t\18\n\2\0B\5\5\1\18\5\1\0\18\a\3\0'\b\v\0\18\t\0\0'\n\f\0&\t\n\t\18\n\2\0B\5\5\1\18\5\1\0\18\a\3\0'\b\r\0\18\t\0\0'\n\14\0&\t\n\t\18\n\2\0B\5\5\1\18\5\1\0\18\a\4\0'\b\15\0\18\t\0\0'\n\16\0&\t\n\t\18\n\2\0B\5\5\1\18\5\1\0\18\a\4\0'\b\17\0\18\t\0\0'\n\18\0&\t\n\t\18\n\2\0B\5\5\1K\0\1\0\aib\ti∫\aiw\ti∑\age\bg´\6e\a´\6b\b∫\6w\b∑\1\3\0\0\6o\6x\1\3\0\0\6n\6s\1\0\2\vsilent\2\fnoremap\2\bset\vkeymap\bvim\27<Plug>CamelCaseMotion_\0", "setup", "CamelCaseMotion")
time([[Setup for CamelCaseMotion]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Mason', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'Mason', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Mason ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'LspInfo', function(cmdargs)
          require('packer.load')({'nvim-lspconfig'}, { cmd = 'LspInfo', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-lspconfig'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('LspInfo ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot-cmp'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot-cmp'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Lspsaga', function(cmdargs)
          require('packer.load')({'lspsaga.nvim'}, { cmd = 'Lspsaga', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'lspsaga.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Lspsaga ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'LspLog', function(cmdargs)
          require('packer.load')({'nvim-lspconfig'}, { cmd = 'LspLog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-lspconfig'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('LspLog ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>Yssurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Yssurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Dsurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Dsurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_ie <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_ie", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_ge <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_ge", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Ysurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Ysurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>SurroundRepeat <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>SurroundRepeat", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>CSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_ib <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_ib", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>VSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>VSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_iw <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_iw", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Csurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Csurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_b <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_b", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>VgSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>VgSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>YSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>YSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>YSsurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>YSsurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Yssurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Yssurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Isurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Isurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>ISurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>ISurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_w <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_w", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_e <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_e", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot-cmp', 'nvim-autopairs', 'cmp_luasnip', 'cmp-buffer', 'cmp-path', 'cmp-dictionary', 'cmp-nvim-lsp-signature-help', 'cmp-emoji', 'cmp-nvim-lsp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-colorizer.lua', 'bufferline.nvim', 'nvim-scrollbar', 'hlargs.nvim', 'nvim-ts-autotag', 'indent-blankline.nvim', 'vim-context-commentstring', 'nvim-ts-rainbow2', 'nvim-lspconfig', 'lspsaga.nvim', 'vim-better-whitespace'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'which-key.nvim', 'vim-matchup'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nvim-treesitter', 'nightfox.nvim', 'noice.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au Bufread * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "Bufread *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'cmp-buffer', 'cmp-path', 'cmp-cmdline-history', 'cmp-cmdline'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertLeave * ++once lua require("packer.load")({'vim-auto-save'}, { event = "InsertLeave *" }, _G.packer_plugins)]]
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
