return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  on_init = function(client)
    client.server_capabilities.diagnosticProvider = false
    client.server_capabilities.publishDiagnostics = false
  end,
  -- We also manually clear the capabilities just to be safe
  capabilities = (function()
    local caps = vim.lsp.protocol.make_client_capabilities()
    caps.textDocument.publishDiagnostics = false
    return caps
  end)(),
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'off',
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        diagnosticSeverityOverrides = {
          reportInvalidTypeForm = "none",
          reportMissingImports = "none",
          reportUndefinedVariable = "none",
          reportGeneralTypeIssues = "none",
        },
      },
    },
  },
}
