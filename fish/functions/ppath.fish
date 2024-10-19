# ppath - Pretty Print Path
# vim:ft=fish ts=2 sw=2 et

function ppath -d 'Pretty Print Path'
    command printf '%s\n' $PATH
end
