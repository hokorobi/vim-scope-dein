vim9script
scriptencoding utf-8

import autoload 'scope/popup.vim'
export def DeinUpdate()
  var plugins = []
  for plugin in values(dein#get())
    plugins->add({text: plugin.name})
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
