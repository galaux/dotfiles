export LESS_TERMCAP_mb=${BLINK}                 # begin blinking

# headers and important words
export LESS_TERMCAP_md=${FG_BLUE}               # begin bold
export LESS_TERMCAP_me=${RESET_ALL}             # end mode

# highlighted searches and bottom bar
export LESS_TERMCAP_so=${BG_YELLOW}${FG_BLACK}  # begin standout-mode - info box
export LESS_TERMCAP_se=${RESET_ALL}             # end standout-mode

# parameters of options
export LESS_TERMCAP_us=${FG_GREEN}              # begin underline
export LESS_TERMCAP_ue=${RESET_ALL}             # end underline

# TODO WTF are these?
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
