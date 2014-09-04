echo "Creating links to dotfiles..."
while read p; do
  ln -s -T $(pwd)/$p ~/$p
done < dotfiles
