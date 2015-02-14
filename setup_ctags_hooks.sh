#!/bin/sh
git config --global init.templatedir '~/.git_template'
mkdir -p ~/.git_template/hooks
ln -s ./hooks/ctags/ctags ~/.git_template/hooks/ctags
ln -s ./hooks/ctags/post-commit ~/.git_template/hooks/post-commit
ln -s ./hooks/ctags/post-merge ~/.git_template/hooks/post-merge
ln -s ./hooks/ctags/post-checkout ~/.git_template/hooks/post-checkout
ln -s ./hooks/ctags/post-rewrite ~/.git_template/hooks/post-rewrite
