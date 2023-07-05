-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "csharp_ls" })
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--     return server ~= "omnisharp"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B2Ny
lvim.plugins = {
  -- theme
  { "navarasu/onedark.nvim" },
  { "ellisonleao/gruvbox.nvim" },

  { "christoomey/vim-tmux-navigator" },
}

lvim.colorscheme = "gruvbox"
lvim.transparent_window = false

lvim.format_on_save = true
vim.opt.autoread = true

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.colorcolumn = "120"

vim.opt.timeoutlen = 500

-- RESOLVE OMNISHARP_BUG
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Fix startup error by disabling semantic tokens for omnisharp",
  group = vim.api.nvim_create_augroup("OmnisharpHook", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client.name == "omnisharp" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
