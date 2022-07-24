local Plug = vim.fn['plug#']
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
HOME = os.getenv("HOME")

vim.call('plug#begin', HOME..'/.config/nvim/plugged')

  Plug ('dracula/vim', {['as'] = "dracula"})
  Plug ('vim-airline/vim-airline')
  Plug ('vim-airline/vim-airline-themes')
  Plug ('ryanoasis/vim-devicons')
  Plug ('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
  Plug ('nvim-lua/plenary.nvim')
  Plug ('nvim-telescope/telescope.nvim')
  Plug ('neoclide/coc.nvim', {['branch']= 'release'})
  Plug ('kyazdani42/nvim-web-devicons')
  Plug ('akinsho/bufferline.nvim', { ['tag']= 'v2.*' })
  Plug ('CRAG666/code_runner.nvim')
  Plug ('preservim/nerdcommenter')
  Plug ('mlaursen/vim-react-snippets')
  Plug ('folke/tokyonight.nvim', { ['branch']= 'main' })
  Plug ('kyazdani42/nvim-tree.lua')

vim.call('plug#end')

require("nvim-tree").setup({
  --sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
        --{ key = "<C-e>",                          action = "edit_in_place" },
        --{ key = "O",                              action = "edit_no_picker" },
        --{ key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
        { key = { "<C-]>", "<LeftMouse><RightMouse>" },    action = "cd" },
        { key = "<C-v>",                          action = "vsplit" },
        { key = "<C-x>",                          action = "split" },
        { key = "<C-t>",                          action = "tabnew" },
        --{ key = "<",                              action = "prev_sibling" },
        --{ key = ">",                              action = "next_sibling" },
        --{ key = "P",                              action = "parent_node" },
        --{ key = "<BS>",                           action = "close_node" },
        { key = "<Tab>",                          action = "preview" },
        --{ key = "K",                              action = "first_sibling" },
        --{ key = "J",                              action = "last_sibling" },
        --{ key = "I",                              action = "toggle_git_ignored" },
        { key = ".",                              action = "toggle_dotfiles" },
        --{ key = "U",                              action = "toggle_custom" },
        { key = "R",                              action = "refresh" },
        { key = "a",                              action = "create" },
        { key = "D",                              action = "remove" },
        { key = "d",                              action = "trash" },
        { key = "r",                              action = "rename" },
        { key = "<C-r>",                          action = "full_rename" },
        { key = "x",                              action = "cut" },
        { key = "c",                              action = "copy" },
        { key = "p",                              action = "paste" },
        { key = "y",                              action = "copy_name" },
        { key = "Y",                              action = "copy_path" },
        { key = "gy",                             action = "copy_absolute_path" },
        --{ key = "[e",                             action = "prev_diag_item" },
        --{ key = "[c",                             action = "prev_git_item" },
        --{ key = "]e",                             action = "next_diag_item" },
        --{ key = "]c",                             action = "next_git_item" },
        { key = "-",                              action = "dir_up" },
        { key = "s",                              action = "system_open" },
        { key = "f",                              action = "live_filter" },
        { key = "F",                              action = "clear_live_filter" },
        { key = "q",                              action = "close" },
        { key = "W",                              action = "collapse_all" },
        { key = "E",                              action = "expand_all" },
        --{ key = "S",                              action = "search_node" },
        --{ key = ".",                              action = "run_file_command" },
        { key = "<C-k>",                          action = "toggle_file_info" },
        { key = "g?",                             action = "toggle_help" },
        { key = "m",                              action = "toggle_mark" },
        { key = "bmv",                            action = "bulk_move" },
      }, -- END_DEFAULT_MAPPINGS
    },
  },
  renderer = {
      add_trailing = true,
      group_empty = true,
      highlight_git = false,
      full_name = false,
      root_folder_modifier = ":~",
      indent_markers = {
         enable = true,
         icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
         },
      },
      icons = {
         --webdev_colors = true,
         git_placement = "after",
         padding = " ",
         symlink_arrow = " ➛ ",
         show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
         },
         glyphs = {
            default = "",
            symlink = "",
            bookmark = "",
            folder = {
               arrow_closed = "",
               arrow_open = "",
               default = "",
               open = "",
               empty = "",
               empty_open = "",
               symlink = "",
               symlink_open = "",
            },
            git = {
               unstaged = "✗",
               staged = "✓",
               unmerged = "",
               renamed = "➜",
               untracked = "★",
               deleted = "",
               ignored = "◌",
            },
         },
      },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
  },
  filters = {
    dotfiles = false,
  },
})


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
vim.opt.showmode = false
vim.opt.showcmd = false;
vim.opt.shortmess = vim.opt.shortmess + "F"
vim.o.backup = false
vim.o.swapfile = false
vim.cmd("syntax on")

