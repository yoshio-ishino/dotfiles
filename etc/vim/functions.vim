function! Setnumber()
  if &number
    setlocal nonumber
  else
    setlocal number
  endif
endfunction


function! Pastemode()
  if &paste
    setlocal nopaste
  else
    setlocal paste
  endif
endfunction


function! PrevimOpen(browser)
  let g:previm_open_cmd = a:browser
  let g:previm_wsl_mode = 1
endfunction
call PrevimOpen('/c/Program\ Files\/BraveSoftware/Brave-Browser/Application/brave.exe')


function! NERDTree()
    if g:NERDTree.IsOpen()
        :NERDTreeClose
    else
        :NERDTreeFocus
    endif
endfunction


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
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')


nnoremap <silent> <C-b> :vs term://bash<CR>
nnoremap <silent> <C-n> :call Setnumber()<CR>
nnoremap <silent> <C-p> :call Pastemode()<CR>
nnoremap j gj
nnoremap k gk
nnoremap <silent> <C-f> :call NERDTree()<CR>
tnoremap <silent> <ESC> <C-\><C-n>

nmap <Esc><Esc> :nohlsearch<CR>
