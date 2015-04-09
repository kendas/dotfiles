"" General                                                                                                                                                 ~/.dotfiles
set nocompatible                        " no compatibility with vi
syntax enable
set number                              " show line numbers
set showcmd                             " show incomplete commands
filetype plugin indent on               " load file type plugins + indentation

"" Whitespace-related
set backspace=indent,eol,start          " backspace deletes everything
set nowrap                              " doesn't wrap lines
set tabstop=4 shiftwidth=4              " tab width is 4

"" Search-related
set incsearch				" searching is incremental
set hlsearch				" highlight search matches
