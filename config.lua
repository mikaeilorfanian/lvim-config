lvim.colorscheme = "dracula"

lvim.plugins = {
  { -- Quickly jump between next and previous NeoVim buffer, tab, file, quickfix, diagnostic, etc.
    "liangxianzhe/nap.nvim", 
    config = function()
    require("nap").setup()
        end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
    lazy = false,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
    lazy = false,
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
  },
  {
    'wfxr/minimap.vim',
    build = "cargo install --locked code-minimap",
    config = function ()
      vim.cmd ("let g:minimap_width = 10")
      vim.cmd ("let g:minimap_auto_start = 1")
      vim.cmd ("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  -- "nvim-neotest/neotest",
  -- "nvim-neotest/neotest-python",
  'Mofiqul/dracula.nvim',
  {'tanvirtin/monokai.nvim'},
  { "folke/trouble.nvim", cmd = "TroubleToggle" }, -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
  {
    "smoka7/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  {
    "folke/persistence.nvim",
      event = "BufReadPre",
      -- module = "persistence",
      lazy = true,
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" },
        }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
}

lvim.builtin.treesitter.ensure_installed = {
  "python",
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, {name="isort"} }
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

lvim.builtin.which_key.mappings['s']['s'] = {'<cmd>:Telescope grep_string<CR>', 'String'}

-- vim.diagnostic.config({ virtual_text = false })

-- lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
lvim.keys.normal_mode['<C-q>'] = ':q<cr>'

lvim.builtin.terminal.open_mapping = '<c-t>'

require'hop'.setup()

lvim.keys.normal_mode['<C-m>'] = ':MinimapToggle<cr>'

lvim.builtin.which_key.mappings['x'] = { ":xa<cr>", "Save All and Quit", }

lvim.builtin.which_key.mappings["S"]= {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

require('aerial').setup()
lvim.keys.normal_mode['<C-a>'] = ":AerialToggle!<CR>"

local ok, copilot = pcall(require, "copilot")

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'gd', 'gdzz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.opt.relativenumber = true
vim.opt.scrolloff = 20
vim.opt.updatetime = 200

local harpoon = require("harpoon")
harpoon:setup()
