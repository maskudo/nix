"Set compatibility to Vim only"
set nocompatible

"Show line numbers "
set number

"Status bar"
set laststatus=2

"wrap text that extends beyond the screen length"
set wrap

"Call the .vimrc.plug file"
if filereadable(expand("~/.vimrc.plug"))
	source ~/.vimrc.plug
endif

