# 11 – Estilos e comandos do `biblatex`

**Problema.** Entender o que muda entre os estilos do `biblatex` (numérico, autor-data e `abnt`)
e o que cada comando de citação produz em cada um.

**Solução.** O estilo é uma opção do pacote; o texto e o arquivo `.bib` não mudam. Os exemplos
abaixo citam as mesmas entradas do [`catalogo.bib`](../../exemplos/referencias/catalogo.bib)
com os estilos padrão do `biblatex`:

- [`biblatex-comandos.tex`](../../exemplos/referencias/biblatex-comandos.tex): estilo
  numérico (o padrão);
- [`biblatex-autordata.tex`](../../exemplos/referencias/biblatex-autordata.tex): o mesmo texto
  com `style=authoryear`.

```latex
\usepackage{csquotes}                    % recomendado pelo biblatex
\usepackage[backend=biber]{biblatex}     % estilo padrão: numérico
\addbibresource{catalogo.bib}            % com a extensão .bib
...
\printbibliography
```

Compile com `latexmk -pdf`, que roda o `pdflatex`, o `biber` e o `pdflatex` de novo. Sem o
`biber`, as citações saem como a chave em negrito (**ex-livro**).

## O mesmo comando em cada estilo

| Comando | Numérico (padrão) | `style=authoryear` | `style=abnt` |
|---|---|---|---|
| `\cite{ex-livro}` | [2] | Huberman 1986 | (Huberman, 1986) |
| `\parencite{ex-artigo}` | [1] | (Hevner et al. 2004) | (Hevner *et al.*, 2004) |
| `\textcite{ex-livro-3}` | Passos, Fonseca e Chaves [3] | Passos, Fonseca e Chaves (1995) | Passos, Fonseca e Chaves (1995) |
| `\cite[p.~35]{ex-livro}` | [2, p. 35] | Huberman 1986, p. 35 | (Huberman, 1986, p. 35) |
| `\fullcite{ex-livro}` | a referência completa, no ponto do texto | idem | idem |

No estilo numérico, os números seguem a ordem da lista de referências, que é alfabética; para
numerar na ordem em que as obras aparecem no texto, use `style=numeric, sorting=none`. No
autor-data padrão, `\cite` não põe parênteses: use `\parencite` dentro da frase entre parênteses
e `\textcite` quando o autor faz parte da frase.

## Qual estilo usar

- **Trabalhos acadêmicos no Brasil:** `style=abnt`, do pacote `biblatex-abnt`. Os estilos padrão
  não seguem a NBR 6023 (nomes por extenso, título entre aspas, "pp."). Veja a configuração
  completa no [README desta pasta](README.md) e os comandos na
  [receita 09](09-citacoes-no-texto.md).
- **Artigos para periódicos:** o estilo que o periódico pedir; muitos ainda usam BibTeX (veja a
  [receita 12](12-bibtex-natbib-e-thebibliography.md)).
- **Outros documentos:** `numeric` ou `authoryear`, com variantes como `numeric-comp` (agrupa
  [1–3]) e `authoryear-comp`.

> Trocar de estilo não exige mudar o texto: os comandos `\cite`, `\parencite` e `\textcite`
> funcionam em todos. Comece com o estilo final, porém, para revisar as frases já com o formato
> das citações que o leitor vai ver.
