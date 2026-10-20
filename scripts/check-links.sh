#!/bin/sh
# Confere se os links relativos dos arquivos Markdown apontam para arquivos ou pastas que existem.
# Ignora endereços http(s), mailto, âncoras (#...) e blocos de código. Uso (na raiz do repositório): sh scripts/check-links.sh
set -u
raiz="$(cd "$(dirname "$0")/.." && pwd)"
cd "$raiz" || exit 1
erros=0
for md in $(find . -name '*.md' -not -path './.git/*' | sort); do
  dir="$(dirname "$md")"
  # blocos de código (```) ficam de fora: neles, "](...)" é código, como \tkzLabelPoints[left](B)
  awk '/^```/ { dentro = !dentro; next } !dentro' "$md" | grep -o ']([^)]*)' | sed 's/^](//; s/)$//' | while read -r alvo; do
    case "$alvo" in http*|mailto:*|\#*|"") continue ;; esac
    caminho="${alvo%%#*}"
    [ -z "$caminho" ] && continue
    if [ ! -e "$dir/$caminho" ]; then
      echo "LINK QUEBRADO em $md: $alvo"
      echo x >> "${TMPDIR:-/tmp}/links.$$"
    fi
  done
done
if [ -f "${TMPDIR:-/tmp}/links.$$" ]; then
  erros=$(wc -l < "${TMPDIR:-/tmp}/links.$$"); rm -f "${TMPDIR:-/tmp}/links.$$"
fi
echo "Links quebrados: $erros"
exit $((erros > 0))
