" コメントを緑にする
hi Comment ctermfg=green

" Solarized Darkの設定
colorscheme solarized
syntax enable
let g:solarized_termcolors=256
set background=light

"vv で行末まで選択
vnoremap v ^$h

"行番号を常に表示
set number

"大文字小文字の区別なし
set ignorecase
 
"検索時に大文字を含んでいたら大/小を区別
set smartcase

"x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" 0を_にする
noremap 0 _

" 矢印キーを無効にする
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop> 

set clipboard+=unnamed
set backspace=indent,eol,start
