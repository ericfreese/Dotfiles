```fish
#!/usr/bin/env fish
hub clone ericfreese/dotfiles ~/Dotfiles
. ~/Dotfiles/.config/fish/functions/dotlify.fish
set DOTLIFY_PATH ~/Dotfiles
dotlify link
fundle install
```
