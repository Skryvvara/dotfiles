local theme = {
    fill = 'TabLineFill',
    -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    head = 'TabLine',
    current_tab = 'TabLineSel',
    inactive_tab = 'TabLineIn',
    tab = 'TabLine',
    win = 'TabLine',
    tail = 'TabLine',
}

function tab_modified(tab)
    local wins = require("tabby.module.api").get_tab_wins(tab)
    for _, x in pairs(wins) do
        if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
            return ""
        end
    end
    return ""
end

function lsp_diag(buf)
    return vim.bo[buf].modified and "" or ""
end

require('tabby.tabline').set(function(line)
    return {
        {
            --{ '  ', hl = theme.head },
            { '  ', hl = theme.head },
            line.sep('', theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            local icon = line.wins_in_tab(tab.id).wins[1].file_icon()

            return {
                line.sep('', hl, theme.fill),
                --tab.is_current() and '' or '',
                tab.number(),
                --"",
                icon,
                tab.name(),
                --tab.close_btn(''),
                --"",
                tab_modified(tab.id),
                line.sep('', hl, theme.fill),
                hl = hl,
                margin = ' ',
            }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
                line.sep('', theme.win, theme.fill),
                win.file_icon(),
                win.buf_name(),
                lsp_diag(win.buf().id),
                line.sep('', theme.win, theme.fill),
                hl = theme.win,
                margin = '  ',
            }
        end),
        {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
        },
        hl = theme.fill,
    }
end)
