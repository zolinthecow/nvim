return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      -- Disable Supermaven inside any path that starts with one of the
      -- directories listed in `excluded`.
      condition = function()
        -- Full path of the file in the current buffer
        local filename = vim.api.nvim_buf_get_name(0)

        -- Absolute paths to folders where you *don’t* want Supermaven
        local excluded = {
          vim.fn.expand '~/src/personal/cc', -- add more paths here
        }

        for _, dir in ipairs(excluded) do
          -- `vim.startswith` is fast and avoids pattern-matching pitfalls
          if vim.startswith(filename, dir) then
            return true -- ← disable for this buffer
          end
        end
        return false -- ← enable everywhere else
      end,
    }
  end,
}
