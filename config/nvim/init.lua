local Plug = vim.fn['plug#']
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
HOME = os.getenv("HOME")

vim.call('plug#begin', HOME..'/.config/nvim/plugged')

  Plug ('dracula/vim', {['as'] = "dracula"})
  Plug ('vim-airline/vim-airline')
  Plug ('vim-airline/vim-airline-themes')
  Plug ('scrooloose/nerdtree')
  Plug ('ryanoasis/vim-devicons')
  Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
  Plug ('nvim-lua/plenary.nvim')
  Plug ('nvim-telescope/telescope.nvim')
  Plug ('neoclide/coc.nvim', {['branch']= 'release'})
  Plug ('kyazdani42/nvim-web-devicons')
  Plug ('akinsho/bufferline.nvim', { ['tag']= 'v2.*' })
  Plug ('CRAG666/code_runner.nvim')
  Plug ('preservim/nerdcommenter')

vim.call('plug#end')

vim.cmd("filetype plugin on")
if os.getenv("TERM") == "alacritty" then
    vim.cmd("set ttymouse=sgr")
end
if vim.fn.has("termguicolors") then
  vim.opt.termguicolors = true
end

-- ## Misc ##
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.opt.clipboard = vim.opt.clipboard + 'unnamedplus'
vim.o.background = 'dark'
vim.o.number = true
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.mouse = 'a'
vim.o.incsearch = true
vim.opt.hlsearch = false
vim.cmd("syntax on")
vim.cmd("colorscheme dracula")
vim.opt.showmode = false
vim.opt.showcmd = false;
vim.opt.shortmess = vim.opt.shortmess + "F"
-- # custom keybinds #
map ("n", "<F2>", ":set hlsearch!<CR>", {noremap = true})
map ('n',"<leader>sf",":source ~/.config/nvim/init.lua<CR>", {noremap = true})
map ("n", "<leader>h", "<C-w>h", {noremap = true})
map ("n", "<leader>j", "<C-w>j", {noremap = true})
map ("n", "<leader>k", "<C-w>k", {noremap = true})
map ("n", "<leader>l", "<C-w>l", {noremap = true})


-- ## Bufferline ##
-- Move to previous/next
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferLineMovePrev<CR>', opts)
map('n', '<A->>', ':BufferLineMoveNext<CR>', opts)
-- pin a tab
map('n', '<A-p>', ":BufferLineTogglePin<CR>", opts)
require("bufferline").setup{}

-- ## code_runner ##
map('n', '<C-n>', ':RunCode<CR>', opts)
-- map('n', '<leader>rf', ':RunFile<CR>', opts)
-- map('n', '<C-m', ':RunFile tab<CR>', opts)
-- map('n', '<leader>rp', ':RunProject<CR>', opts)
-- map('n', '<leader>rc', ':RunClose<CR>', opts)
-- map('n', '<leader>crf', ':CRFiletype<CR>', opts)
-- map('n', '<leader>crp', ':CRProjects<CR>', opts)

require('code_runner').setup({
  -- put here the commands by filetype
  filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt"
	},
})

-- ## ariline ##
vim.g.airline_theme= 'base16_dracula'

-- ## COC ##
vim.g.coc_global_extensions = {
  'coc-emmet',
  'coc-css',
  'coc-html',
  'coc-json',
  'coc-prettier',
  'coc-tsserver',
  'coc-clangd',
  'coc-eslint',
  'coc-pairs'
}
map ("n", "<C-p>", ":call CocAction('format')<CR>", {noremap = true})
map ("i", "<C-space>", "coc#refresh()", {noremap = true, silent = true, expr = true})
map ("i", "<cr>", 'pumvisible() ? "<C-y>" : "<C-g>u<CR>"', {noremap = true, expr = true})
map ("i","<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', {noremap = true, expr = true})
map ("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', {noremap = true, expr = true})

-- ## NERDTree ##
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {}
vim.g.NERDTreeStatusline = ''
vim.api.nvim_set_keymap("n","<leader>w",":NERDTreeToggle<CR>",{noremap = true})

-- ## Telescope ##
map ("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
map ("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true})
map ("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
map ("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap = true})


-- ## treesitter ##
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "python", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

