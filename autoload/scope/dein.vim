vim9script
scriptencoding utf-8

import autoload 'scope/popup.vim'
export def DeinUpdate()
  var plugins = []
  var nr = 1
  for plugin in items(dein#get())
    plugins->add({text: plugin[1].name, linenr: nr})
    nr += 1
  endfor
  popup.NewFilterMenu("plugins", plugins,
    (res, key) => {
      execute $"call dein#update('{res.text}')"
    },
    (winid, _) => {
      win_execute(winid, $"syn match FilterMenuLineNr '(\\d\\+)$'")
      hi def link FilterMenuLineNr Comment
  })
enddef
