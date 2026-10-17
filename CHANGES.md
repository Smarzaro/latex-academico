# Changes

## 0.2.0 (2026-10-17)

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
