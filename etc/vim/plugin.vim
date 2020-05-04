set runtimepath+=$HOME/.config/nvim/.vim/dein/repos/github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif

call dein#begin(expand('$HOME/.config/nvim/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim') " 補完
call dein#add('itchyny/lightline.vim') " 情報を見やすく
call dein#add('nathanaelkane/vim-indent-guides') " インデントを色分け
call dein#add('Townk/vim-autoclose') " カッコを自動で閉じる
call dein#add('ujihisa/neco-look') " 英単語の補完
call dein#add('vim-airline/vim-airline') "ステータスバー改造
call dein#add('vim-airline/vim-airline-themes')
call dein#add('flazz/vim-colorschemes') " :colorshemes
call dein#add('rhysd/vim-gfm-syntax') "markdown
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
call dein#add('tpope/vim-fugitive') "git
call dein#add('airblade/vim-gitgutter') "gitdiff
call dein#add('scrooloose/nerdtree')
call dein#end()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" If cannot load plugins, run command below.
" :call dein#recache_runtimepath()
"
function! Airline()
  set laststatus=2
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  let g:airline_theme='angr'
  let g:airline_powerline_fonts = 1
endfunction
call Airline()


function! ColorScheme()
  autocmd ColorScheme * highlight Normal ctermbg=none
  autocmd ColorScheme * highlight LineNr ctermbg=none
  syntax on
  colorscheme Tomorrow-Night-Eighties
  set t_Co=256
endfunction
call ColorScheme()
