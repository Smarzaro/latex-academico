#!/bin/sh
# Gera várias versões de uma prova feita com exam + exam-randomizechoices, e o gabarito de cada uma.
# A prova precisa ter, no preâmbulo:  \providecommand{\versao}{1}  \setrandomizerseed{\versao}
#                                     \ifdefined\gabarito \printanswers \fi
# Uso (na pasta da prova):  sh gerar-versoes.sh prova-versoes.tex 4
#   gera versoes/prova-versoes-v1.pdf ... -v4.pdf e versoes/prova-versoes-gabarito-v1.pdf ...
# Os arquivos auxiliares ficam em versoes/aux/ e podem ser apagados.
set -eu
arq="${1:?informe o arquivo .tex da prova}"
n="${2:-3}"
base="$(basename "$arq" .tex)"
mkdir -p versoes/aux
v=1
while [ "$v" -le "$n" ]; do
  # o espaço no fim do -usepretex é proposital: no Git Bash (Windows), um argumento sem espaços
  # perde as barras invertidas e as chaves antes de chegar ao latexmk
  latexmk -pdf -silent -interaction=nonstopmode -auxdir=versoes/aux -outdir=versoes \
    -jobname="$base-v$v" -usepretex="\def\versao{$v} " "$arq" < /dev/null > /dev/null
  latexmk -pdf -silent -interaction=nonstopmode -auxdir=versoes/aux -outdir=versoes \
    -jobname="$base-gabarito-v$v" -usepretex="\def\versao{$v}\def\gabarito{1} " "$arq" < /dev/null > /dev/null
  echo "versão $v: versoes/$base-v$v.pdf e versoes/$base-gabarito-v$v.pdf"
  v=$((v + 1))
done
