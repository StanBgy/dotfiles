return {
 cmd = {'ltex-ls-plus'},
 filetypes = {'tex', 'markdown'},
 settings = {
    ltex = {
      language = "en-US",
      additionalRules = {
        enablePickyRules = true,
        motherTongue = "en-US",
      },
      checkTarget = "latex",
      diagnosticSeverity = "information",
      
      latex = {
        commands = {
          ["\\cite{}"] = "ignore",
          ["\\citep{}"] = "ignore",
          ["\\citet{}"] = "ignore",
          ["\\ref{}"] = "ignore",
          ["\\eqref{}"] = "ignore",
          ["\\url{}"] = "ignore",
        },
        environments = {
          ["equation"] = "ignore",
          ["displaymath"] = "ignore",
          ["lstlisting"] = "ignore",
          ["tabular"] = "ignore",
        },
      },
    },
  },
}
