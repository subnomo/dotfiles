function qgp
	set out (basename "$PWD")
    g++ $argv -o $out -std=c++11
    eval ./$out
end
