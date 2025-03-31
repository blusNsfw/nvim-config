vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent dir" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<M-p>", "\"+p")
vim.keymap.set("n", "<M-S-p>", "\"+P")
vim.keymap.set("v", "<leader>pp", "\"+p")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<CMD>cnext<CR>zz")
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<C-j>", "<CMD>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<CMD>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<CMD>lprev<CR>zz")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")

vim.keymap.set("n", "<C-c>", "<CMD>noh<CR>")

do
  -- fzf
  local fzf = require("fzf-lua")
  vim.keymap.set('n','<leader>pf', fzf.files, {desc = "find project files"})
  vim.keymap.set('n','<leader>pg', fzf.git_files, {desc = "find project files"})
  vim.keymap.set('n','<leader>pp', fzf.live_grep, {desc = "find project files"})
  vim.keymap.set('n', '<leader>pd', fzf.diagnostics_document)
  vim.keymap.set('n', '<leader>pD', fzf.diagnostics_workspace)

  vim.keymap.set('n', '<leader>ph', function ()
    fzf.files({
      cwd="$HOME",
      hidden = false,
      actions = {
        ["alt-i"] = fzf.actions.toggle_hidden
      },
    })
  end, {desc = "Search from home directory"})

  vim.keymap.set('n', '<leader>ps', function()
    fzf.grep({ prompt="Grep>" })
  end, {desc = "grep files"})
  vim.keymap.set('v', '<C-p><C-p>', '<CMD>FzfLua grep_visual<CR>')

  vim.keymap.set('n', '<leader>fk', fzf.builtin, {desc = "FzfLua built in commands"})
  vim.keymap.set('n', '<leader>fb', fzf.buffers, {desc = "search current buffers"})
  vim.keymap.set('n', '<leader>fm', fzf.manpages, {desc = "fuzzy man pages"})
  vim.keymap.set('n', '<leader>fc', fzf.lgrep_quickfix, {desc = "live grep quickfix list"})
  vim.keymap.set('n', '<leader>fl', fzf.lgrep_loclist, {desc = "live grep loclist"})
  vim.keymap.set('n', '<leader>ft', fzf.btags)
  vim.keymap.set('n', '<leader>fT', fzf.tags)
  vim.keymap.set('v', '<leader>ft', fzf.tags_grep_visual)

  vim.keymap.set({"n", "v","i" }, "<C-x><C-f>", fzf.complete_path, {silent=true, desc = "Fuzzy complete file"})
  vim.keymap.set("i", "<C-x><C-f>", function()
    fzf.complete_file({
    cmd = "rg --files",
    winopts = { preview = { hidden = true } }
  })
end,
  { silent = true, desc = "Fuzzy complete file" })
end

do
  -- gitsigns
  local gitsigns = require("gitsigns")
  gitsigns.setup{
    on_attach = function(bufnr)
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({']c', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end)

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({'[c', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end)

      --Actions
      map('n', '<leader>hs', gitsigns.stage_hunk)
      map('n', '<leader>hr', gitsigns.reset_hunk)

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end)

      map('n', '<leader>hS', gitsigns.stage_buffer)
      map('n', '<leader>hR', gitsigns.reset_buffer)
      map('n', '<leader>hp', gitsigns.preview_hunk)
      map('n', '<leader>hi', gitsigns.preview_hunk_inline)

      map('n', '<leader>hb', function()
        gitsigns.blame_line({ full = true })
      end)

      map('n', '<leader>hd', gitsigns.diffthis)

      map('n', '<leader>hq', gitsigns.setqflist)
      map('n', '<leader>hQ', function()
        gitsigns.setqflist('all')
      end)
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
      map('n', '<leader>td', gitsigns.toggle_deleted)
      map('n', '<leader>tw', gitsigns.toggle_word_diff)

      map({'o', 'x'}, 'ih', gitsigns.select_hunk)
    end
  }
end

-- User commands
vim.keymap.set({'n', 't'}, '<leader>TT', "<CMD>ToggleFloatTerm<CR>", {})
