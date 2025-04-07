local enabled = true
local augroup_id = vim.api.nvim_create_augroup("blu.auto-format", {})

vim.api.nvim_create_autocmd({"BufWritePost"}, {
  group = augroup_id,
  pattern = { "*.py" },
  callback = function()
    if enabled then
      vim.cmd("silent !black --quiet %")
      vim.cmd("edit")
    end
  end
})

vim.api.nvim_create_user_command("ToggleAutoFmt", function ()
  enabled = not enabled
end, {})

vim.api.nvim_create_user_command("EnableAutoFmt", function ()
  enabled = true
end, {})

vim.api.nvim_create_user_command("DisableAutoFmt", function ()
  enabled = false
end, {})

