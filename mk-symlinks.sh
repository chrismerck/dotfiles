echo "Creating links to dotfiles..."
while read p; do
  ln -s $(pwd)/$p ~/$p
done < dotfiles
