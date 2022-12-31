set number
set tabstop=4
set shiftwidth=4
set expandtab
set encoding=UTF-8
set smartindent
set cursorline
set showmatch
set showcmd
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set visualbell "ビープ音を可視化
set wildmode=list:longest "コマンドラインの補完
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set incsearch "検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索語をハイライト表示
set nobackup "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set autoread "編集中のファイルが変更されたら自動で読み直す
set hidden "バッファが編集中でもその他のファイルを開けるように


let g:python_host_prog = expand('python')
let g:python3_host_prog = expand('~/.pyenv/shims/python3')

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

autocmd BufNewFile *.md 0r $HOME/dotfiles/etc/vim/template/md.txt
autocmd BufNewFile *.sh 0r $HOME/dotfiles/etc/vim/template/sh.txt
