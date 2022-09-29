local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
end
require("plugins")
require("utils")
local folds = require('utils.nekorc')

local autoCommands = {
    -- other autocommands
    open_folds = {
        { "BufReadPost,FileReadPost", "*", "normal zR" }
    }
}
vim.diagnostic.config({
    virtual_text = true,
})

folds.nvim_create_augroups(autoCommands)

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = '#88C0D0', underline = true })
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "term://*",
    command = "setlocal nonumber norelativenumber signcolumn=no | setfiletype terminal",
})

