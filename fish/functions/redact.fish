function redact --description 'Disable history for the current session'
    # Do not continue if there is an existing backup file
    test -f $__fish_history_backup_file; and return
    # Keep track of the pid responsible for disabling history
    echo %self > $__fish_history_pid_file
    # Redirect history to /dev/null
    mv -f -- $__fish_history_file $__fish_history_backup_file
    and ln -sf -- /dev/null $__fish_history_file
end
