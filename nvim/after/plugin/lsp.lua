local lsp = require('lsp-zero')
local lsp_config = require('lspconfig')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'tsserver',
        'eslint',
        'lua_ls',
        'rust_analyzer',
        'yamlls',
    },
    handlers = {
        lsp.default_setup,
        lsp_config.lua_ls.setup(lsp.nvim_lua_ls()),
    },
})

-- https://www.reddit.com/r/neovim/comments/pob6wx/setting_up_nvimcmp/
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,

            preset = 'codicons',
            ellipsis_char = '...',

            before = function(_, vim_item)
                return vim_item
            end
        })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- when using "gd" to go to definition you can use <C-o> (control + o) to
    -- return to your last position
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) --untested
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)     --untested
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)              --untested
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)              --untested
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)      --untested
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)       --untested
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)           --untested
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)         --untested
end)

lsp.setup()
