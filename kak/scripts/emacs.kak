# <left>, <c-b>
#     move cursor to previous character
map global insert '<c-b>' '<a-;>h'

# <right>, <c-f>
#     move cursor to next character
map global insert '<c-f>' '<a-;>l'

# <home>, <c-a>
#     move cursor to first character
map global insert '<c-a>' '<a-;>gi'

# <end>, <c-e>
#     move cursor past the last character
map global insert '<c-e>' '<a-;>x<a-;>;'

# <backspace>, <c-h>
#     erase character before cursor
map global insert '<c-h>' '<a-;>h<a-;>d'

# <del>, <c-d>
#     erase character under cursor
map global insert '<c-d>' '<a-;>d'

# <a-f>
#     advance to next word begin
map global insert '<a-f>' '<a-;>w<a-;>;'

# <a-F>
#     advance to next WORD begin
map global insert '<a-F>' '<a-;><a-w><a-;>;'

# <a-b>
#     go back to previous word begin
map global insert '<a-b>' '<a-;>b<a-;>;'

# <a-B>
#     go back to previous WORD begin
map global insert '<a-B>' '<a-;><a-b><a-;>;'

# <a-e>
#     advance to next word end
map global insert '<a-e>' '<a-;>e<a-;>;'

# <a-E>
#     advance to next WORD end
map global insert '<a-E>' '<a-;><a-e><a-;>;'

# <a-backspace>, <c-w>, <c-backspace>
#     erase to previous word begin, save erased content to clipboard
map global insert '<c-w>' '<a-;>b<a-;>d'
map global insert '<c-backspace>' '<a-;>b<a-;>d' 
map global insert '<a-backspace>' '<a-;>b<a-;>d'

# <c-W>
#     erase to previous WORD begin, save erased content to clipboard
map global insert '<c-W>' '<a-;><a-b><a-;>d'

# <a-d>
#     erase to next word begin, save erased content to clipboard
map global insert '<a-d>' '<a-;>w<a-;>d'

# <a-D>
#     erase to next WORD begin, save erased content to clipboard
map global insert '<a-D>' '<a-;><a-w><a-;>d'

# <c-k>
#     erase to end of line, save erased content to clipboard
map global insert '<c-k>' '<a-;><a-l><a-;>d'

# <c-u>
#     erase to begin of line, save erased content to clipboard
map global insert '<c-u>' '<a-;><a-h><a-;>d'

# <c-y>
#     insert clipboard content before cursor
map global insert '<c-y>' '<a-;>P'

# <up>, <c-p>
#     select previous entry in history
map global insert '<c-p>' '<a-;>k'

# <down>, <c-n>
#     select next entry in history
map global insert '<c-n>' '<a-;>j'

# <a-`>
#     toggle char case
map global insert '<a-`>' '<a-;><a-`>'