-- dracula colorscheme
vim.g.dracula_colorterm = 0
vim.cmd("colorscheme dracula")

-- tokyonight colorscheme
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = { hint = "orange", error = "#d30e39" }
vim.g.tokyonight_transparent_sidebar = true
--vim.cmd("colorscheme tokyonight")

-- # custom keybinds #
map ("n", "<F2>", ":set hlsearch!<CR>", {noremap = true})
map ('n',"<leader>sf",":source ~/.config/nvim/init.lua<CR>", {noremap = true})
map ("n", "<leader>h", "<C-w>h", {noremap = true})
map ("n", "<leader>j", "<C-w>j", {noremap = true})
map ("n", "<leader>k", "<C-w>k", {noremap = true})
map ("n", "<leader>l", "<C-w>l", {noremap = true})
map ('v','<',"<gv", opts)
map ('v','>',">gv", opts)
map ("n", "<leader>w", ":w<CR>", opts)
--map ("n", "<leader>q", ":xa<CR>", opts)
map ("n", "<F3>", ":set spell!<CR>", {silent = true})
map ("i", "<F3>", "<C-O>:set spell!<CR>", {silent = true})
map('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

-- ## Bufferline ##
-- Move to previous/next
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferLineMovePrev<CR>', opts)
map('n', '<A->>', ':BufferLineMoveNext<CR>', opts)
-- pin a tab
map('n', '<A-p>', ":BufferLineTogglePin<CR>", opts)
-- BufferLineGoToBuffer
map('n', '<A-1>', "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
map('n', '<A-2>', "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
map('n', '<A-3>', "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
map('n', '<A-4>', "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
map('n', '<A-5>', "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
map('n', '<A-6>', "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
map('n', '<A-7>', "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
map('n', '<A-8>', "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
map('n', '<A-9>', "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
-- closing buffer
map("n",'<A-x>',":bd<CR>", opts)
require("bufferline").setup{}

-- ## code_runner ##
map('n', '<C-n>', ':RunCode<CR>', opts)
-- map('n', '<leader>rf', ':RunFile<CR>', opts)
--map('n', '<leader>n', ':RunFile tab<CR>', opts)
-- map('n', '<leader>rp', ':RunProject<CR>', opts)
map('n', '<leader>x', ':RunClose<CR>', opts)
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
  term = {
      --  Position to open the terminal, this option is ignored if mode is tab
      position = "bot",
      -- window size, this option is ignored if tab is true
      size = 7,
  }
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
  'coc-pairs',
  'coc-pyright'
}
map ("n", "<C-p>", ":call CocAction('format')<CR>", {noremap = true})
map ("i", "<C-space>", "coc#refresh()", {noremap = true, silent = true, expr = true})
map ("i", "<cr>", 'pumvisible() ? "<C-y>" : "<C-g>u<CR>"', {noremap = true, expr = true})
map ("i","<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', {noremap = true, expr = true})
map ("i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', {noremap = true, expr = true})
map ("n","gs",":call CocAction('jumpDefinition', 'vsplit')<CR>",{silent = true})
map ("n","gt",":call CocAction('jumpDefinition', 'tabe')<CR>",{silent = true})

-- ## nerdtree ##
--vim.g.NERDTreeShowHidden = 1
--vim.g.NERDTreeMinimalUI = 1
--vim.g.NERDTreeIgnore = {}
--vim.g.NERDTreeStatusline = ''
--vim.g.NERDTreeWinPos = "right"
--vim.g.NERDTreeQuitOnOpen = 1
--vim.g.NERDTreeAutoDeleteBuffer = 1
--vim.g.NERDTreeDirArrows = 1
--vim.cmd("let g:NERDTreeWinSize = 30")
--vim.api.nvim_set_keymap("n","<leader>e",":NERDTreeToggle<CR>",{noremap = true})

-- ## Telescope ##
map ("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {noremap = true})
map ("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {noremap = true})
map ("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {noremap = true})
map ("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {noremap = true})

-- ## treesitter ##
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "python", "javascript", "html", "css"},

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
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enabled = true
  }
}
