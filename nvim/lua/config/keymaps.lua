------------------------------------------------------------------
-- NEOVIM KEYMAPS
-- Daniel Miessler, 2024
-- Credit: Josean, Primagean
------------------------------------------------------------------

-- ESC to "jk"
vim.keymap.set("i", "jk", "<ESC>")

-- Leader
vim.g.mapleader = " "

-- C-c also Escapes (great for escaping visual mode)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Save and source with Leader-w
vim.keymap.set("n", "<leader>p", "<cmd>source % | echo 'File sourced.'<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>w | echo 'File saved.'<CR>", { silent = true })

-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close window

-- Replace word under cursor everywhere
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Separate the nvim and system clipboards
vim.o.clipboard = ""
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true, silent = true })

-- Clear highlights
vim.keymap.set("n", "<leader>c", ":nohl<CR>")

-- Delete single character without yanking
vim.keymap.set("n", "x", '"_x')

-- Copy entire buffer into the system clipboard
vim.api.nvim_set_keymap("n", "<leader>yy", ':lua vim.api.nvim_command("%y+")<CR>', { noremap = true, silent = true })

-- Folds
vim.keymap.set("n", "<leader>wf", "<cmd>mkview | echo 'Folds saved.'<CR>", { silent = true })
vim.keymap.set("n", "<leader>f", "<cmd>loadview | echo 'Folds restored.'<CR>", { silent = true })

-------- CUSTOM COMMANDS -------------

-- Call TELOS for context about a visual selection
vim.api.nvim_set_keymap("x", "<leader>t", ":lua SendVisualSelectionToCommand()<CR>", { noremap = true, silent = true })

function SendVisualSelectionToCommand()
  -- Prompt the user for a question
  local question = vim.fn.input("Enter your question: ")

  -- Capture the visual selection
  vim.api.nvim_command("normal! `<v`>y")

  -- Get the visual selection
  local visual_selection = vim.fn.getreg("0")

  -- Concatenate the question with the visual selection
  local input_data = question .. "\n" .. visual_selection

  -- External command 'explaincode'
  local command = "explaincode"

  -- Send the input data to the external command and capture the output
  local output = vim.fn.system(command, input_data)

  -- Log each line of the output separately using echomsg
  for _, line in ipairs(vim.split(output, "\n")) do
    local escaped_line = line:gsub('"', '\\"')
    vim.cmd('echomsg "' .. escaped_line .. '"')
  end

  -- Exit visual mode and return to normal mode
  vim.cmd("stopinsert")
end
