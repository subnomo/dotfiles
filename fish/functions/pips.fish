function pips
	pip install $argv[1]
    set package (pip freeze | grep -i $argv[1])
    echo $package >> ./requirements.txt
end
