" env parameters
let g:python_host_prog = expand('python')
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

if &compatible
    set nocompatible
endif
    set runtimepath+=$HOME/.config/nvim/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('$HOME/.config/nvim/.vim/dein'))
call dein#add('Shougo/dein.vim')

" ========================== plugins ===============================
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

" 未インストールのプラグインをインストール
if dein#check_install()
    call dein#install()
endif

"--------------Airline 2018/01/22--------------
set laststatus=2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='angr'
let g:airline_powerline_fonts = 1

"------------------基本設定--------------------
set encoding=UTF-8
set shiftwidth=2
set nobackup "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set autoread "編集中のファイルが変更されたら自動で読み直す
set hidden "バッファが編集中でもその他のファイルを開けるように
set showcmd "入力中のコマンドをステータスに表示する

"--------------------------- View ----------------------------------
"set listchars+=space:.
"set list
set fillchars=vert:\|

set number "行番号を表示
"set cursorcolumn "現在の行を強調表示（縦）
set cursorline "現在の行を強調表示（縦）
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set smartindent "インデントはスマートインデント
set visualbell "ビープ音を可視化
set showmatch "括弧入力時の対応する括弧を表示
set wildmode=list:longest "コマンドラインの補完
nnoremap j gj
nnoremap k gk

"---------------------- ColorScheme -------------------------------
"ターミナルの背景色とvimの背景色を合わせる
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
syntax on
colorscheme Tomorrow-Night-Eighties
set t_Co=256

"-------------------------- Tab -----------------------------------
set tabstop=2
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch "検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索語をハイライト表示
nmap <Esc><Esc> :nohlsearch<CR>

" ======================== keybinds =============================

" NERDTree
nnoremap <silent> <C-m> :execute 'NERDTree'<CR>

"set/off number 2018/01/31
function Setnumber()
    if &number
      setlocal nonumber
    else
      setlocal number
    endif
endfunction
nnoremap <silent> <C-n> :call Setnumber()<CR>

" ======================= vim templates =========================
autocmd BufNewFile *.md 0r $HOME/dotfiles/etc/vim_template/md.txt
autocmd BufNewFile *.sh 0r $HOME/dotfiles/etc/vim_template/sh.txt

" Stop autoindent when paste.
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" python
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line

" PrevimOpen
let g:previm_open_cmd = '/c/Program\ Files\ \(x86\)/BraveSoftware/Brave-Browser/Application/brave.exe'
let g:previm_wsl_mode = 1
