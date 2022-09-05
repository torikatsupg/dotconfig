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
  CamelCaseMotion = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-dictionary"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-digraphs"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-digraphs",
    url = "https://github.com/dmitmel/cmp-digraphs"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-omni"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18flutter-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\bcol\3\1\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\28current_line_blame_opts\1\0\4\14virt_text\2\22ignore_whitespace\1\ndelay\3�\a\18virt_text_pos\beol\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\nsigns\1\0\n\nnumhl\1\vlinehl\1\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\23current_line_blame\1\15signcolumn\2\24attach_to_untracked\2\20max_file_length\3��\2\14word_diff\1\20update_debounce\3d\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b‾\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\6_\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b│\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\b│\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\22current_line_only\1\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\1\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nError\f#db4b4b\16Information\f#0db9d7\fWarning\f#e0af68\tHint\f#10B981\nsetup\15lsp-colors\frequire\0" },
    config = { "\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nError\f#db4b4b\fWarning\f#e0af68\tHint\f#10B981\16Information\f#0db9d7\nsetup\15lsp-colors\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nA\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\14\0\0226\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0035\4\v\0004\5\3\0005\6\t\0009\a\a\0>\a\1\0069\a\b\0=\a\n\6>\6\1\5=\5\f\4=\4\r\3B\1\2\1K\0\1\0\ftabline\14lualine_a\1\0\0\tcond\1\0\0\17is_available\17get_location\foptions\1\0\0\1\0\3\ntheme\fduskfox\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\15nvim-navic\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\rposition\nfloat\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n�\4\0\0\6\0#\0'6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\15\0035\4\16\0=\4\17\0035\4\19\0005\5\18\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\0045\5\31\0=\5 \4=\4!\0034\4\0\0=\4\"\3B\1\2\1K\0\1\0\rmappings\rsections\vrecent\1\0\1\vfolded\2\runmerged\1\0\1\vfolded\1\runpulled\1\0\1\vfolded\2\fstashes\1\0\1\vfolded\2\vstaged\1\0\1\vfolded\1\runstaged\1\0\1\vfolded\1\14untracked\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\2\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\6>\6v\fsection\1\0\0\1\3\0\0\6>\6v\npopup\1\0\1\tkind\nsplit\17commit_popup\1\0\1\tkind\nsplit\1\0\b\26use_magit_keybindings\1\"disable_builtin_notifications\1\17auto_refresh\2 disable_commit_confirmation\1!disable_context_highlighting\1\17disable_hint\1\18disable_signs\1\tkind\btab\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\nf\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\nsetup\rnightfox\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["numbers.vim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/numbers.vim",
    url = "https://github.com/myusuf3/numbers.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\3\0\0\f\0\20\1.6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\4B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\15\0025\v\16\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\17\0'\t\17\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\18\0025\v\19\0B\t\2\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5����\4\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n^\0\2\4\2\5\0\15-\2\0\0009\3\0\0018\2\3\2\14\0\2\0X\3\1�'\2\1\0009\3\0\1&\2\3\2=\2\0\1-\2\1\0009\3\3\0009\3\4\0038\2\3\2=\2\2\1L\1\2\0\2�\3�\tname\vsource\tmenu\5\tkindC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\f\1\0\15\0@\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\3\0005\3\4\0009\4\5\0005\6\20\0004\a\15\0005\b\6\0>\b\1\a5\b\a\0>\b\2\a5\b\b\0>\b\3\a5\b\t\0>\b\4\a5\b\n\0>\b\5\a5\b\v\0>\b\6\a5\b\f\0>\b\a\a5\b\r\0>\b\b\a5\b\14\0>\b\t\a5\b\15\0>\b\n\a5\b\16\0>\b\v\a5\b\17\0>\b\f\a5\b\18\0>\b\r\a5\b\19\0>\b\14\a=\a\21\0065\a\22\0=\a\23\0065\a\28\0004\b\4\0009\t\24\0009\t\25\t>\t\1\b9\t\24\0009\t\26\t>\t\2\b9\t\24\0009\t\27\t>\t\3\b=\b\29\a3\b\30\0=\b\31\a=\a \0069\a!\0009\a\"\a9\a#\a5\t%\0009\n!\0009\n$\n)\f��B\n\2\2=\n&\t9\n!\0009\n$\n)\f\4\0B\n\2\2=\n'\t9\n!\0009\n(\nB\n\1\2=\n)\t9\n!\0009\n*\nB\n\1\2=\n+\t9\n!\0009\n,\n5\f-\0B\n\2\2=\n.\tB\a\2\2=\a!\0065\a0\0003\b/\0=\b1\a=\a2\6B\4\2\0016\0043\0005\0064\0B\4\2\4X\a\t�9\t\5\0009\t5\t\18\v\b\0005\f7\0004\r\3\0005\0146\0>\14\1\r=\r\21\fB\t\3\1E\a\3\3R\a�\1276\0043\0005\0068\0B\4\2\4X\a\v�9\t\5\0009\t5\t\18\v\b\0005\f;\0004\r\3\0005\0149\0>\14\1\r5\14:\0>\14\2\r=\r\21\fB\t\3\1E\a\3\3R\a�\1279\4<\0\18\6\4\0009\4=\4'\a>\0009\b?\1B\b\1\0A\4\2\0012\0\0�K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\1\0\0\1\0\1\tname\20cmdline_history\1\0\1\tname\vbuffer\1\3\0\0\6/\6?\1\0\0\1\0\1\tname\20cmdline_history\fcmdline\1\3\0\0\6:\6@\vipairs\fsnippet\vexpand\1\0\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\0\vfields\1\0\0\tMenu\tKind\tAbbr\14ItemField\tview\1\0\1\fentries\vcustom\fsources\1\0\0\1\0\1\tname\15treesitter\1\0\1\tname\fluasnip\1\0\1\tname\rdigraphs\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\1\tname\nspell\1\0\1\tname\15dictionary\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\tomni\1\0\1\tname\fcmdline\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\29nvim_lsp_document_symbol\1\0\1\tname\rnvim_lsp\nsetup\1\0\5\18latex_symbols\f[LaTeX]\fluasnip\14[LuaSnip]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\rnvim_lua\n[Lua]\1\0\25\18TypeParameter\n  \rConstant\n  \rOperator\n  \vStruct\n  \nEvent\n  \14Reference\n  \14Interface\n  \nClass\n  \15EnumMember\n  \rVariable\n  \vFolder\n  \nField\n  \16Constructor\n  \rFunction\n  \tFile\n  \vMethod\n  \nColor\n  \tText\n  \fSnippet\n  \fKeyword\n  \tEnum\n  \nValue\n  \tUnit\n  \rProperty\n  \vModule\n  \"nvim-autopairs.completion.cmp\bcmp\frequire\0" },
    config = { "\27LJ\2\n^\0\2\4\2\5\0\15-\2\0\0009\3\0\0018\2\3\2\14\0\2\0X\3\1�'\2\1\0009\3\0\1&\2\3\2=\2\0\1-\2\1\0009\3\3\0009\3\4\0038\2\3\2=\2\2\1L\1\2\0\2�\3�\tname\vsource\tmenu\5\tkindC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\f\1\0\15\0@\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\3\0005\3\4\0009\4\5\0005\6\20\0004\a\15\0005\b\6\0>\b\1\a5\b\a\0>\b\2\a5\b\b\0>\b\3\a5\b\t\0>\b\4\a5\b\n\0>\b\5\a5\b\v\0>\b\6\a5\b\f\0>\b\a\a5\b\r\0>\b\b\a5\b\14\0>\b\t\a5\b\15\0>\b\n\a5\b\16\0>\b\v\a5\b\17\0>\b\f\a5\b\18\0>\b\r\a5\b\19\0>\b\14\a=\a\21\0065\a\22\0=\a\23\0065\a\28\0004\b\4\0009\t\24\0009\t\25\t>\t\1\b9\t\24\0009\t\26\t>\t\2\b9\t\24\0009\t\27\t>\t\3\b=\b\29\a3\b\30\0=\b\31\a=\a \0069\a!\0009\a\"\a9\a#\a5\t%\0009\n!\0009\n$\n)\f��B\n\2\2=\n&\t9\n!\0009\n$\n)\f\4\0B\n\2\2=\n'\t9\n!\0009\n(\nB\n\1\2=\n)\t9\n!\0009\n*\nB\n\1\2=\n+\t9\n!\0009\n,\n5\f-\0B\n\2\2=\n.\tB\a\2\2=\a!\0065\a0\0003\b/\0=\b1\a=\a2\6B\4\2\0016\0043\0005\0064\0B\4\2\4X\a\t�9\t\5\0009\t5\t\18\v\b\0005\f7\0004\r\3\0005\0146\0>\14\1\r=\r\21\fB\t\3\1E\a\3\3R\a�\1276\0043\0005\0068\0B\4\2\4X\a\v�9\t\5\0009\t5\t\18\v\b\0005\f;\0004\r\3\0005\0149\0>\14\1\r5\14:\0>\14\2\r=\r\21\fB\t\3\1E\a\3\3R\a�\1279\4<\0\18\6\4\0009\4=\4'\a>\0009\b?\1B\b\1\0A\4\2\0012\0\0�K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\1\0\0\1\0\1\tname\20cmdline_history\1\0\1\tname\vbuffer\1\3\0\0\6/\6?\1\0\0\1\0\1\tname\20cmdline_history\fcmdline\1\3\0\0\6:\6@\vipairs\fsnippet\vexpand\1\0\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\0\vfields\1\0\0\tMenu\tKind\tAbbr\14ItemField\tview\1\0\1\fentries\vcustom\fsources\1\0\0\1\0\1\tname\15treesitter\1\0\1\tname\fluasnip\1\0\1\tname\rdigraphs\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\1\tname\nspell\1\0\1\tname\15dictionary\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\tomni\1\0\1\tname\fcmdline\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\29nvim_lsp_document_symbol\1\0\1\tname\rnvim_lsp\nsetup\1\0\5\rnvim_lua\n[Lua]\18latex_symbols\f[LaTeX]\fluasnip\14[LuaSnip]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\1\0\25\rConstant\n  \14Interface\n  \vStruct\n  \nClass\n  \nEvent\n  \rVariable\n  \rOperator\n  \nField\n  \16Constructor\n  \rFunction\n  \15EnumMember\n  \vMethod\n  \vFolder\n  \tText\n  \14Reference\n  \18TypeParameter\n  \tFile\n  \nColor\n  \fSnippet\n  \fKeyword\n  \tEnum\n  \nValue\n  \tUnit\n  \rProperty\n  \vModule\n  \"nvim-autopairs.completion.cmp\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\1\0\2\a\0\b\0\0156\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vattach\15nvim-navic\frequire\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim�\6\1\0\15\0002\0R6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\0015\3\5\0B\1\2\0015\1\6\0006\2\a\0\18\4\1\0B\2\2\4H\5\f�'\a\b\0\18\b\5\0&\a\b\a6\b\2\0009\b\t\b9\b\n\b\18\n\a\0005\v\v\0=\6\f\v=\a\r\v=\a\14\vB\b\3\1F\5\3\3R\5�\1273\2\15\0005\3\16\0006\4\0\0'\6\17\0B\4\2\0029\4\18\0046\6\2\0009\6\19\0069\6\20\0069\6\21\6B\6\1\0A\4\0\0029\5\22\0009\5\23\0055\a\24\0=\2\25\a=\3\26\a=\4\27\aB\5\2\0019\5\28\0009\5\23\0055\a\29\0=\2\25\a=\3\26\a=\4\27\aB\5\2\0019\5\30\0009\5\23\0055\a\31\0=\2\25\a=\3\26\a=\4\27\a5\b/\0005\t!\0005\n \0=\n\"\t5\n$\0005\v#\0=\v%\n=\n&\t5\n*\0006\v\2\0009\v'\v9\v(\v'\r)\0+\14\2\0B\v\3\2=\v+\n=\n,\t5\n-\0=\n.\t=\t0\b=\b1\aB\5\2\1K\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\3\0\0\bvim\ahs\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\1\0\0\16sumneko_lua\1\0\0\vdartls\17capabilities\nflags\14on_attach\1\0\0\nsetup\rtsserver\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\0\1\26debounce_text_changes\3�\1\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\nError\t \tHint\t \tWarn\t \tInfo\t \1\0\5\nsigns\2\17virtual_text\1\18severity_sort\1\21update_in_insert\1\14underline\2\vconfig\15diagnostic\bvim\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\fmatchup\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\frainbow\1\0\3\19max_file_lines\3�\3\venable\2\18extended_mode\2\tyati\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-yati"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-yati",
    url = "https://github.com/yioneko/nvim-yati"
  },
  nvim_context_vt = {
    config = { "\27LJ\2\nr\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15disable_ft\1\0\0\1\5\0\0\rmarkdown\tyaml\byml\tdart\nsetup\20nvim_context_vt\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n]\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\2\0'\3\4\0B\1\2\1K\0\1\0\rfrecency\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\t\0$\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\2B\0\2\0016\0\0\0'\2\23\0B\0\2\0026\1\0\0'\3\24\0B\1\2\0029\2\2\0005\4\"\0005\5 \0005\6\28\0005\a\26\0009\b\25\1=\b\27\a=\a\29\0065\a\30\0009\b\25\1=\b\27\a=\a\31\6=\6!\5=\5#\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble trouble.providers.telescope\14telescope\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\t \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\t \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\t \tHACK\1\0\2\ncolor\fwarning\ticon\t \tTODO\1\0\2\ncolor\tinfo\ticon\t \bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\t \1\0\3\nsigns\2\18sign_priority\3\b\19merge_keywords\2\nsetup\18todo-comments\frequire\0" },
    config = { "\27LJ\2\n�\5\0\0\t\0$\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\2B\0\2\0016\0\0\0'\2\23\0B\0\2\0026\1\0\0'\3\24\0B\1\2\0029\2\2\0005\4\"\0005\5 \0005\6\28\0005\a\26\0009\b\25\1=\b\27\a=\a\29\0065\a\30\0009\b\25\1=\b\27\a=\a\31\6=\6!\5=\5#\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble trouble.providers.telescope\14telescope\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ticon\t \ncolor\thint\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\t \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ticon\t \ncolor\fwarning\tHACK\1\0\2\ticon\t \ncolor\fwarning\tTODO\1\0\2\ticon\t \ncolor\tinfo\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ticon\t \ncolor\nerror\1\0\3\nsigns\2\18sign_priority\3\b\19merge_keywords\2\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nError\f#db4b4b\16Information\f#0db9d7\fWarning\f#e0af68\tHint\f#10B981\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\t\0$\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\2B\0\2\0016\0\0\0'\2\23\0B\0\2\0026\1\0\0'\3\24\0B\1\2\0029\2\2\0005\4\"\0005\5 \0005\6\28\0005\a\26\0009\b\25\1=\b\27\a=\a\29\0065\a\30\0009\b\25\1=\b\27\a=\a\31\6=\6!\5=\5#\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble trouble.providers.telescope\14telescope\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\t \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\t \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\t \tHACK\1\0\2\ncolor\fwarning\ticon\t \tTODO\1\0\2\ncolor\tinfo\ticon\t \bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\t \1\0\3\nsigns\2\18sign_priority\3\b\19merge_keywords\2\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n^\0\2\4\2\5\0\15-\2\0\0009\3\0\0018\2\3\2\14\0\2\0X\3\1�'\2\1\0009\3\0\1&\2\3\2=\2\0\1-\2\1\0009\3\3\0009\3\4\0038\2\3\2=\2\2\1L\1\2\0\2�\3�\tname\vsource\tmenu\5\tkindC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\f\1\0\15\0@\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\3\0005\3\4\0009\4\5\0005\6\20\0004\a\15\0005\b\6\0>\b\1\a5\b\a\0>\b\2\a5\b\b\0>\b\3\a5\b\t\0>\b\4\a5\b\n\0>\b\5\a5\b\v\0>\b\6\a5\b\f\0>\b\a\a5\b\r\0>\b\b\a5\b\14\0>\b\t\a5\b\15\0>\b\n\a5\b\16\0>\b\v\a5\b\17\0>\b\f\a5\b\18\0>\b\r\a5\b\19\0>\b\14\a=\a\21\0065\a\22\0=\a\23\0065\a\28\0004\b\4\0009\t\24\0009\t\25\t>\t\1\b9\t\24\0009\t\26\t>\t\2\b9\t\24\0009\t\27\t>\t\3\b=\b\29\a3\b\30\0=\b\31\a=\a \0069\a!\0009\a\"\a9\a#\a5\t%\0009\n!\0009\n$\n)\f��B\n\2\2=\n&\t9\n!\0009\n$\n)\f\4\0B\n\2\2=\n'\t9\n!\0009\n(\nB\n\1\2=\n)\t9\n!\0009\n*\nB\n\1\2=\n+\t9\n!\0009\n,\n5\f-\0B\n\2\2=\n.\tB\a\2\2=\a!\0065\a0\0003\b/\0=\b1\a=\a2\6B\4\2\0016\0043\0005\0064\0B\4\2\4X\a\t�9\t\5\0009\t5\t\18\v\b\0005\f7\0004\r\3\0005\0146\0>\14\1\r=\r\21\fB\t\3\1E\a\3\3R\a�\1276\0043\0005\0068\0B\4\2\4X\a\v�9\t\5\0009\t5\t\18\v\b\0005\f;\0004\r\3\0005\0149\0>\14\1\r5\14:\0>\14\2\r=\r\21\fB\t\3\1E\a\3\3R\a�\1279\4<\0\18\6\4\0009\4=\4'\a>\0009\b?\1B\b\1\0A\4\2\0012\0\0�K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\1\0\0\1\0\1\tname\20cmdline_history\1\0\1\tname\vbuffer\1\3\0\0\6/\6?\1\0\0\1\0\1\tname\20cmdline_history\fcmdline\1\3\0\0\6:\6@\vipairs\fsnippet\vexpand\1\0\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\0\vfields\1\0\0\tMenu\tKind\tAbbr\14ItemField\tview\1\0\1\fentries\vcustom\fsources\1\0\0\1\0\1\tname\15treesitter\1\0\1\tname\fluasnip\1\0\1\tname\rdigraphs\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\1\tname\nspell\1\0\1\tname\15dictionary\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\tomni\1\0\1\tname\fcmdline\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\29nvim_lsp_document_symbol\1\0\1\tname\rnvim_lsp\nsetup\1\0\5\rnvim_lua\n[Lua]\18latex_symbols\f[LaTeX]\fluasnip\14[LuaSnip]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\1\0\25\rConstant\n  \14Interface\n  \vStruct\n  \nClass\n  \nEvent\n  \rVariable\n  \rOperator\n  \nField\n  \16Constructor\n  \rFunction\n  \15EnumMember\n  \vMethod\n  \vFolder\n  \tText\n  \14Reference\n  \18TypeParameter\n  \tFile\n  \nColor\n  \fSnippet\n  \fKeyword\n  \tEnum\n  \nValue\n  \tUnit\n  \rProperty\n  \vModule\n  \"nvim-autopairs.completion.cmp\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\0\14\0\0226\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0035\4\v\0004\5\3\0005\6\t\0009\a\a\0>\a\1\0069\a\b\0=\a\n\6>\6\1\5=\5\f\4=\4\r\3B\1\2\1K\0\1\0\ftabline\14lualine_a\1\0\0\tcond\1\0\0\17is_available\17get_location\foptions\1\0\0\1\0\3\ntheme\fduskfox\17globalstatus\1\25always_divide_middle\2\nsetup\flualine\15nvim-navic\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n^\0\2\4\2\5\0\15-\2\0\0009\3\0\0018\2\3\2\14\0\2\0X\3\1�'\2\1\0009\3\0\1&\2\3\2=\2\0\1-\2\1\0009\3\3\0009\3\4\0038\2\3\2=\2\2\1L\1\2\0\2�\3�\tname\vsource\tmenu\5\tkindC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire�\f\1\0\15\0@\0�\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\3\0005\3\4\0009\4\5\0005\6\20\0004\a\15\0005\b\6\0>\b\1\a5\b\a\0>\b\2\a5\b\b\0>\b\3\a5\b\t\0>\b\4\a5\b\n\0>\b\5\a5\b\v\0>\b\6\a5\b\f\0>\b\a\a5\b\r\0>\b\b\a5\b\14\0>\b\t\a5\b\15\0>\b\n\a5\b\16\0>\b\v\a5\b\17\0>\b\f\a5\b\18\0>\b\r\a5\b\19\0>\b\14\a=\a\21\0065\a\22\0=\a\23\0065\a\28\0004\b\4\0009\t\24\0009\t\25\t>\t\1\b9\t\24\0009\t\26\t>\t\2\b9\t\24\0009\t\27\t>\t\3\b=\b\29\a3\b\30\0=\b\31\a=\a \0069\a!\0009\a\"\a9\a#\a5\t%\0009\n!\0009\n$\n)\f��B\n\2\2=\n&\t9\n!\0009\n$\n)\f\4\0B\n\2\2=\n'\t9\n!\0009\n(\nB\n\1\2=\n)\t9\n!\0009\n*\nB\n\1\2=\n+\t9\n!\0009\n,\n5\f-\0B\n\2\2=\n.\tB\a\2\2=\a!\0065\a0\0003\b/\0=\b1\a=\a2\6B\4\2\0016\0043\0005\0064\0B\4\2\4X\a\t�9\t\5\0009\t5\t\18\v\b\0005\f7\0004\r\3\0005\0146\0>\14\1\r=\r\21\fB\t\3\1E\a\3\3R\a�\1276\0043\0005\0068\0B\4\2\4X\a\v�9\t\5\0009\t5\t\18\v\b\0005\f;\0004\r\3\0005\0149\0>\14\1\r5\14:\0>\14\2\r=\r\21\fB\t\3\1E\a\3\3R\a�\1279\4<\0\18\6\4\0009\4=\4'\a>\0009\b?\1B\b\1\0A\4\2\0012\0\0�K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\1\0\0\1\0\1\tname\20cmdline_history\1\0\1\tname\vbuffer\1\3\0\0\6/\6?\1\0\0\1\0\1\tname\20cmdline_history\fcmdline\1\3\0\0\6:\6@\vipairs\fsnippet\vexpand\1\0\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\0\vfields\1\0\0\tMenu\tKind\tAbbr\14ItemField\tview\1\0\1\fentries\vcustom\fsources\1\0\0\1\0\1\tname\15treesitter\1\0\1\tname\fluasnip\1\0\1\tname\rdigraphs\1\0\1\tname\nemoji\1\0\1\tname\tcalc\1\0\1\tname\nspell\1\0\1\tname\15dictionary\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\tomni\1\0\1\tname\fcmdline\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\29nvim_lsp_document_symbol\1\0\1\tname\rnvim_lsp\nsetup\1\0\5\18latex_symbols\f[LaTeX]\fluasnip\14[LuaSnip]\rnvim_lsp\n[LSP]\vbuffer\r[Buffer]\rnvim_lua\n[Lua]\1\0\25\18TypeParameter\n  \rConstant\n  \rOperator\n  \vStruct\n  \nEvent\n  \14Reference\n  \14Interface\n  \nClass\n  \15EnumMember\n  \rVariable\n  \vFolder\n  \nField\n  \16Constructor\n  \rFunction\n  \tFile\n  \vMethod\n  \nColor\n  \tText\n  \fSnippet\n  \fKeyword\n  \tEnum\n  \nValue\n  \tUnit\n  \rProperty\n  \vModule\n  \"nvim-autopairs.completion.cmp\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\2\0'\3\4\0B\1\2\1K\0\1\0\rfrecency\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\1\0\2\a\0\b\0\0156\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vattach\15nvim-navic\frequire\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim�\6\1\0\15\0002\0R6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\0015\3\5\0B\1\2\0015\1\6\0006\2\a\0\18\4\1\0B\2\2\4H\5\f�'\a\b\0\18\b\5\0&\a\b\a6\b\2\0009\b\t\b9\b\n\b\18\n\a\0005\v\v\0=\6\f\v=\a\r\v=\a\14\vB\b\3\1F\5\3\3R\5�\1273\2\15\0005\3\16\0006\4\0\0'\6\17\0B\4\2\0029\4\18\0046\6\2\0009\6\19\0069\6\20\0069\6\21\6B\6\1\0A\4\0\0029\5\22\0009\5\23\0055\a\24\0=\2\25\a=\3\26\a=\4\27\aB\5\2\0019\5\28\0009\5\23\0055\a\29\0=\2\25\a=\3\26\a=\4\27\aB\5\2\0019\5\30\0009\5\23\0055\a\31\0=\2\25\a=\3\26\a=\4\27\a5\b/\0005\t!\0005\n \0=\n\"\t5\n$\0005\v#\0=\v%\n=\n&\t5\n*\0006\v\2\0009\v'\v9\v(\v'\r)\0+\14\2\0B\v\3\2=\v+\n=\n,\t5\n-\0=\n.\t=\t0\b=\b1\aB\5\2\1K\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\3\0\0\bvim\ahs\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\1\0\0\16sumneko_lua\1\0\0\vdartls\17capabilities\nflags\14on_attach\1\0\0\nsetup\rtsserver\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\0\1\26debounce_text_changes\3�\1\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\nError\t \tHint\t \tWarn\t \tInfo\t \1\0\5\nsigns\2\17virtual_text\1\18severity_sort\1\21update_in_insert\1\14underline\2\vconfig\15diagnostic\bvim\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: nvim_context_vt
time([[Config for nvim_context_vt]], true)
try_loadstring("\27LJ\2\nr\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15disable_ft\1\0\0\1\5\0\0\rmarkdown\tyaml\byml\tdart\nsetup\20nvim_context_vt\frequire\0", "config", "nvim_context_vt")
time([[Config for nvim_context_vt]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\nsetup\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\22current_line_only\1\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\3\0\0\f\0\20\1.6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\4B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\15\0025\v\16\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\17\0'\t\17\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\18\0025\v\19\0B\t\2\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5����\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\t\0$\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\6\4=\4\15\0035\4\16\0005\5\17\0=\5\6\4=\4\18\0035\4\19\0005\5\20\0=\5\6\4=\4\21\3=\3\22\2B\0\2\0016\0\0\0'\2\23\0B\0\2\0026\1\0\0'\3\24\0B\1\2\0029\2\2\0005\4\"\0005\5 \0005\6\28\0005\a\26\0009\b\25\1=\b\27\a=\a\29\0065\a\30\0009\b\25\1=\b\27\a=\a\31\6=\6!\5=\5#\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble trouble.providers.telescope\14telescope\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ticon\t \ncolor\thint\tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\t \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ticon\t \ncolor\fwarning\tHACK\1\0\2\ticon\t \ncolor\fwarning\tTODO\1\0\2\ticon\t \ncolor\tinfo\bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ticon\t \ncolor\nerror\1\0\3\nsigns\2\18sign_priority\3\b\19merge_keywords\2\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0#\0'6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\15\0035\4\16\0=\4\17\0035\4\19\0005\5\18\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\0045\5\31\0=\5 \4=\4!\0034\4\0\0=\4\"\3B\1\2\1K\0\1\0\rmappings\rsections\vrecent\1\0\1\vfolded\2\runmerged\1\0\1\vfolded\1\runpulled\1\0\1\vfolded\2\fstashes\1\0\1\vfolded\2\vstaged\1\0\1\vfolded\1\runstaged\1\0\1\vfolded\1\14untracked\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\2\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\6>\6v\fsection\1\0\0\1\3\0\0\6>\6v\npopup\1\0\1\tkind\nsplit\17commit_popup\1\0\1\tkind\nsplit\1\0\b\26use_magit_keybindings\1\"disable_builtin_notifications\1\17auto_refresh\2 disable_commit_confirmation\1!disable_context_highlighting\1\17disable_hint\1\18disable_signs\1\tkind\btab\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\bcol\3\1\vborder\vsingle\nstyle\fminimal\rrelative\vcursor\28current_line_blame_opts\1\0\4\14virt_text\2\22ignore_whitespace\1\ndelay\3�\a\18virt_text_pos\beol\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3�\a\nsigns\1\0\n\nnumhl\1\vlinehl\1\18sign_priority\3\6!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\23current_line_blame\1\15signcolumn\2\24attach_to_untracked\2\20max_file_length\3��\2\14word_diff\1\20update_debounce\3d\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b‾\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\6_\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b│\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\b│\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\rposition\nfloat\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\22current_line_only\1\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\fmatchup\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\frainbow\1\0\3\19max_file_lines\3�\3\venable\2\18extended_mode\2\tyati\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\24colorscheme duskfox\bcmd\bvim\nsetup\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\1\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\fmatchup\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\frainbow\1\0\3\18extended_mode\2\venable\2\19max_file_lines\3�\3\tyati\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\1\0\2\a\0\b\0\0156\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vattach\15nvim-navic\frequire\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim�\6\1\0\15\0002\0R6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\0015\3\5\0B\1\2\0015\1\6\0006\2\a\0\18\4\1\0B\2\2\4H\5\f�'\a\b\0\18\b\5\0&\a\b\a6\b\2\0009\b\t\b9\b\n\b\18\n\a\0005\v\v\0=\6\f\v=\a\r\v=\a\14\vB\b\3\1F\5\3\3R\5�\1273\2\15\0005\3\16\0006\4\0\0'\6\17\0B\4\2\0029\4\18\0046\6\2\0009\6\19\0069\6\20\0069\6\21\6B\6\1\0A\4\0\0029\5\22\0009\5\23\0055\a\24\0=\2\25\a=\3\26\a=\4\27\aB\5\2\0019\5\28\0009\5\23\0055\a\29\0=\2\25\a=\3\26\a=\4\27\aB\5\2\0019\5\30\0009\5\23\0055\a\31\0=\2\25\a=\3\26\a=\4\27\a5\b/\0005\t!\0005\n \0=\n\"\t5\n$\0005\v#\0=\v%\n=\n&\t5\n*\0006\v\2\0009\v'\v9\v(\v'\r)\0+\14\2\0B\v\3\2=\v+\n=\n,\t5\n-\0=\n.\t=\t0\b=\b1\aB\5\2\1K\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\3\0\0\bvim\ahs\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\1\0\0\16sumneko_lua\1\0\0\vdartls\17capabilities\nflags\14on_attach\1\0\0\nsetup\rtsserver\29make_client_capabilities\rprotocol\blsp\24update_capabilities\17cmp_nvim_lsp\1\0\1\26debounce_text_changes\3�\1\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\nError\t \tHint\t \tWarn\t \tInfo\t \1\0\5\nsigns\2\17virtual_text\1\18severity_sort\1\21update_in_insert\1\14underline\2\vconfig\15diagnostic\bvim\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\3\0\0\f\0\20\1.6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\4\0005\5\6\0005\6\5\0=\6\a\0055\6\b\0=\6\t\5=\5\n\4B\2\2\0016\2\0\0'\4\v\0B\2\2\0029\3\f\0004\5\3\0\18\6\1\0'\b\r\0'\t\r\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\15\0025\v\16\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\17\0'\t\17\0'\n\a\0B\6\4\2\18\b\6\0009\6\14\0069\t\18\0025\v\19\0B\t\2\0A\6\1\0?\6\0\0B\3\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\5����\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\4\nError\f#db4b4b\fWarning\f#e0af68\tHint\f#10B981\16Information\f#0db9d7\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: nvim_context_vt
time([[Config for nvim_context_vt]], true)
try_loadstring("\27LJ\2\nr\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\15disable_ft\1\0\0\1\5\0\0\rmarkdown\tyaml\byml\tdart\nsetup\20nvim_context_vt\frequire\0", "config", "nvim_context_vt")
time([[Config for nvim_context_vt]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\4\0\5\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0'\3\3\0B\1\2\0019\1\2\0'\3\4\0B\1\2\1K\0\1\0\rfrecency\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\4\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType dart ++once lua require("packer.load")({'flutter-tools.nvim'}, { ft = "dart" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
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
