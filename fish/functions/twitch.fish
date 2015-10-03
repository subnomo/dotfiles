function twitch
    livestreamer "twitch.tv/"$argv[1] source &
    chromium --app="http://www.twitch.tv/"$argv[1]"/chat?popout=" &
end
