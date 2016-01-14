function dotlify
  if [ -z $DOTLIFY_PATH ]
    echo 'environment variable DOTLIFY_PATH must be set'
    return 1;
  end

  if [ (count $argv) = 0 ]
    echo 'must have at least one argument'
    return 1;
  end

  if [ $argv = "link" ]
    __dotlify_link
    return $status
  end

  for arg in $argv
    __dotlify_single $arg

    if [ $status -gt 0 ]
      return $status
    end

    printf "\t%s%s%s => %s%s%s\n" \
      (set_color magenta) $arg (set_color normal) \
      (set_color blue) "$DOTLIFY_PATH/$arg" (set_color normal)
  end
end

function __dotlify_single
  if [ (count $argv) != 1 ]
    echo 'must have exactly one argument'
    return 1;
  end

  if not [ -f $argv -o -d $argv ]
    echo "must be file or directory: $argv"
    return 1;
  end

  set -l arg (echo $argv | sed 's/\/$//')
  set -l dest "$DOTLIFY_PATH/$arg"

  # Make sure destination is empty
  if [ -e $dest ]
    echo "file already exists at: $dest"
    return 1;
  end

  # Backup
  cp -R $arg "$arg~"; or return 1

  # Move it
  mv $arg $dest; or return 1

  # Link it
  ln -s $dest $arg; or return 1

  # All good, remove the backup
  rm -rf "$arg~"
end

function __dotlify_link
  while read link
    if [ -e "$HOME/$link" ]
      if [ -L "$HOME/$link" ]
        printf "\talready linked  $link\n"
      else
        printf "\texists          $link\n"
      end
    else
      printf "\t%slinking         $link%s\n" (set_color magenta) (set_color normal)

      ln -s "$DOTLIFY_PATH/$link" "$HOME/$link"
    end
  end < "$DOTLIFY_PATH/.dotlify-links"
end
