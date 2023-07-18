local opt = vim.opt -- for conciseness

-- Numbering of the lines
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Line wrapping
opt.wrap = false

-- Search setting
opt.ignorecase = true
opt.smartcase = true

-- Cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"
-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- Clipboard 
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- End Of Buffer Character * Thanks Katie :3c *
opt.fillchars:append { eob = "󰄛" }