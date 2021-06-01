## Vim Shortcuts

#### Navigation

`gg` `G` - go to top/bottom of the file

`}` `{` - move down/up to the next code block, add `n` ahead to go down/up `n` code block

`w` `b`- move to the start of the next/previous word

`W` `B` - move to the start of the next/previous word (ignore punctuation)

`fx` - jump to next occurrence of character x

`tx` - jump to before next occurrence of character x

`Fx` - jump to previous occurence of character x

`Tx` - jump to after previous occurence of character x

`:n` - go to `n` line 

`0` `$` - go to beginning/end of the line (when there are indentations at the beginning, use `0w`)

`%` - move to match character (default supported pairs: '()', '[]', '{}'), can combine with other command like `d` to delete words in side the matching character

#### Modification
`cw` - change(replace) to the end of the word

`cc` - change(replace) entire line

`C` - change(replace) to the end of the line

`u` `ctrl+r` - undo/redo

`d` `dd` - delete/delete the whole line 

`y` `yy` - copy/copy the whole line

`o` `O` - insert a line down/up and enter insert mode

#### Visual Mode

`V` - enter visual mode

`.` - repeat the previous command
