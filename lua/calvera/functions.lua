local toggle_eob = function()
    if vim.g.calvera_hide_eob == nil then
        vim.g.calvera_hide_eob = true
    else
        vim.g.calvera_hide_eob = nil
    end
    vim.cmd [[colorscheme calvera]]
end

return {toggle_eob = toggle_eob}
