local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
end
require("plugins")
require("utils")
--[[ local folds = require('utils.nekorc')

local autoCommands = {
    -- other autocommands
    open_folds = {
        {"BufReadPost,FileReadPost", "*", "normal zR"}
    }
}

folds.nvim_create_augroups(autoCommands) ]]
