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
    keys = { { "", "<Plug>CamelCaseMotion_w" }, { "", "<Plug>CamelCaseMotion_b" }, { "", "<Plug>CamelCaseMotion_e" }, { "", "<Plug>CamelCaseMotion_ge" }, { "", "<Plug>CamelCaseMotion_iw" }, { "", "<Plug>CamelCaseMotion_ib" }, { "", "<Plug>CamelCaseMotion_ie" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  LuaSnip = {
    config = { "\27LJ\2\n:\0\0\4\0\3\1\a4\0\3\0006\1\0\0009\1\1\1'\3\2\0B\1\2\0?\1\0\0L\0\2\0\r%Y-%m-%d\tdate\aos\3ÄÄ¿ô\4∑\2\1\0\22\0\14\1\0286\0\0\0'\2\1\0B\0\2\0029\1\2\0009\2\3\0009\3\4\0009\4\5\0009\5\6\0009\6\a\0009\a\b\0003\b\t\0009\t\n\0+\v\0\0005\f\f\0004\r\3\0\18\14\1\0005\16\v\0004\17\3\0\18\18\5\0\18\20\b\0004\21\0\0B\18\3\0?\18\0\0B\14\3\0?\14\0\0=\r\r\fB\t\3\1K\0\1\0\ball\1\0\0\1\0\3\tnamr\tDate\tdscr#Date in the form of YYYY-MM-DD\ttrig\17datedatedate\17add_snippets\0\17dynamic_node\16choice_node\18function_node\16insert_node\14text_node\17snippet_node\fsnippet\fluasnip\frequire\3ÄÄ¿ô\4\0" },
    load_after = {
      cmp_luasnip = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n˛\3\0\0\f\0\23\1U4\0\0\0006\1\0\0009\1\1\0019\1\2\0016\2\0\0009\2\1\0029\2\3\2)\4\0\0005\5\5\0009\6\4\1=\6\2\5B\2\3\2\21\2\2\0006\3\0\0009\3\1\0039\3\3\3)\5\0\0005\6\a\0009\a\6\1=\a\2\6B\3\3\2\21\3\3\0006\4\0\0009\4\1\0049\4\3\4)\6\0\0005\a\t\0009\b\b\1=\b\2\aB\4\3\2\21\4\4\0006\5\0\0009\5\1\0059\5\3\5)\a\0\0005\b\v\0009\t\n\1=\t\2\bB\5\3\2\21\5\5\0\b\2\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\15\0'\n\14\0\18\v\2\0&\n\v\n=\n\16\tB\6\3\1\b\3\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\18\0'\n\17\0\18\v\3\0&\n\v\n=\n\16\tB\6\3\1\b\5\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\20\0'\n\19\0\18\v\5\0&\n\v\n=\n\16\tB\6\3\1\b\4\0\0X\6\tÄ6\6\f\0009\6\r\6\18\b\0\0005\t\22\0'\n\21\0\18\v\4\0&\n\v\n=\n\16\tB\6\3\1L\0\2\0\1\0\1\afg\f#7EA9A7\r ‚ÑπÔ∏è \1\0\1\afg\f#A3BA5E\n Ôäú \1\0\1\afg\f#EFB839\n Ôî© \ttext\1\0\1\afg\f#EC5241\n Ôôô \vinsert\ntable\1\0\0\tHINT\1\0\0\tINFO\1\0\0\tWARN\1\0\0\nERROR\bget\rseverity\15diagnostic\bvim\0Ë\5\1\0\6\0&\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\24\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\25\0025\3\26\0005\4\27\0=\4\28\0035\4\29\0005\5\30\0=\5\31\4=\4 \0035\4\"\0003\5!\0=\5#\4=\4$\3=\3%\2B\0\2\1K\0\1\0\foptions\17custom_areas\nright\1\0\0\0\nhover\vreveal\1\2\0\0\nclose\1\0\2\fenabled\2\ndelay\3»\1\14indicator\1\0\1\nstyle\ticon\1\0\6\16diagnostics\rnvim_lsp!diagnostics_update_in_insert\2\20separator_style\nslant\20max_name_length\3\20\27always_show_bufferline\2\25enforce_regular_tabs\1\15highlights\1\0\0\22separator_visible\1\0\1\afg\f#000000\23separator_selected\1\0\1\afg\f#000000\14separator\1\0\1\afg\f#000000\tfill\1\0\1\abg\f#000000\tpick\1\0\2\tbold\1\vitalic\1\17pick_visible\1\0\2\tbold\1\vitalic\1\18pick_selected\1\0\2\tbold\1\vitalic\1\18hint_selected\1\0\2\tbold\1\vitalic\1\24diagnostic_selected\1\0\2\tbold\1\vitalic\1\20buffer_selected\1\0\0\1\0\2\tbold\1\vitalic\1\nsetup\15bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["cmp-buffer"] = {
    after = { "nvim-cmp" },
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    config = { "\27LJ\2\n√\3\0\0\f\0\21\0D6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0005\6\a\0=\6\b\5B\2\3\0019\2\t\0\18\4\1\0B\2\2\0016\2\0\0'\4\n\0B\2\2\0029\2\v\0029\2\f\2\14\0\2\0X\3\1Ä4\2\0\0006\3\r\0009\3\14\3'\5\15\0\18\6\2\0005\a\17\0004\b\3\0005\t\16\0>\t\1\b=\b\5\aB\3\4\0026\4\0\0'\6\1\0B\4\2\0029\4\t\0049\4\v\4'\6\f\0\18\a\3\0B\4\3\0016\4\0\0'\6\n\0B\4\2\0029\4\v\0049\4\18\4\14\0\4\0X\5\1Ä4\4\0\0006\5\r\0009\5\14\5'\a\15\0\18\b\4\0005\t\20\0004\n\3\0005\v\19\0>\v\1\n=\n\5\tB\5\4\0026\6\0\0'\b\1\0B\6\2\0029\6\t\0069\6\v\6'\b\18\0\18\t\5\0B\6\3\1K\0\1\0\1\0\0\1\0\1\tname\vbuffer\6?\1\0\0\1\0\1\tname\vbuffer\nforce\15tbl_extend\bvim\6/\fcmdline\15cmp.config\nsetup\voption\1\0\1\19keyword_length\3\n\1\0\1\tname\vbuffer\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer",
    wants = { "nvim-cmp" }
  },
  ["cmp-cmdline"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    config = { "\27LJ\2\n \1\0\0\b\0\f\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0\14\0\0\0X\1\1Ä4\0\0\0006\1\4\0009\1\5\1'\3\6\0\18\4\0\0005\5\b\0004\6\3\0005\a\a\0>\a\1\6=\6\t\5B\1\4\0026\2\0\0'\4\n\0B\2\2\0029\2\v\0029\2\2\2'\4\3\0\18\5\1\0B\2\3\1K\0\1\0\nsetup\bcmp\fsources\1\0\0\1\0\1\tname\fcmdline\nforce\15tbl_extend\bvim\6:\fcmdline\15cmp.config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline",
    wants = { "nvim-cmp", "cmp-path" }
  },
  ["cmp-dictionary"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-dictionary/after/plugin/cmp_dictionary.vim" },
    config = { "\27LJ\2\n´\2\0\0\6\0\n\0\0206\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0B\2\3\0019\2\a\0\18\4\1\0B\2\2\0016\2\0\0'\4\b\0B\2\2\0029\3\a\0025\5\t\0B\3\2\1K\0\1\0\1\0\b\27first_case_insensitive\1\nasync\2\rdocument\2\rcapacity\3\5\14max_items\3\n\ndebug\2\21document_command\16wn %s -over\nexact\3\2\19cmp_dictionary\nsetup\1\0\2\19keyword_length\3\4\tname\15dictionary\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
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
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandÊ\2\1\0\f\0\23\0'6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\4\5\0B\4\1\0025\5\b\0003\6\a\0=\6\t\5=\5\6\0049\5\n\0026\6\f\0009\6\r\6'\b\14\0009\t\n\0029\t\v\t5\n\16\0009\v\15\1=\v\17\nB\6\4\2=\6\v\0056\5\18\0009\5\19\0059\a\20\0045\b\21\0B\5\3\0019\5\22\0\18\a\4\0B\5\2\0012\0\0ÄK\0\1\0\nsetup\1\0\1\tname\rnvim_lsp\fsources\vinsert\ntable\17capabilities\1\0\0\25default_capabilities\nforce\15tbl_extend\bvim\19default_config\tutil\vexpand\1\0\0\0\fsnippet\15get_config\fluasnip\14lspconfig\17cmp_nvim_lsp\bcmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp",
    wants = { "nvim-cmp", "nvim-lspconfig", "cmp_luasnip" }
  },
  ["cmp-path"] = {
    after_files = { "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    config = { "\27LJ\2\n†\2\0\0\n\0\16\0(6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0026\2\3\0009\2\4\0029\4\5\0015\5\6\0B\2\3\0019\2\a\0\18\4\1\0B\2\2\0016\2\0\0'\4\b\0B\2\2\0029\2\t\0029\2\n\2\14\0\2\0X\3\1Ä4\2\0\0006\3\v\0009\3\f\3'\5\r\0\18\6\2\0005\a\15\0004\b\3\0005\t\14\0>\t\1\b=\b\5\aB\3\4\0026\4\0\0'\6\1\0B\4\2\0029\4\a\0049\4\t\4'\6\n\0\18\a\3\0B\4\3\1K\0\1\0\1\0\0\1\0\1\tname\tpath\nforce\15tbl_extend\bvim\6:\fcmdline\15cmp.config\nsetup\1\0\1\tname\tpath\fsources\vinsert\ntable\15get_config\bcmp\frequire\0" },
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
  ["copilot-cmp"] = {
    after = { "copilot.lua" },
    commands = { "Copilot" },
    config = { "\27LJ\2\nı\2\0\0\a\0\23\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\0\0'\2\n\0B\0\2\0029\0\2\0005\2\15\0005\3\r\0006\4\0\0'\6\v\0B\4\2\0029\4\f\4=\4\14\3=\3\16\2B\0\2\0016\0\0\0'\2\17\0B\0\2\0029\1\18\0B\1\1\0026\2\19\0009\2\20\0029\4\21\0015\5\22\0B\2\3\0019\2\2\0\18\4\1\0B\2\2\1K\0\1\0\1\0\1\tname\fcopilot\fsources\vinsert\ntable\15get_config\bcmp\15formatters\1\0\0\16insert_text\1\0\0\20remove_existing\23copilot_cmp.format\16copilot_cmp\14filetypes\1\0\1\6*\2\npanel\1\0\1\fenabled\1\15suggestion\1\0\0\1\0\1\fenabled\1\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp",
    wants = { "nvim-cmp", "copilot.lua" }
  },
  ["copilot.lua"] = {
    load_after = {
      ["copilot-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nõ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\23current_line_blame\2!current_line_blame_formatter1<author>, <author_time:%Y-%m-%d> - <summary>\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
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
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nW\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21show_end_of_line\2\nsetup\21indent_blankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim",
    wants = { "nightfox.nvim" }
  },
  ["lspkind.nvim"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/lspkind.nvim",
    url = "https://github.com/onsails/lspkind.nvim"
  },
  ["lspsaga.nvim"] = {
    after = { "nvim-web-devicons" },
    commands = { "Lspsaga" },
    config = { "\27LJ\2\n}\0\0\4\0\b\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0006\3\3\0009\3\4\0039\3\5\0039\3\6\3=\3\5\2B\0\2\1K\0\1\0\1\0\0\nERROR\rseverity\15diagnostic\bvim\14goto_prev\23lspsaga.diagnostic\frequire}\0\0\4\0\b\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\a\0006\3\3\0009\3\4\0039\3\5\0039\3\6\3=\3\5\2B\0\2\1K\0\1\0\1\0\0\nERROR\rseverity\15diagnostic\bvim\14goto_next\23lspsaga.diagnostic\frequireõ\n\1\0\b\0004\0x6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0005\1\r\0\18\2\0\0'\4\14\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1\18\2\0\0'\4\17\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5\20\0'\6\22\0B\2\4\1\18\2\0\0'\4\14\0'\5\23\0'\6\24\0B\2\4\1\18\2\0\0'\4\14\0'\5\23\0'\6\25\0B\2\4\1\18\2\0\0'\4\14\0'\5\26\0'\6\27\0B\2\4\1\18\2\0\0'\4\14\0'\5\26\0'\6\28\0B\2\4\1\18\2\0\0'\4\14\0'\5\29\0'\6\30\0B\2\4\1\18\2\0\0'\4\14\0'\5\31\0'\6 \0B\2\4\1\18\2\0\0'\4\14\0'\5!\0'\6\"\0B\2\4\1\18\2\0\0'\4\14\0'\5#\0'\6$\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5%\0'\6&\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5'\0003\6(\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5)\0003\6*\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5+\0'\6,\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5-\0'\6.\0B\2\4\1\18\2\0\0'\4\14\0'\5/\0'\0060\0B\2\4\1\18\2\0\0005\0041\0'\0052\0'\0063\0B\2\4\1K\0\1\0!<cmd>Lspsaga term_toggle<CR>\b‚àÇ\1\3\0\0\6n\6t$<cmd>Lspsaga outgoing_calls<CR>\15<Leader>co$<cmd>Lspsaga incoming_calls<CR>\15<Leader>ci\31<cmd>Lspsaga hover_doc<CR>\6K\0\a]E\0\a[E*<cmd>Lspsaga diagnostic_jump_next<CR>\a]e*<cmd>Lspsaga diagnostic_jump_prev<CR>\a[e*<cmd>Lspsaga show_buf_diagnostics<CR>\15<leader>sb-<cmd>Lspsaga show_cursor_diagnostics<CR>\15<leader>sc+<cmd>Lspsaga show_line_diagnostics<CR>\15<leader>sl*<cmd>Lspsaga goto_type_definition<CR>*<cmd>Lspsaga peek_type_definition<CR>\agt%<cmd>Lspsaga goto_definition<CR>%<cmd>Lspsaga peek_definition<CR>\agd&<cmd>Lspsaga rename ++project<CR>\28<cmd>Lspsaga rename<CR>\agr'<cmd>Lspsaga range_code_action<CR>\aga\6v <cmd>Lspsaga lsp_finder<CR>\agh\6n\1\0\2\vsilent\1\fnoremap\2\bset\vkeymap\bvim\21symbol_in_winbar\1\0\1\venable\1\14lightbulb\1\0\1\venable\1\aui\1\0\0\1\0\2\vborder\frounded\rwinblend\3\0\nsetup\flspsaga\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
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
  ["noice.nvim"] = {
    after = { "nvim-notify", "nui.nvim" },
    config = { "\27LJ\2\nk\0\0\4\2\4\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0-\3\0\0B\1\2\0019\1\3\0-\2\0\0008\1\2\1-\2\1\0008\1\2\0014\3\0\0D\1\2\0\0¿\1¿\15extensions\19load_extension\14telescope\frequire\20\1\2\3\0\1\0\0033\2\0\0002\0\0ÄL\2\2\0\0∏\6\1\0\n\0'\00066\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\15\0005\4\v\0005\5\n\0=\5\f\0045\5\r\0=\5\14\4=\4\16\0035\4\17\0005\5\18\0=\5\f\0045\5\19\0=\5\14\0045\5\20\0005\6\21\0=\6\22\5=\5\23\0045\5\25\0005\6\24\0=\6\26\5=\5\27\4=\4\28\3=\3\29\2B\0\2\0013\0\30\0005\1\31\0006\2 \0009\2!\0029\2\"\2'\4#\0'\5$\0\18\6\0\0'\b\1\0'\t\1\0B\6\3\2\18\a\1\0B\2\5\0016\2\0\0'\4%\0B\2\2\0029\2\2\0025\4&\0B\2\2\1K\0\1\0\1\0\1\22background_colour\f#000000\vnotify\15<Leader>fn\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\nviews\14popupmenu\16win_options\17winhighlight\1\0\0\1\0\2\16FloatBorder\19DiagnosticInfo\vNormal\vNormal\vborder\fpadding\1\3\0\0\3\0\3\1\1\0\1\nstyle\frounded\1\0\2\nwidth\3<\vheight\3\n\1\0\2\brow\b50%\bcol\b50%\1\0\2\fbackend\bcmp\rrelative\veditor\18cmdline_popup\1\0\0\tsize\1\0\2\nwidth\3<\vheight\tauto\rposition\1\0\0\1\0\2\brow\b50%\bcol\b50%\fpresets\1\0\5\26long_message_to_split\2\19lsp_doc_border\1\15inc_rename\1\20command_palette\2\18bottom_search\1\blsp\1\0\0\roverride\1\0\0\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim",
    wants = { "nui.nvim", "nvim-notify" }
  },
  ["nui.nvim"] = {
    load_after = {
      ["noice.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nz\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\1\rcheck_ts\2\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs",
    wants = { "nvim-treesitter" }
  },
  ["nvim-cmp"] = {
    after = { "lspkind.nvim" },
    config = { "\27LJ\2\nç\2\0\0\n\0\n\2(6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\2\a\0\4\0X\0\2Ä+\0\1\0L\0\2\0006\0\5\0006\2\0\0009\2\1\0029\2\6\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\17Ä6\2\0\0009\2\1\0029\2\a\2)\4\0\0\23\5\1\0)\6\0\0\23\a\1\0\18\b\1\0004\t\0\0B\2\a\2:\2\1\2\18\4\2\0009\2\b\2'\5\t\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\n^%s*$\nmatch\22nvim_buf_get_text\24nvim_win_get_cursor\vunpack\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim\0\2ö\1\0\1\5\2\6\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\rÄ-\1\1\0B\1\1\2\15\0\1\0X\2\tÄ-\1\0\0009\1\1\0015\3\4\0-\4\0\0009\4\2\0049\4\3\4=\4\5\3B\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\2¿\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\fvisible≈\6\1\0\v\0004\0Y6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\5\0005\5\4\0=\5\6\4B\2\2\0016\2\a\0009\2\b\0029\2\t\2)\4\0\0'\5\n\0005\6\v\0B\2\4\0013\2\f\0009\3\r\0005\5\20\0005\6\17\0009\a\14\0009\a\15\a9\a\16\aB\a\1\2=\a\18\0069\a\14\0009\a\15\a9\a\16\aB\a\1\2=\a\19\6=\6\15\0055\6\21\0=\6\22\0055\6\25\0009\a\23\0009\a\24\a)\t¸ˇB\a\2\2=\a\26\0069\a\23\0009\a\27\aB\a\1\2=\a\28\0069\a\23\0009\a\29\aB\a\1\2=\a\30\0069\a\23\0009\a\31\aB\a\1\2=\a \0069\a\23\0009\a\27\aB\a\1\2=\a!\0066\a\a\0009\a\"\a3\t#\0B\a\2\2=\a$\0069\a\23\0009\a%\a5\t&\0009\n'\0009\n(\n=\n)\tB\a\2\2=\a*\0069\a\23\0009\a+\aB\a\1\2=\a,\0069\a\23\0009\a\27\a5\t-\0B\a\2\2=\a.\6=\6\23\0055\0061\0009\a/\0015\t0\0B\a\2\2=\a2\6=\0063\5B\3\2\0012\0\0ÄK\0\1\0\15formatting\vformat\1\0\0\1\0\3\18ellipsis_char\b...\tmode\vsymbol\rmaxwidth\0032\15cmp_format\n<C-y>\1\0\1\vselect\2\n<C-e>\nabort\t<CR>\rbehavior\vInsert\20ConfirmBehavior\1\0\1\vselect\2\fconfirm\n<Tab>\0\18schedule_wrap\n<C-k>\n<C-n>\21select_next_item\n<C-p>\21select_prev_item\n<C-f>\rcomplete\n<C-b>\1\0\0\16scroll_docs\fmapping\17experimental\1\0\1\15ghost_text\2\1\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\nsetup\0\1\0\1\afg\f#6CC644\23CmpItemKindCopilot\16nvim_set_hl\bapi\bvim\15symbol_map\1\0\0\1\0\1\fCopilot\bÔÑì\tinit\flspkind\bcmp\frequire\0" },
    load_after = {
      ["cmp-buffer"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp",
    wants = { "lspkind.nvim",
      opts = true
    }
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\no\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\25user_default_options\1\0\0\1\0\1\tmode\16virtualtext\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n/\0\5\f\0\1\0\b9\5\0\0)\a\0\0)\b\0\0)\t\0\0004\n\0\0004\v\0\0B\5\6\1K\0\1\0\fsetVirtS\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\18override_lens\1\0\0\0\nsetup\fhlslens\frequire\0" },
    load_after = {
      ["nvim-scrollbar"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lspconfig"] = {
    after = { "mason-lspconfig.nvim", "mason.nvim" },
    commands = { "LspInfo", "LspLog" },
    config = { "\27LJ\2\nœ\3\0\1\t\1\30\0*5\1\b\0005\2\6\0006\3\0\0009\3\1\0039\3\2\0036\5\0\0009\5\1\0059\5\3\0059\5\4\0055\6\5\0B\3\3\2=\3\a\2=\2\t\1\a\0\n\0X\2\21Ä5\2\27\0005\3\r\0005\4\f\0=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\0035\4\22\0006\5\0\0009\5\19\0059\5\20\5'\a\21\0+\b\2\0B\5\3\2=\5\23\4=\4\24\0035\4\25\0=\4\26\3=\3\28\2=\2\v\1-\2\0\0008\2\0\0029\2\29\2\18\4\1\0B\2\2\1K\0\1\0\0¿\nsetup\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\rsettings\vlua_ls\rhandlers\1\0\0$textDocument/publishDiagnostics\1\0\0\1\0\1\17virtual_text\1\27on_publish_diagnostics\15diagnostic\twith\blsp\bvimÊ\1\1\0\6\0\n\0\0236\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\1B\1\1\0016\1\0\0'\3\4\0B\1\2\0029\2\3\0015\4\6\0005\5\5\0=\5\a\4B\2\2\0019\2\b\0014\4\3\0003\5\t\0>\5\1\4B\2\2\0012\0\0ÄK\0\1\0\0\19setup_handlers\21ensure_installed\1\0\1\27automatic_installation\2\1\3\0\0\vlua_ls\18rust_analyzer\20mason-lspconfig\nsetup\nmason\14lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig",
    wants = { "mason.nvim", "mason-lspconfig.nvim" }
  },
  ["nvim-notify"] = {
    load_after = {
      ["noice.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-scrollbar"] = {
    after = { "nvim-hlslens" },
    config = { "\27LJ\2\ne\0\0\3\0\4\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\30scrollbar.handlers.search\nsetup\14scrollbar\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar",
    wants = { "nvim-hlslens" }
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
    config = { "\27LJ\2\n¶\1\0\0\2\0\a\0\0176\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0K\0\1\0\1\2\0\0\16InsertLeave\21auto_save_events\29auto_save_in_insert_mode\21auto_save_silent\14auto_save\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-auto-save",
    url = "https://github.com/vim-scripts/vim-auto-save"
  },
  ["vim-better-whitespace"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-better-whitespace",
    url = "https://github.com/ntpeters/vim-better-whitespace"
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
    keys = { { "", "<Plug>Dsurround" }, { "", "<Plug>CSurround" }, { "", "<Plug>YSurround" }, { "", "<Plug>Yssurround" }, { "", "<Plug>VSurround" }, { "", "<Plug>VgSurround" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround",
    wants = { "vim-repeat" }
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/torikatsu/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^cmp"] = "nvim-cmp",
  ["^cmp_luasnip"] = "cmp_luasnip",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^luasnip"] = "LuaSnip",
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

-- Setup for: vim-surround
time([[Setup for vim-surround]], true)
try_loadstring("\27LJ\2\nä\5\0\0\b\0!\0W6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\21\0'\6\20\0\18\a\1\0B\2\5\1\18\2\0\0'\4\22\0'\5\23\0'\6\24\0\18\a\1\0B\2\5\1\18\2\0\0'\4\22\0'\5\25\0'\6\26\0\18\a\1\0B\2\5\1\18\2\0\0'\4\27\0'\5\28\0'\6\29\0\18\a\1\0B\2\5\1\18\2\0\0'\4\27\0'\5\30\0'\6\29\0\18\a\1\0B\2\5\1\18\2\0\0'\4\27\0'\5\31\0'\6 \0\18\a\1\0B\2\5\1K\0\1\0\20<Plug>ISurround\v<C-G>S\v<C-G>s\20<Plug>Isurround\n<C-S>\6i\21<Plug>VgSurround\agS\20<Plug>VSurround\6S\6x\bySS\21<Plug>YSsurround\bySs\21<Plug>Yssurround\byss\20<Plug>YSurround\ayS\20<Plug>Ysurround\ays\20<Plug>CSurround\acS\20<Plug>Csurround\acs\20<Plug>Dsurround\ads\6n\1\0\2\vsilent\2\fnoremap\2\bset\vkeymap\25surround_no_mappings\6g\bvim\0", "setup", "vim-surround")
time([[Setup for vim-surround]], false)
-- Setup for: telescope-media-files.nvim
time([[Setup for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\4\2\4\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0-\3\0\0B\1\2\0019\1\3\0-\2\0\0008\1\2\1-\2\1\0008\1\2\0014\3\0\0D\1\2\0\0¿\1¿\15extensions\19load_extension\14telescope\frequire\20\1\2\3\0\1\0\0033\2\0\0002\0\0ÄL\2\2\0\0|\1\0\n\0\b\0\0143\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0'\b\a\0'\t\a\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\16media_files\15<Leader>fM\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope-media-files.nvim")
time([[Setup for telescope-media-files.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\1\2\0\a6\0\0\0'\2\1\0B\0\2\2-\1\0\0008\0\1\0004\2\0\0D\0\2\0\0¿\22telescope.builtin\frequire\20\1\1\2\0\1\0\0033\1\0\0002\0\0ÄL\1\2\0\0Ï\2\1\0\t\0\16\00053\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0'\b\a\0B\6\2\2\18\a\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\b\0\18\6\0\0'\b\t\0B\6\2\2\18\a\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\n\0\18\6\0\0'\b\v\0B\6\2\2\18\a\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\f\0\18\6\0\0'\b\r\0B\6\2\2\18\a\1\0B\2\5\0016\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\14\0\18\6\0\0'\b\15\0B\6\2\2\18\a\1\0B\2\5\1K\0\1\0\rjumplist\15<leader>fj\nmarks\15<leader>fm\14help_tags\15<leader>fh\20command_history\15<leader>f:\15find_files\15<Leader>ff\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: CamelCaseMotion
time([[Setup for CamelCaseMotion]], true)
try_loadstring("\27LJ\2\n™\3\0\0\b\0\22\0)6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0005\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0005\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0005\4\n\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0005\4\r\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0005\4\16\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\1\18\2\0\0005\4\19\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1K\0\1\0\29<Plug>CamelCaseMotion_ib\ti‚à´\1\3\0\0\6o\6x\29<Plug>CamelCaseMotion_iw\ti‚àë\1\3\0\0\6o\6x\29<Plug>CamelCaseMotion_ge\bg¬¥\1\3\0\0\6n\6s\28<Plug>CamelCaseMotion_e\a¬¥\1\3\0\0\6n\6s\28<Plug>CamelCaseMotion_b\b‚à´\1\3\0\0\6n\6s\28<Plug>CamelCaseMotion_w\b‚àë\1\3\0\0\6n\6s\1\0\2\vsilent\2\fnoremap\2\bset\vkeymap\bvim\0", "setup", "CamelCaseMotion")
time([[Setup for CamelCaseMotion]], false)
-- Setup for: telescope-ui-select.nvim
time([[Setup for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\no\2\0\3\0\6\0\n6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0009\0\4\0009\0\5\0G\2\0\0A\0\0\1K\0\1\0\16code_action\bbuf\blsp\bvim$telescope._extensions.ui-select\frequire\\\1\0\b\0\a\0\v3\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0\18\a\1\0B\2\5\1K\0\1\0\aga\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope-ui-select.nvim")
time([[Setup for telescope-ui-select.nvim]], false)
-- Setup for: telescope-live-grep-args.nvim
time([[Setup for telescope-live-grep-args.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\4\2\4\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0-\3\0\0B\1\2\0019\1\3\0-\2\0\0008\1\2\1-\2\1\0008\1\2\0014\3\0\0D\1\2\0\0¿\1¿\15extensions\19load_extension\14telescope\frequire\20\1\2\3\0\1\0\0033\2\0\0002\0\0ÄL\2\2\0\0\127\1\0\n\0\b\0\0143\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0'\b\a\0'\t\a\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\19live_grep_args\15<Leader>fg\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope-live-grep-args.nvim")
time([[Setup for telescope-live-grep-args.nvim]], false)
-- Setup for: telescope-frecency.nvim
time([[Setup for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\4\2\4\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0-\3\0\0B\1\2\0019\1\3\0-\2\0\0008\1\2\1-\2\1\0008\1\2\0014\3\0\0D\1\2\0\0¿\1¿\15extensions\19load_extension\14telescope\frequire\20\1\2\3\0\1\0\0033\2\0\0002\0\0ÄL\2\2\0\0y\1\0\n\0\b\0\0143\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0'\b\a\0'\t\a\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\rfrecency\15<Leader>fr\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope-frecency.nvim")
time([[Setup for telescope-frecency.nvim]], false)
-- Setup for: telescope-ghq.nvim
time([[Setup for telescope-ghq.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\4\2\4\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0-\3\0\0B\1\2\0019\1\3\0-\2\0\0008\1\2\1-\2\1\0008\1\2\0014\3\0\0D\1\2\0\0¿\1¿\15extensions\19load_extension\14telescope\frequire\20\1\2\3\0\1\0\0033\2\0\0002\0\0ÄL\2\2\0\0y\1\0\n\0\t\0\0143\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2'\4\5\0'\5\6\0\18\6\0\0'\b\a\0'\t\b\0B\6\3\2\18\a\1\0B\2\5\1K\0\1\0\tlist\bghq\15<Leader>fq\6n\bset\vkeymap\bvim\1\0\2\vsilent\1\fnoremap\2\0\0", "setup", "telescope-ghq.nvim")
time([[Setup for telescope-ghq.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Lspsaga', function(cmdargs)
          require('packer.load')({'lspsaga.nvim'}, { cmd = 'Lspsaga', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'lspsaga.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Lspsaga ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'LspInfo', function(cmdargs)
          require('packer.load')({'nvim-lspconfig'}, { cmd = 'LspInfo', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-lspconfig'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('LspInfo ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'LspLog', function(cmdargs)
          require('packer.load')({'nvim-lspconfig'}, { cmd = 'LspLog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-lspconfig'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('LspLog ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot-cmp'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot-cmp'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_ie <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_ie", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>VgSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>VgSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>VSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>VSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Yssurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Yssurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>YSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>YSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CSurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>CSurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_e <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_e", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>Dsurround <cmd>lua require("packer.load")({'vim-surround'}, { keys = "<lt>Plug>Dsurround", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_w <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_w", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_b <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_b", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_iw <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_iw", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_ib <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_ib", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <Plug>CamelCaseMotion_ge <cmd>lua require("packer.load")({'CamelCaseMotion'}, { keys = "<lt>Plug>CamelCaseMotion_ge", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertLeave * ++once lua require("packer.load")({'vim-auto-save'}, { event = "InsertLeave *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-ts-autotag', 'hlargs.nvim', 'vim-better-whitespace', 'bufferline.nvim', 'lspsaga.nvim', 'indent-blankline.nvim', 'nvim-ts-rainbow', 'nvim-colorizer.lua', 'nvim-lspconfig', 'nvim-scrollbar'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au Bufread * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "Bufread *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'cmp-buffer', 'cmp-cmdline', 'cmp-path'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'nightfox.nvim', 'nvim-treesitter', 'noice.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'cmp_luasnip', 'cmp-buffer', 'copilot-cmp', 'cmp-path', 'cmp-dictionary', 'nvim-autopairs', 'cmp-emoji', 'cmp-nvim-lsp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'vim-matchup', 'which-key.nvim'}, { event = "CursorHold *" }, _G.packer_plugins)]]
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
