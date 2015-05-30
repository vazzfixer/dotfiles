#!/bin/bash

# rubyのpresentation作成ツール
# 使い方
# $ slideshow build memo.md
# $ wkhtmltopdf -O Landscape memo.pdf.html slides.pdf


gem install slideshow
brew install wkhtmltopdf

slideshow intall shower
# s6blank, s6syntax, s5blank, s5themes, g5, slidy, deck.js, impress.js, analytics
# $ slideshow list #>一覧表示
slideshow install -a
