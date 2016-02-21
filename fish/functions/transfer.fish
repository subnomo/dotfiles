function transfer
	set tempfile (mktemp -t transferXXX)
    curl --progress-bar --upload-file $argv[1] https://transfer.sh/(basename $argv[1]) >> $tmpfile
    cat $tmpfile
    rm -f tmpfile
end
