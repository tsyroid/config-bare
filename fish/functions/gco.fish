# gco - Git Checkout
# vim:ft=fish ts=2 sw=2 et

function gco --wraps='git checkout' -d 'alias gco-git checkout'
    git checkout $argv
end
