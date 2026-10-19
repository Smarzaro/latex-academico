# 06 – QR code

**Problema.** Pôr no slide, no pôster ou na prova um QR code que leve a um endereço, a um DOI ou
a um texto, sem gerar imagens em outro programa.

**Solução.** O pacote `qrcode`, que calcula e desenha o código durante a compilação. Com o
`hyperref`, o código também vira um link clicável no PDF. Exemplo completo:
[`qrcode.tex`](../../exemplos/diversao/qrcode.tex).

```latex
\usepackage[hidelinks]{hyperref}      % o QR code também vira um link no PDF
\usepackage{qrcode}
```

```latex
\begin{center}
\begin{tabular}{ccc}
  \qrcode[height=2.5cm]{https://github.com/Smarzaro/latex-academico} &
  \qrcode[height=2.5cm, level=H]{https://doi.org/10.5281/zenodo.23458965} &
  \qrcode[height=2.5cm, nolink]{Parabéns: você leu um QR code feito em LaTeX!} \\[4pt]
  guia \texttt{latex-academico} & DOI (correção alta) & texto, sem link
\end{tabular}
\end{center}
```

- `height` fixa o tamanho do código impresso (ele é quadrado).
- `level` é o nível de correção de erros: `L`, `M` (o padrão), `Q` ou `H`. Um nível mais alto
  aguenta mais sujeira ou dobras no papel, mas o código fica mais denso, com módulos menores.
- `nolink` impede que o código vire link: use-o quando o conteúdo não é um endereço.
- Para um DOI, codifique o endereço completo (`https://doi.org/...`), não só o identificador:
  assim o leitor do celular abre o link.

## Ajustes e armadilhas

- Endereços longos geram códigos densos, difíceis de ler quando impressos pequenos. Prefira
  endereços curtos e um tamanho de pelo menos 2 cm no papel; em slides e pôsteres, maior.
- Caracteres especiais do TeX no endereço (`%`, `#`, `&`): escreva-os com barra invertida
  (`\%`, `\#`, `\&`), que o pacote converte de volta no caractere. É o modo seguro, que funciona
  também quando o `\qrcode` está dentro do argumento de outro comando.
- Com acentos no texto, como no terceiro código, teste a leitura com mais de um aplicativo de
  celular antes de imprimir.
- O pacote guarda no `.aux` os códigos já calculados, e as compilações seguintes ficam mais
  rápidas. Durante a escrita, a opção `draft` (`\usepackage[draft]{qrcode}`) troca os códigos por
  um espaço reservado.
- Sempre escaneie o PDF final com o celular: o QR code não dá erro de compilação se o endereço
  estiver errado.
