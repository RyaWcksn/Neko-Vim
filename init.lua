local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
    impatient.enable_profile()
end

require("mappings")
require("options")
require("plugins")
vim.opt.fillchars = { eob = " " }
