# vim: ft=csh

# sl=        non-matching selected lines
# cx=        non-matching context lines
# mt=01;31   match
# ms=01;31   match in selected line
# mc=01;31   match in context line
# fn=35      file name
# ln=32      line no.
# bn=32      byte offsets
# se=36      separaters (:, ---)

#GREP_COLORS="rv:38;5;230:sl=38;5;240:cx=38;5;100:mt=33;1;38;5;161:fn=38;5;197:ln=38;5;212:bn=38;5;44:se=38;5;166"
#GREP_COLORS="rv:mt=1;31:sl=1;30"
GREP_COLORS="rv:mt=1;33:se=37:ln=34:fn=32"

# LS_COLORS=
#  di=1;34
#  ln=1;36
#  pi=1;33
#  bd=44;37
#  cd=44;37
#  or=7;36
#  so=33
#  su=1;31
#  sg=31
#  tw=1;35
#  ow=0;34
#  ex=1;32
#  mi=31

# LS_COLORS="di=1;34    ln=1;36 pi=1;33     bd=44;37 cd=44;37 or=7;36     so=33 su=1;31 sg=31 tw=1;35          ow=0;34          ex=1;32          mi=31"
# LS_COLORS="di=38;5;30 ln=1;36 pi=38;5;126 bd=44;37 cd=44;37 or=38;5;160 so=33 su=1;31 sg=31 tw=33;1;38;5;208 ow=33;1;38;5;208 ex=33;1;38;5;148 mi=38;5;124 st=1;38;5;208"

#if tty | grep -F '/dev/tty' > /dev/null
#if echo $TERM | grep 256 > /dev/null
#then
#LS_COLORS="di=1;38;5;30:ln=1;34:pi=38;5;126:bd=44;37:cd=44;37:or=7;36:so=33:su=1;35:sg=31:tw=33;1;38;5;208:ow=33;1;38;5;208:ex=33;1;38;5;148:mi=38;5;124:st=1;38;5;208"
#else
#LS_COLORS="di=1;34:ln=1;36:pi=1;33:bd=44;37:cd=44;37:or=7;36:so=33:su=1;31:sg=31:tw=1;35:ow=0;34:ex=1;32:mi=31"
#fi

export GREP_COLORS

# no                NORMAL, NORM                Global default, although everything should be something
# fi                FILE                        Normal file
# di                DIR                         Directory
# ln                SYMLINK, LINK, LNK          Symbolic link. If you set this to ‘target’ instead of a numerical value, the color is as for the file pointed to.
# pi                FIFO, PIPE                  Named pipe
# do                DOOR                        Door
# bd                BLOCK, BLK                  Black device
# cd                CHAR, CHR                   Character device
# or                ORPHAN                      Symbolic link pointing to a non-existent file
# so                SOCK                        Socket
# su                SETUID                      File that is setuid (u+s)
# sg                SETGID                      File that is setgid (g+s)
# tw                STICKY_OTHER_WRITABLE       Directory that is sticky and other-writable (+t,o+w)
# ow                OTHER_WRITABLE              Directory that is other-writable (o+w) and not sticky
# st                STICKY                      Directory with the sticky bit set (+t) and not other-writable
# ex                EXEC                        Executable file (i.e. has ‘x’ set in permissions)
# mi                MISSING                     Non-existent file pointed to by a symbolic link (visible when you type ls -l)
# lc                LEFTCODE, LEFT              Opening terminal code
# rc                RIGHTCODE, RIGHT            Closing terminal code
# ec                ENDCODE, END                Non-filename text
# *.extension                                   Every file using this extension e.g. *.jpg

# Effects
#  00                Default colour
#  01                Bold
#  04                Underlined
#  05                Flashing text
#  07                Reversetd
#  08                Concealed
# Colours
#  31                Red
#  32                Green
#  33                Orange
#  34                Blue
#  35                Purple
#  36                Cyan
#  37                Grey
# Backgrounds
#  40                Black background
#  41                Red background
#  42                Green background
#  43                Orange background
#  44                Blue background
#  45                Purple background
#  46                Cyan background
#  47                Grey background
# Extra colours
#  90                Dark grey
#  91                Light red
#  92                Light green
#  93                Yellow
#  94                Light blue
#  95                Light purple
#  96                Turquoise
#  97                White
#  100               Dark grey background
#  101               Light red background
#  102               Light green background
#  103               Yellow background
#  104               Light blue background
#  105               Light purple background
#  106               Turquoise background
