if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

pandoc_html () {
  pandoc -s --self-contained -t html5 -c ~/.pandoc/github.css $@
}

pandoc_pdf () {
  pandoc -V documentclass=ltjarticle --latex-engine=lualatex $@
}
