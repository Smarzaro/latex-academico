# Referências e citações (biblatex-abnt)

Receitas para escrever as entradas do arquivo `.bib` dos tipos de documento mais usados em
trabalhos acadêmicos e conferir o resultado impresso, de acordo com a ABNT NBR 6023
(referências) e a NBR 10520 (citações). Parte dos exemplos reproduz exemplos do Manual de
Normalização de Trabalhos Acadêmicos da UFV (2026-2); os demais têm dados ilustrativos.

O arquivo [`catalogo.bib`](../../exemplos/referencias/catalogo.bib) reúne todas as entradas; o
exemplo [`catalogo.tex`](../../exemplos/referencias/catalogo.tex) as imprime em uma lista de
referências, e [`citacoes.tex`](../../exemplos/referencias/citacoes.tex) mostra os comandos de
citação.

| Receita | O que resolve |
|---|---|
| [01 – Regras e campos](01-regras-e-campos.md) | Regras gerais da lista, campos do `.bib` e convenções do estilo `abnt` |
| [02 – Ajustes finos do `biblatex-abnt`](02-ajustes-finos.md) | Hífen nos intervalos de páginas, meses com barra, obra sem autoria e título "REFERÊNCIAS" |
| [03 – Livros e partes de livros](03-livros.md) | Livro (1, 3 e 4 autores), organizador, tradutor, capítulo |
| [04 – Trabalhos acadêmicos](04-trabalhos-academicos.md) | TCC, dissertação e tese |
| [05 – Artigos e eventos](05-artigos-e-eventos.md) | Artigo (impresso e *online*) e trabalho em evento |
| [06 – Normas, legislação e institucionais](06-normas-legislacao-institucionais.md) | Norma, lei, autor institucional e relatório |
| [07 – Online, repositórios e software](07-online-repositorios-software.md) | Página *web*, repositório e programa de computador |
| [08 – Obras sem autoria](08-sem-autoria.md) | Título como entrada e `shorttitle` |
| [09 – Citações no texto](09-citacoes-no-texto.md) | `\cite`, `\textcite`, páginas, várias obras, apud, supressões |
| [10 – Dicas do arquivo `.bib`](10-dicas-do-bib.md) | Chaves, UTF-8, maiúsculas, gerenciadores e compilação |
| [11 – Estilos e comandos do `biblatex`](11-estilos-do-biblatex.md) | Numérico, autor-data e `abnt` com os mesmos comandos de citação |
| [12 – BibTeX, `natbib` e `thebibliography`](12-bibtex-natbib-e-thebibliography.md) | Formas clássicas, ainda usadas em modelos de periódicos |

Pressupõe a classe `abntex2` e o `biblatex` com o estilo `abnt`:

```latex
\usepackage{csquotes}
\usepackage[backend=biber, style=abnt, uniquename=init, giveninits,
            repeatfields]{biblatex}
\usepackage{ragged2e}       % referências à esquerda com hifenização (receita 02)
\usepackage{xurl}           % quebra de URLs longas
\addbibresource{referencias.bib}
```

A opção `justify` do `biblatex-abnt` justifica a lista, mas a NBR 6023 pede referências alinhadas
à esquerda; veja a receita 02 para melhorar o alinhamento à esquerda. Confira sempre o manual de
normalização da sua instituição, que pode ter regras próprias.
