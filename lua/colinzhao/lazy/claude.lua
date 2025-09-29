return {
  dir = vim.fn.stdpath 'config' .. '/lua/nvim-claude',
  name = 'nvim-claude',
  config = function()
    require('nvim-claude').setup {
      provider = {
        name = 'codex',
        codex = {
          spawn_command = 'codex --search --model=gpt-5-codex -c model_reasoning_effort="high" --sandbox workspace-write -c sandbox_workspace_write.network_access=true',
        },
      },
    }
  end,
  dependencies = {
    'nvim-telescope/telescope.nvim', -- For agent picker
    'tpope/vim-fugitive', -- Already installed, for diffs
    'sindrets/diffview.nvim', -- For advanced diff viewing
    'axkirillov/unified.nvim', -- For unified diff view with fine-grained hunk staging
  },
}
