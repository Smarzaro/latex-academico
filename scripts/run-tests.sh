#!/bin/sh
# Compila todos os exemplos (exemplos/**/*.tex), os modelos (modelos/*.tex) e os testes (tests/*.tex) e falha se algum
# tiver erro, referência indefinida ou citação indefinida.
# Uso (na raiz do repositório):  sh scripts/run-tests.sh [padrão]     ex.: sh scripts/run-tests.sh tabelas
# Exemplos que usam minted (primeira linha com "% !shell-escape") são compilados com
# -shell-escape e ignorados se o Pygments não estiver instalado.
set -u
raiz="$(cd "$(dirname "$0")/.." && pwd)"
cd "$raiz" || exit 1
filtro="${1:-}"
if command -v timeout >/dev/null 2>&1; then limite="timeout 300"; else limite=""; fi
falhas=0; total=0; ignorados=0
if bibtex --version 2>/dev/null | grep -q MiKTeX; then miktex=true; else miktex=false; fi

# Marcadores %%BEGIN:id / %%END:id: todo BEGIN precisa de um END com o mesmo id (e vice-versa)
tmp="${TMPDIR:-/tmp}/marcadores.$$"
for f in $(find exemplos modelos -name '*.tex' | sort); do
  # o id só pode ter letras e números (o listings usa "-" como separador de intervalo)
  if grep -nE '^%%(BEGIN|END):[A-Za-z0-9]*[^A-Za-z0-9[:space:]]' "$f"; then
    echo "FALHA: id de marcador com caractere inválido em $f (use só letras e números)"; falhas=$((falhas+1))
  fi
  grep -o '^%%BEGIN:[A-Za-z0-9]*' "$f" | sed 's/BEGIN/ID/' | sort > "$tmp.b"
  grep -o '^%%END:[A-Za-z0-9]*' "$f" | sed 's/END/ID/' | sort > "$tmp.e"
  if ! cmp -s "$tmp.b" "$tmp.e"; then
    echo "FALHA: marcadores BEGIN/END diferentes em $f"; falhas=$((falhas+1))
  fi
done
# Marcadores em arquivos .bib: @comment{BEGIN:id} / @comment{END:id}, com as mesmas regras
for f in $(find exemplos modelos -name '*.bib' | sort); do
  if grep -nE '^@comment\{(BEGIN|END):[A-Za-z0-9]*[^A-Za-z0-9}]' "$f"; then
    echo "FALHA: id de marcador com caractere inválido em $f (use só letras e números)"; falhas=$((falhas+1))
  fi
  grep -o '^@comment{BEGIN:[A-Za-z0-9]*}' "$f" | sed 's/BEGIN/ID/' | sort > "$tmp.b"
  grep -o '^@comment{END:[A-Za-z0-9]*}' "$f" | sed 's/END/ID/' | sort > "$tmp.e"
  if ! cmp -s "$tmp.b" "$tmp.e"; then
    echo "FALHA: marcadores BEGIN/END diferentes em $f"; falhas=$((falhas+1))
  fi
done
rm -f "$tmp.b" "$tmp.e"

for t in $(find exemplos modelos tests -name '*.tex' | sort); do
  case "$t" in *"$filtro"*) ;; *) continue ;; esac
  dir="$(dirname "$t")"; arq="$(basename "$t")"; nome="${arq%.tex}"
  # arquivos auxiliares não são documentos (começam com _ ou não têm \documentclass)
  grep -q '\\documentclass' "$t" || continue
  opcoes="-pdf -interaction=nonstopmode -halt-on-error -outdir=build/$nome"
  if head -n 3 "$t" | grep -q '!shell-escape'; then
    if command -v pygmentize >/dev/null 2>&1 || python3 -c 'import pygments' >/dev/null 2>&1; then
      opcoes="$opcoes -shell-escape"
    else
      echo "-- $t: ignorado (Pygments não instalado)"; ignorados=$((ignorados+1)); continue
    fi
  fi
  total=$((total+1))
  echo "== $t"
  rm -rf "$dir/build/$nome"
  # MiKTeX: o latexmk roda o bibtex dentro de build/ e o bibtex do MiKTeX não acha o .bib da pasta
  # do exemplo; BIBINPUTS com o caminho absoluto resolve (o TeX Live não precisa disso)
  if ! ( cd "$dir" && { ! $miktex || export BIBINPUTS=".;$(pwd -W);"; } &&
         $limite latexmk $opcoes "$arq" < /dev/null > "build-$nome.out" 2>&1 ); then
    echo "FALHA: erro de compilação em $t"; tail -n 25 "$dir/build-$nome.out"; falhas=$((falhas+1))
    rm -f "$dir/build-$nome.out"; continue
  fi
  rm -f "$dir/build-$nome.out"
  if grep -E "^!|There were undefined references|Citation .* undefined" "$dir/build/$nome/$nome.log"; then
    echo "FALHA: problemas no log de $t"; falhas=$((falhas+1))
  fi
done
echo "Documentos compilados: $total; ignorados: $ignorados; falhas: $falhas"
exit $((falhas > 0))
