local defaults = require('options')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    local widths = setmetatable({}, {
        __index = function(_, _)
            return defaults["tabstop"] or 2;
        end
    })

    widths["c"] = 4
    widths["cpp"] = 4
    widths["lua"] = 4
    widths["groovy"] = 4
    widths["rust"] = 4

    vim.opt_local.shiftwidth = widths[ft]
    vim.opt_local.softtabstop = widths[ft]
    vim.opt_local.tabstop = widths[ft]
  end
})
