function __sk_reverse_isearch
    history merge
    history -z | eval (__skcmd) --read0 --tiebreak=index --toggle-sort=ctrl-r $SKIM_DEFAULT_OPTS $SKIM_REVERSE_ISEARCH_OPTS -q '(commandline)' | perl -pe 'chomp if eof' | read -lz result
    and commandline -- $result
    commandline -f repaint
end
