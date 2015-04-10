"" General
set nocompatible                        " no compatibility with vi
syntax enable
set number                              " show line numbers
set showcmd                             " show incomplete commands
filetype plugin indent on               " load file type plugins + indentation

"" Pathogen
execute pathogen#infect()

"" Whitespace-related
set backspace=indent,eol,start          " backspace deletes everything
set nowrap                              " doesn't wrap lines
set tabstop=4 shiftwidth=4              " tab width is 4

"" Search-related
set incsearch							" searching is incremental
set hlsearch							" highlight search matches

"" Color-scheme
set background=dark
colorscheme solarized

"" Django
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 	" Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 				" Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 			" Completion for programming language's keyword
let g:ycm_complete_in_comments = 1					" Completion in comments
let g:ycm_complete_in_strings = 1					" Completion in string

" Ultisnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" 		"List possible snippets based on current file

" Taglist
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



