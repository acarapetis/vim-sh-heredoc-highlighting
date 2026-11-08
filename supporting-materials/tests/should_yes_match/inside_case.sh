#!/bin/bash
case $lang in
    python)
        # Comment
        cat <<- PYTHON
			def inside_case():
				print(f"This is a herestring {self.attr}")
			inside_case() # Function call
		PYTHON
        ;;
    shell)
        # Comment
		cat <<- SHELL
				var=value
				if [[ bing == bong ]] ; then
				    echo "HOME=$HOME"
				fi
		SHELL
        ;;
esac
