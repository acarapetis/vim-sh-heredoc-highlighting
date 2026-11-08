cat <<- PYTHON
    class HereDoc:
        def __init__(self, heredoc):
            self.heredoc = heredoc
        def show(self)
            print(f'The heredoc is {self.heredoc}')
    hd = HereDoc()
    hd.show()
wxyz	PYTHON

# This should not be highlighted as shell since the above heredoc has random
# characters before the end marker.
var=value
