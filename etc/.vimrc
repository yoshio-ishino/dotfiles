source $HOME/dotfiles/etc/vim/env.vim
source $HOME/dotfiles/etc/vim/plugin.vim
source $HOME/dotfiles/etc/vim/functions.vim


nnoremap <silent> <C-n> :call Setnumber()<CR>
nnoremap <silent> <C-p> :call Pastemode()<CR>
nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-f> :call NERDTree()<CR>

nmap <Esc><Esc> :nohlsearch<CR>
