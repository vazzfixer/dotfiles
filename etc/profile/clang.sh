
# bcpad + borlandでエラーにならない用clang c89モード
bclang () {
  clang -Wall -Wextra -ansi -pedantic $@
}
