return {
  cmd = { "harper-ls", "--stdio" },
  filetypes = { "markdown", "tex", "text", "gitcommit", "plaintex" },
  root_dir = function(fname)
    return vim.fn.fnamemodify(fname, ":h")
  end,
  settings = {
    ["harper-ls"] = {
      userDictPath = "",
      workspaceDictPath = "",
      fileDictPath = "",
      linters = {
        SpellCheck = true,
        SpelledNumbers = false,
        AnA = true,
        SentenceCapitalization = true,
        UnclosedQuotes = true,
        WrongQuotes = false,
        LongSentences = true,
        RepeatedWords = true,
        Spaces = true,
        Matcher = true,
        CorrectNumberSuffix = true
      },
      codeActions = {
        ForceStable = false
      },
      markdown = {
        IgnoreLinkTitle = false
      },
      diagnosticSeverity = "hint",
      isolateEnglish = false,
      dialect = "American",
      maxFileLength = 120000,
      ignoredLintsPath = "",
      excludePatterns = {}
    }
  }
}
