# Creates symlinks to dotfiles here.
# If a target file alread exists it will
#  NOT be overwritten, but will need to be
#  removed manually.
echo "Creating links to dotfiles..."
while read p; do
  ln -s $(pwd)/$p ~/
done < dotfiles
