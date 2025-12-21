return {
  cmd = "gopls",
  root_markers = { "go.mod", "go.work" },
  filetypes = { "go" },
  settings = {
    gopls = {
      hints = {
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        ignoredError = true,
        parameterNames = true,
      },
    },
  },
}
