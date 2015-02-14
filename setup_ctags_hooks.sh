#!/bin/sh
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template/hooks

rm ~/.git_template/hooks/ctags
rm ~/.git_template/hooks/post-commit
rm ~/.git_template/hooks/post-merge
rm ~/.git_template/hooks/post-checkout
rm ~/.git_template/hooks/post-rewrite

cp ./hooks/ctags/ctags ~/.git_template/hooks/ctags
cp ./hooks/ctags/post-commit ~/.git_template/hooks/post-commit
cp ./hooks/ctags/post-merge ~/.git_template/hooks/post-merge
cp ./hooks/ctags/post-checkout ~/.git_template/hooks/post-checkout
cp ./hooks/ctags/post-rewrite ~/.git_template/hooks/post-rewrite

chmod 755 ./hooks/ctags/ctags
chmod 755 ./hooks/ctags/post-commit
chmod 755 ./hooks/ctags/post-merge
chmod 755 ./hooks/ctags/post-checkout
chmod 755 ./hooks/ctags/post-rewrite
