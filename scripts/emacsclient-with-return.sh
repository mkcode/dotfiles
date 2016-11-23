#!/bin/sh

# Switch to emacs and wait for editing to be completed.
emacsclient -c $@

# Switch back to window from which emacsclient was invoked.
open -a "iTerm"
