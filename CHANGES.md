# Changes

## 0.2.1 (2026-10-18)

- Correção: os comentários de cabeçalho de `tabela-simples.tex`, `estilo-codigo.tex` e
  `ajustes-abnt.tex` citavam o marcador literal (ex.: `%%BEGIN:tabelasimples`), e o `listings`
  passava a incluir o trecho a partir do comentário. Os comentários foram reescritos e
  `scripts/run-tests.sh` acusa marcadores fora do início da linha.

## 0.2.0 (2026-10-18)

- Exemplos compiláveis (ainda sem receitas) para os temas básicos, usados pelo livro *LaTeX para
  Documentos Acadêmicos*: **primeiros passos** (`exemplos/basico/`: olá mundo, estrutura, espaços e
  comentários, divisões, português, hifenização, alinhamento, espaçamentos, notas e links, comandos
  próprios), **documentos longos** (`exemplos/organizacao/`), **referência cruzada**
  (`exemplos/referencia-cruzada/`), **matemática** (`exemplos/matematica/`), **apresentações e
  pôster** (`exemplos/apresentacoes/`, com beamer, metropolis e tikzposter) e **esqueleto de TCC com
  abnTeX2** (`exemplos/abntex2/`).
- Novos exemplos em temas existentes: `tabelas/tabular-basico.tex` (tabelas passo a passo),
  `figuras/ambientes-flutuantes.tex`, `referencias/biblatex-comandos.tex`,
  `referencias/biblatex-autordata.tex` e as formas clássicas `thebibliography.tex` e
  `bibtex-natbib.tex` (com `classico.bib`).
- Ids dos marcadores de `referencias/catalogo.bib` sem sublinhado (`livro_3` passou a `livro3` etc.);
  `scripts/run-tests.sh` passa a conferir os marcadores em `.bib` e nos modelos.
- `modelos/abnt-minimo.tex` com marcadores (`abntpreambulo`, `abntcorpo`).
- `scripts/run-tests.sh` funciona também com MiKTeX (BibTeX com `-outdir`).

- Cinco temas novos, com receitas, exemplos compiláveis e marcadores de inclusão:
  **Figuras e gráficos** (4 receitas, 4 exemplos), **Referências e citações** (10 receitas, catálogo
  de 23 entradas e exemplo de citações, com os ajustes finos do `biblatex-abnt`), **Siglas,
  abreviaturas e glossário** (3 receitas, 2 exemplos), **Cronograma** (2 receitas, 3 exemplos:
  quadro com marcas, quadro sombreado e Gantt) e **Escrita acadêmica** (6 receitas).
- `scripts/check-links.sh`: confere os links relativos entre os arquivos Markdown.

## 0.1.0 (2026-10-17)

- Primeira versão: estrutura do repositório (receitas, exemplos, modelos, scripts, testes e CI).
- Tema **Tabelas e quadros**: 6 receitas e 5 exemplos (tabela IBGE, células mescladas, tabela
  longa, dois quadros).
- Tema **Código-fonte**: 6 receitas e 5 exemplos (`listings` básico, arquivo, JSON, preto e
  branco, e `minted`).
- Marcadores `%%BEGIN:id` / `%%END:id` nos exemplos, para inclusão em outros documentos, e o
  teste `tests/inclusao-livro.tex`.
