local fzf = require("fzf-lua")

vim.keymap.set('n','<leader>pf', fzf.files, {desc = "find project files"})
vim.keymap.set('n','<leader>pg', fzf.git_files, {desc = "find project files"})
vim.keymap.set('n', '<leader>ps', function()
	fzf.grep({ prompt="Grep>" })
end, {desc = "grep files"})
vim.keymap.set('n', '<leader>fzf', '<CMD>FzfLua<CR>')
