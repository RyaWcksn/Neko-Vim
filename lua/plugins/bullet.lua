  require("org-bullets").setup {
    symbols = { "◉", "○", "✸", "✿" },
    symbols = function(default_list)
      table.insert(default_list, "♥")
      return default_list
    end
  }
