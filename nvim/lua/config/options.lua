------------------------------------------------------------------
-- NEOVIM CONFIGS
-- Daniel Miessler, 2024
-- Credit: Josean, Primagean
------------------------------------------------------------------

-- Line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvimundo/"

-- Better scrolling visibility
vim.opt.scrolloff = 8

-- Signcolumn
vim.opt.signcolumn = "yes:1"

-- Width Indicator
vim.opt.colorcolumn = "80"

-- Cursor Line
vim.opt.cursorline = true

-- Windows preferences
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Cursor Update Time
vim.opt.updatetime = 150

-- Folds
vim.opt.foldmethod = "manual"
vim.o.viewdir = os.getenv("HOME") .. "/.folds"
vim.fn.mkdir(vim.o.viewdir, "p")
