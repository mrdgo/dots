augroup FormatAutogroup
  autocmd!
  autocmd BufWritePre *.ts EslintFixAll
augroup END
