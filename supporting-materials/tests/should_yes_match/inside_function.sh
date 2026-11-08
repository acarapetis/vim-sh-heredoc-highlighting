#!/usr/bin/env bash

my_func(){
    # Comment
    cat <<- PYTHON
		def inside_case():
			print(f"This is a herestring {self.attr}")
		inside_case() # Function call
	PYTHON

    # Comment
	cat <<- SHELL
			var=value
			if [[ bing == bong ]] ; then
			    echo "HOME=$HOME"
			fi
	SHELL
}
