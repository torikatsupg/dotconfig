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
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
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
    config = { "\27LJ\2\n´\2\0\0\6\0\n\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0B\2\3\0019\2\a\0\18\4\1\0B\2\2\0016\2\0\0'\4\b\0B\2\2\0029\3\a\0025\5\t\0B\3\2\1K\0\1\0\1\0\b\nasync\2\ndebug\2\rcapacity\3\5\14max_items\3\n\rdocument\2\21document_command\16wn %s -over\27first_case_insensitive\1\nexact\3\2\19cmp_dictionary\nsetup\1\0\2\19keyword_length\3\4\tname\15dictionary\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
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
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1K\0\1\0Ä\1\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0003\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\rdebugger\1\0\0\28register_configurations\0\1\0\1\fenabled\1\nsetup\18flutter-tools\frequire\0" },
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
    config = { "\27LJ\2\n⁄\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\vborder\vsingle\bcol\3\1\rrelative\vcursor\nstyle\fminimal\28current_line_blame_opts\1\0\4\18virt_text_pos\beol\22ignore_whitespace\1\ndelay\3Ë\a\14virt_text\2\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\nsigns\1\0\n\nnumhl\1\vlinehl\1\15signcolumn\2!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20update_debounce\3d\14word_diff\1\18sign_priority\3\6\20max_file_length\3¿∏\2\24attach_to_untracked\2\23current_line_blame\1\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b‚Äæ\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\6_\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\b‚îÇ\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
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
    config = { "\27LJ\2\n~\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\aui\1\0\1\vborder\frounded\22symbols_in_winbar\1\0\0\1\0\1\venable\1\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n†\5\0\0\b\0\30\00026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\f\0004\5\3\0005\6\t\0005\a\n\0=\a\v\6>\6\1\5=\5\r\0044\5\3\0004\6\3\0009\a\14\0>\a\1\6>\6\1\5=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\0044\5\3\0005\6\20\0005\a\21\0=\a\v\6>\6\1\5=\5\22\4=\4\23\0035\4\25\0004\5\3\0005\6\24\0>\6\1\5=\5\r\4=\4\26\0035\4\28\0004\5\3\0005\6\27\0>\6\1\5=\5\r\4=\4\29\3B\1\2\1K\0\1\0\20inactive_winbar\1\0\0\1\2\2\0\rfilename\16file_status\2\tpath\3\1\vwinbar\1\0\0\1\2\2\0\rfilename\16file_status\2\tpath\3\1\rsections\14lualine_z\1\0\1\nright\bÓÇ¥\1\2\1\0\rlocation\17left_padding\3\2\14lualine_y\1\3\0\0\rfiletype\rprogress\14lualine_x\1\3\0\0\rencoding\15fileformat\14lualine_c\17get_location\14lualine_a\1\0\0\14separator\1\0\1\tleft\bÓÇ∂\1\2\1\0\tmode\18right_padding\3\2\foptions\1\0\0\23section_separators\1\0\2\tleft\bÓÇ¥\nright\bÓÇ∂\1\0\4\25component_separators\6|\25always_divide_middle\2\17globalstatus\1\ntheme\fduskfox\nsetup\flualine\15nvim-navic\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\nÄ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ensure_installed\1\0\1\27automatic_installation\2\1\2\0\0\vlua_ls\nsetup\20mason-lspconfig\frequire\0" },
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
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\rposition\nfloat\nsetup\rneo-tree\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n˜\4\0\0\6\0#\0'6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\15\0035\4\16\0=\4\17\0035\4\19\0005\5\18\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\0045\5\31\0=\5 \4=\4!\0034\4\0\0=\4\"\3B\1\2\1K\0\1\0\rmappings\rsections\vrecent\1\0\1\vfolded\2\runmerged\1\0\1\vfolded\1\runpulled\1\0\1\vfolded\2\fstashes\1\0\1\vfolded\2\vstaged\1\0\1\vfolded\1\runstaged\1\0\1\vfolded\1\14untracked\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\2\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\6>\6v\fsection\1\0\0\1\3\0\0\6>\6v\npopup\1\0\1\tkind\nsplit\17commit_popup\1\0\1\tkind\nsplit\1\0\b\26use_magit_keybindings\1 disable_commit_confirmation\1\17auto_refresh\2\tkind\btab\17disable_hint\1!disable_context_highlighting\1\18disable_signs\1\"disable_builtin_notifications\1\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  neotest = {
    config = { "\27LJ\2\n®\1\0\0\a\0\t\1\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\4\0B\4\2\0?\4\0\0=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\nicons\1\0\1\frunning\bÔë™\radapters\1\0\0\1\0\1\fcommand\fflutter\17neotest-dart\nsetup\fneotest\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-dart"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/neotest-dart",
    url = "https://github.com/sidlatau/neotest-dart"
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
    config = { "\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs",
    wants = { "nvim-treesitter" }
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nç\4\0\2\6\0\a\0\0155\2\0\0005\3\1\0009\4\2\0018\4\4\2\14\0\4\0X\5\1Ä'\4\3\0009\5\2\1&\4\5\4=\4\2\0019\4\5\0009\4\6\0048\4\4\3=\4\4\1L\1\2\0\tname\vsource\tmenu\5\tkind\1\0\5\18latex_symbols\f[LaTeX]\fluasnip\v[Snip]\rnvim_lsp\n[LSP]\rnvim_lua\n[Lua]\vbuffer\r[Buffer]\1\0\25\tText\nÓ™ì  \18TypeParameter\nÓ™í  \rOperator\nÓ≠§  \nEvent\nÓ™Ü  \vStruct\nÓ™ë  \rConstant\nÓ≠ù  \15EnumMember\nÓ™ï  \vFolder\nÓ™É  \14Reference\nÓ™î  \tFile\nÓ©ª  \nColor\nÓ≠ú  \fSnippet\nÓ≠¶  \fKeyword\nÓ≠¢  \tEnum\nÓ™ï  \nValue\nÓ™ï  \tUnit\nÓ™ñ  \rProperty\nÓ≠•  \vModule\nÓ™ã  \14Interface\nÓ≠°  \nClass\nÓ≠õ  \rVariable\nÓ™à  \nField\nÓ≠ü  \16Constructor\nÓ™å  \rFunction\nÓ™å  \vMethod\nÓ™å  µ\3\1\0\n\0\30\00076\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\0039\4\5\0009\4\6\0049\4\a\0045\6\t\0009\a\5\0009\a\b\a)\t¸ˇB\a\2\2=\a\n\0069\a\5\0009\a\b\a)\t\4\0B\a\2\2=\a\v\0069\a\5\0009\a\f\aB\a\1\2=\a\r\0069\a\5\0009\a\14\aB\a\1\2=\a\15\0069\a\5\0009\a\16\a5\t\17\0B\a\2\2=\a\18\6B\4\2\2=\4\5\0035\4\19\0=\4\20\0035\4\25\0004\5\4\0009\6\21\0009\6\22\6>\6\1\0059\6\21\0009\6\23\6>\6\2\0059\6\21\0009\6\24\6>\6\3\5=\5\26\0043\5\27\0=\5\28\4=\4\29\3B\1\2\1K\0\1\0\15formatting\vformat\0\vfields\1\0\0\tMenu\tKind\tAbbr\14ItemField\tview\1\0\1\fentries\vcustom\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsources\1\0\0\nsetup\bcmp\frequire\0" },
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
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n¨\3\0\0\5\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\b\0005\4\t\0=\4\n\3>\3\1\0025\3\v\0005\4\f\0=\4\n\3>\3\2\2=\2\3\1K\0\1\0\1\3\0\0\a-d\viphone\1\0\5\frequest\vlaunch\tname\bios\ttype\tdart\fprogram%${workspaceFolder}/lib/main.dart\bcwd\23${workspaceFolder}\rtoolArgs\1\3\0\0\a-d\vchrome\1\0\5\frequest\vlaunch\tname\vchrome\ttype\tdart\fprogram%${workspaceFolder}/lib/main.dart\bcwd\23${workspaceFolder}\19configurations\targs\1\2\0\0\18debug_adapter\1\0\2\ttype\15executable\fcommand\fflutter\tdart\radapters\bdap\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\nG\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n/\0\5\f\0\1\0\b9\5\0\0)\a\0\0)\b\0\0)\t\0\0004\n\0\0004\v\0\0B\5\6\1K\0\1\0\fsetVirtS\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\18override_lens\1\0\0\0\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nô\1\0\2\a\0\b\0\0156\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\5\0'\4\6\0B\2\2\0029\2\a\2\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\vattach\15nvim-navic\frequire\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim\v\0\0\1\0\0\0\1K\0\1\0¢\5\1\0\14\0)\0:6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\0015\3\5\0B\1\2\0015\1\6\0006\2\a\0\18\4\1\0B\2\2\4H\5\fÄ'\a\b\0\18\b\5\0&\a\b\a6\b\2\0009\b\t\b9\b\n\b\18\n\a\0005\v\v\0=\6\f\v=\a\r\v=\a\14\vB\b\3\1F\5\3\3R\5Ú\1273\2\15\0005\3\16\0003\4\17\0007\4\18\0009\4\19\0009\4\20\0045\6\21\0=\3\22\0065\a&\0005\b\24\0005\t\23\0=\t\25\b5\t\27\0005\n\26\0=\n\28\t=\t\29\b5\t!\0006\n\2\0009\n\30\n9\n\31\n'\f \0+\r\2\0B\n\3\2=\n\"\t=\t#\b5\t$\0=\t%\b=\b'\a=\a(\6B\4\2\1K\0\1\0\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\nflags\1\0\0\nsetup\vlua_ls\17capabilities\0\1\0\1\26debounce_text_changes\0032\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tWarn\tÔî© \nError\tÔôô \tHint\tÔ†µ \tInfo\tÔëâ \1\0\5\21update_in_insert\1\14underline\2\18severity_sort\1\nsigns\2\17virtual_text\1\vconfig\15diagnostic\bvim\14lspconfig\frequire\0" },
    load_after = {
      ["mason-lspconfig.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\na\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0=\0\1\1K\0\1\0\bvim\1\0\1\22background_colour\f#000000\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\ne\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\30scrollbar.handlers.search\nsetup\14scrollbar\frequire\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nI\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\28nvim-treesitter.configs\frequire\0" },
    load_after = {
      ["nvim-ts-context-commentstring"] = true
    },
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
    after = { "nvim-treesitter" },
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
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
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
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/plenary.nvim",
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
    config = { "\27LJ\2\nœ\1\0\0\t\0\16\0\0226\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\14\0005\5\4\0005\6\b\0005\a\6\0009\b\5\1=\b\a\a=\a\t\0065\a\n\0009\b\5\1=\b\v\a=\a\f\6=\6\r\5=\5\15\4B\2\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6i\n<Esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\1\0\1\18prompt_prefix\tüîç\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-auto-save"] = {
    config = { "\27LJ\2\nT\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\29auto_save_in_insert_mode\14auto_save\6g\bvim\0" },
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-auto-save",
    url = "https://github.com/vim-scripts/vim-auto-save"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
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
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
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
  ["^telescop%._extensions%.media_files"] = "telescope-media-files.nvim",
  ["^telescope%._extensions%.frecency"] = "telescope-frecency.nvim",
  ["^telescope%._extensions%.ghq"] = "telescope-ghq.nvim",
  ["^telescope%._extensions%.live_grep_args"] = "telescope-live-grep-args.nvim",
  ["^telescope%._extensions%.ui%-select"] = "telescope-ui-select.nvim",
  ["mason.*"] = "mason.nvim",
  ["nvim-treesitter.*"] = "nvim-treesitter",
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

-- Setup for: telescope-media-files.nvim
time([[Setup for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\nÆ\1\0\0\n\0\n\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\t\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\16media_files\15extensions\15<Leader>fM\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\1\28plugin.telescope.helper\frequire\0", "setup", "telescope-media-files.nvim")
time([[Setup for telescope-media-files.nvim]], false)
-- Setup for: telescope-frecency.nvim
time([[Setup for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\n´\1\0\0\n\0\n\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\t\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\rfrecency\15extensions\15<Leader>fr\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\1\28plugin.telescope.helper\frequire\0", "setup", "telescope-frecency.nvim")
time([[Setup for telescope-frecency.nvim]], false)
-- Setup for: telescope-ui-select.nvim
time([[Setup for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\no\2\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0G\2\0\0A\0\0\1K\0\1\0\16code_action\bbuf\blsp\bvim$telescope._extensions.ui-select\frequire\\\1\0\b\0\a\0\v3\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0\18\a\1\0B\2\5\1K\0\1\0\aga\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\1\0\0", "setup", "telescope-ui-select.nvim")
time([[Setup for telescope-ui-select.nvim]], false)
-- Setup for: telescope-ghq.nvim
time([[Setup for telescope-ghq.nvim]], true)
try_loadstring("\27LJ\2\n´\1\0\0\n\0\v\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\n\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\tlist\bghq\15extensions\15<Leader>fq\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\1\28plugin.telescope.helper\frequire\0", "setup", "telescope-ghq.nvim")
time([[Setup for telescope-ghq.nvim]], false)
-- Setup for: telescope-live-grep-args.nvim
time([[Setup for telescope-live-grep-args.nvim]], true)
try_loadstring("\27LJ\2\n±\1\0\0\n\0\n\0\0166\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0'\t\t\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\19live_grep_args\15extensions\15<Leader>fg\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\1\28plugin.telescope.helper\frequire\0", "setup", "telescope-live-grep-args.nvim")
time([[Setup for telescope-live-grep-args.nvim]], false)
-- Setup for: mason.nvim
time([[Setup for mason.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\topen\rmason.ui\frequire\\\1\0\6\0\6\0\t6\0\0\0009\0\1\0009\0\2\0\18\1\0\0'\3\3\0003\4\4\0005\5\5\0B\1\4\1K\0\1\0\1\0\1\tbang\2\0\nMason\29nvim_create_user_command\bapi\bvim\0", "setup", "mason.nvim")
time([[Setup for mason.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\nﬂ\2\0\0\t\0\16\0-6\0\0\0'\2\1\0B\0\2\0025\1\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\a\0009\6\b\0'\b\t\0B\6\2\2\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\n\0009\6\b\0'\b\v\0B\6\2\2\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\f\0009\6\b\0'\b\r\0B\6\2\2\18\a\1\0B\2\5\0016\2\3\0009\2\4\0029\2\5\2'\4\6\0'\5\14\0009\6\b\0'\b\15\0B\6\2\2\18\a\1\0B\2\5\1K\0\1\0\nmarks\15<leader>fm\14help_tags\15<leader>fh\20command_history\15<leader>f:\15find_files\fbuiltin\15<Leader>ff\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\1\28plugin.telescope.helper\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: vim-repeat
time([[Config for vim-repeat]], true)
try_loadstring("\27LJ\2\në\1\0\0\b\0\b\0\0166\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\3\0029\2\4\2'\4\5\0+\5\2\0+\6\1\0+\a\2\0B\2\5\0026\3\0\0009\3\6\0039\3\a\3B\0\3\1K\0\1\0\ncount\6v\25<Plug>MyWonderfulMap\27nvim_replace_termcodes\bapi\15repeat#set\afn\bvim\0", "config", "vim-repeat")
time([[Config for vim-repeat]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n˜\4\0\0\6\0#\0'6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0035\4\t\0005\5\b\0=\5\n\0045\5\v\0=\5\f\0045\5\r\0=\5\14\4=\4\15\0035\4\16\0=\4\17\0035\4\19\0005\5\18\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0045\5\25\0=\5\26\0045\5\27\0=\5\28\0045\5\29\0=\5\30\0045\5\31\0=\5 \4=\4!\0034\4\0\0=\4\"\3B\1\2\1K\0\1\0\rmappings\rsections\vrecent\1\0\1\vfolded\2\runmerged\1\0\1\vfolded\1\runpulled\1\0\1\vfolded\2\fstashes\1\0\1\vfolded\2\vstaged\1\0\1\vfolded\1\runstaged\1\0\1\vfolded\1\14untracked\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\2\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\6>\6v\fsection\1\0\0\1\3\0\0\6>\6v\npopup\1\0\1\tkind\nsplit\17commit_popup\1\0\1\tkind\nsplit\1\0\b\26use_magit_keybindings\1 disable_commit_confirmation\1\17auto_refresh\2\tkind\btab\17disable_hint\1!disable_context_highlighting\1\18disable_signs\1\"disable_builtin_notifications\1\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\na\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0=\0\1\1K\0\1\0\bvim\1\0\1\22background_colour\f#000000\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n¨\3\0\0\5\0\r\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0005\2\4\0005\3\5\0=\3\6\2=\2\3\0019\1\a\0004\2\3\0005\3\b\0005\4\t\0=\4\n\3>\3\1\0025\3\v\0005\4\f\0=\4\n\3>\3\2\2=\2\3\1K\0\1\0\1\3\0\0\a-d\viphone\1\0\5\frequest\vlaunch\tname\bios\ttype\tdart\fprogram%${workspaceFolder}/lib/main.dart\bcwd\23${workspaceFolder}\rtoolArgs\1\3\0\0\a-d\vchrome\1\0\5\frequest\vlaunch\tname\vchrome\ttype\tdart\fprogram%${workspaceFolder}/lib/main.dart\bcwd\23${workspaceFolder}\19configurations\targs\1\2\0\0\18debug_adapter\1\0\2\ttype\15executable\fcommand\fflutter\tdart\radapters\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: neotest
time([[Config for neotest]], true)
try_loadstring("\27LJ\2\n®\1\0\0\a\0\t\1\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\5\0004\3\3\0006\4\0\0'\6\3\0B\4\2\0025\6\4\0B\4\2\0?\4\0\0=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\nicons\1\0\1\frunning\bÔë™\radapters\1\0\0\1\0\1\fcommand\fflutter\17neotest-dart\nsetup\fneotest\frequire\3ÄÄ¿ô\4\0", "config", "neotest")
time([[Config for neotest]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
try_loadstring("\27LJ\2\ne\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\30scrollbar.handlers.search\nsetup\14scrollbar\frequire\0", "config", "nvim-scrollbar")
time([[Config for nvim-scrollbar]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n⁄\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\brow\3\0\vborder\vsingle\bcol\3\1\rrelative\vcursor\nstyle\fminimal\28current_line_blame_opts\1\0\4\18virt_text_pos\beol\22ignore_whitespace\1\ndelay\3Ë\a\14virt_text\2\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\nsigns\1\0\n\nnumhl\1\vlinehl\1\15signcolumn\2!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\20update_debounce\3d\14word_diff\1\18sign_priority\3\6\20max_file_length\3¿∏\2\24attach_to_untracked\2\23current_line_blame\1\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6~\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\b‚Äæ\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ttext\6_\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\b‚îÇ\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n~\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\aui\1\0\1\vborder\frounded\22symbols_in_winbar\1\0\0\1\0\1\venable\1\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: vim-auto-save
time([[Config for vim-auto-save]], true)
try_loadstring("\27LJ\2\nT\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0\29auto_save_in_insert_mode\14auto_save\6g\bvim\0", "config", "vim-auto-save")
time([[Config for vim-auto-save]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n†\5\0\0\b\0\30\00026\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\a\0005\4\4\0005\5\5\0=\5\6\4=\4\b\0035\4\f\0004\5\3\0005\6\t\0005\a\n\0=\a\v\6>\6\1\5=\5\r\0044\5\3\0004\6\3\0009\a\14\0>\a\1\6>\6\1\5=\5\15\0045\5\16\0=\5\17\0045\5\18\0=\5\19\0044\5\3\0005\6\20\0005\a\21\0=\a\v\6>\6\1\5=\5\22\4=\4\23\0035\4\25\0004\5\3\0005\6\24\0>\6\1\5=\5\r\4=\4\26\0035\4\28\0004\5\3\0005\6\27\0>\6\1\5=\5\r\4=\4\29\3B\1\2\1K\0\1\0\20inactive_winbar\1\0\0\1\2\2\0\rfilename\16file_status\2\tpath\3\1\vwinbar\1\0\0\1\2\2\0\rfilename\16file_status\2\tpath\3\1\rsections\14lualine_z\1\0\1\nright\bÓÇ¥\1\2\1\0\rlocation\17left_padding\3\2\14lualine_y\1\3\0\0\rfiletype\rprogress\14lualine_x\1\3\0\0\rencoding\15fileformat\14lualine_c\17get_location\14lualine_a\1\0\0\14separator\1\0\1\tleft\bÓÇ∂\1\2\1\0\tmode\18right_padding\3\2\foptions\1\0\0\23section_separators\1\0\2\tleft\bÓÇ¥\nright\bÓÇ∂\1\0\4\25component_separators\6|\25always_divide_middle\2\17globalstatus\1\ntheme\fduskfox\nsetup\flualine\15nvim-navic\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\nG\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n/\0\5\f\0\1\0\b9\5\0\0)\a\0\0)\b\0\0)\t\0\0004\n\0\0004\v\0\0B\5\6\1K\0\1\0\fsetVirtS\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\18override_lens\1\0\0\0\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\rposition\nfloat\nsetup\rneo-tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType handlebars ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "handlebars" }, _G.packer_plugins)]]
vim.cmd [[au FileType glimmer ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "glimmer" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType tsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType rescript ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "rescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType hbs ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "hbs" }, _G.packer_plugins)]]
vim.cmd [[au FileType svelte ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "svelte" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-ts-autotag'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'nvim_context_vt', 'flutter-tools.nvim'}, { ft = "dart" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim_context_vt'}, { ft = "lua" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'cmp-path', 'cmp-buffer', 'cmp-dictionary', 'cmp-emoji', 'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'mason-lspconfig.nvim'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au BufAdd * ++once lua require("packer.load")({'mason-lspconfig.nvim'}, { event = "BufAdd *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'mason-lspconfig.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-matchup'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nightfox.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'hlargs.nvim', 'nvim-ts-rainbow'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
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
