# Changes

## 0.7.2 (2026-10-19)

- `diversao/palavras-cruzadas.tex`: grade com as barras alinhadas em colunas (até 79 colunas) e
  casas de 16 pt; pistas lado a lado sem `multicols` (as duas colunas começam no topo), em
  `\footnotesize`; QR code ao lado da grade. O passatempo inteiro cabe em meia página A4.

## 0.7.1 (2026-10-19)

- `codigo/estilo-codigo.tex`: comentários sem `\itshape` (a Inconsolata não tem itálico e o
  LaTeX trocava a forma com aviso); no estilo `codigopb`, comentários em cinza e destaque
  (`emph`) só em negrito. Receitas 01 e 05 de código atualizadas.

## 0.7.0 (2026-10-19)

- **Linhas de código com até 79 colunas** nos trechos marcados (`%%BEGIN`/`%%END`) de 51
  exemplos, para caberem sem quebra numa página de livro de 16 × 23 cm: comentários com menos
  espaço antes, mais curtos ou na linha anterior; opções longas em várias linhas; prosa dos
  exemplos requebrada. O resultado compilado de cada exemplo não muda.

## 0.6.0 (2026-10-18)

- **Receitas para todos os temas**: primeiros passos, documentos longos, referência cruzada,
  matemática, abnTeX2, classe abntex2-ufv, apresentações e pôsteres, provas e listas de
  exercícios, recursos por área do conhecimento, diversão com LaTeX e versionamento. O README
  passa a ter uma tabela única de receitas.
- NBR 14724 com o ano de 2024 no catálogo de referências (`catalogo.bib`, que trazia 2011) e nas
  receitas de referências e de tabelas.
- `basico/comandos-proprios.tex`: nome de sistema fictício neutro.
- `abntex2/tcc-esqueleto.tex`: `\cleardoublepage` depois de cada lista e do sumário (cada um em
  página própria, e a página do sumário sem número).
- `apresentacoes/curso/curso.tex`: títulos dos slides na cor primária e frames de referências
  sem "I", "II".
- `abntex2-ufv/figura-abntex2.tex` e `tabela-abntex2.tex`: fonte Latin Modern (`lmodern`).
- `diversao/xadrez.tex`: molduras vermelhas (a cor antes das casas marcadas);
  `diversao/palavras-cruzadas-solucao.tex` entra nos testes; `avaliacoes/prova-versoes.tex`:
  comandos do cabeçalho com o espaço que o Git Bash exige.

## 0.5.0 (2026-10-18)

- `areas/`: recursos por área do conhecimento, com README e convite a pedidos: química (`mhchem`,
  fórmula estrutural da cafeína com `chemfig`, grandezas com `siunitx`), estruturas de dados (árvore
  binária com `forest`, lista encadeada com TikZ, busca binária com `algpseudocodex` em português),
  bancos de dados (dependências funcionais com `fddiagram`, álgebra relacional, SQL), programação
  (fluxograma com TikZ, `algorithm2e` em português) e biologia (heredograma com `genealogytree`,
  quadro de Punnett).
- `diversao/`: xadrez (`xskak`), sudoku e dados (`sudoku`, `epsdice`), patos e bichinhos
  (`tikzducks`, `tikzlings`), fractais (`lindenmayersystems`), calendário de provas (biblioteca
  `calendar`), QR codes (`qrcode`) e palavras cruzadas sobre LaTeX (`cwpuzzle`), com a solução
  gerada do mesmo arquivo e publicada em `solucao-palavras-cruzadas.md`.
- Formulário de pedido de exemplo: temas "Recursos de uma área do conhecimento" e "Diversão com
  LaTeX" e campo opcional para a área.

## 0.4.2 (2026-10-18)

- Workflow `release`: cada tag de versão gera uma GitHub Release (com as notas desta lista), o que
  permite ao Zenodo arquivar o repositório e atribuir o DOI. Primeira versão publicada no Zenodo.

## 0.4.1 (2026-10-18)

- `avaliacoes/prova-versoes.tex`: o título da folha de respostas sai acima da tabela; dentro dela,
  ele alargava a última coluna e desalinhava as alternativas.

## 0.4.0 (2026-10-18)

- `apresentacoes/curso/`: slides de uma disciplina organizados com o pacote `subfiles` (preâmbulo
  comum em `curso.tex`, uma aula por arquivo em `aulas/`, cada aula compilável sozinha), com
  identidade visual em duas cores, blocos com significado, slides de transição automáticos por
  aula e por seção, referências por aula (`refsection`), colunas reveladas aos poucos com
  diagrama TikZ, código com trechos destacados, tabela com linhas alternadas e versão para
  impressão (`curso-handout.tex`).
- `avaliacoes/prova-versoes.tex`: prova com alternativas embaralhadas (`exam-randomizechoices`),
  a versão como semente, gabarito do mesmo arquivo, letra correta e chave de respostas por versão
  e folha de respostas; `gerar-versoes.sh` e `gerar-versoes.ps1` geram N versões e os gabaritos
  com o `latexmk`.
- `figuras/venn.tex`: diagramas de Venn (interseção, união, diferença) com `\clip`.
- Exemplos com dados genéricos de instituição ("Nome da Instituição") no lugar da UFV:
  `abntex2/tcc-esqueleto.tex`, `abntex2/autores.tex` e os exemplos de apresentações.

## 0.3.1 (2026-10-18)

- `abntex2-ufv/figura-abntex2.tex`: o texto do exemplo descreve corretamente o resultado (na
  classe abntex2, a fonte e a nota ficam centralizadas sob a figura).

## 0.3.0 (2026-10-18)

- **Estilo de código** (`codigo/estilo-codigo.tex`): fonte Inconsolata no lugar da Fira Mono (o `&`
  e os demais símbolos ficam mais legíveis, e a fonte mais estreita reduz as quebras de linha),
  `basewidth=0.5em`, destaque dos comandos do LaTeX (`texcsstyle` e `moretexcs` com comandos de
  pacotes como `\includegraphics` e `\toprule`) e estilo para as palavras em `emph`.
- **Referências alinhadas à esquerda**, como pede a NBR 6023: os exemplos e o modelo deixam a opção
  `justify`; `ajustes-abnt.tex` usa `\RaggedRight` (pacote `ragged2e`, mantém a hifenização) e
  `\urlstyle{same}`. Novo exemplo `referencias/alinhamento-referencias.tex` compara as três formas; receitas
  01, 02 e o índice de referências atualizados (inclui o significado de *s.l.* e *s.n.*).
- Novos exemplos: `codigo/listings-opcoes.tex` (gobble, autogobble, espaços e tabulações,
  palavras-chave, destaque, LaTeX no código, numeração), `codigo/comparacao-*.tex` (o mesmo código
  com listings, listings com estilo e minted), `cronograma/cronograma-entregas.tex` (marcos de
  entrega em cores), `abntex2/autores.tex` (vários autores com `\and` e com `\\`),
  `abntex2-ufv/` (ambientes `tabela` e `ilustracao` e float `codigo`, comparados com a abntex2),
  `avaliacoes/` (prova e gabarito do mesmo arquivo e lista de exercícios com a classe `exam`) e
  `versionamento/` (duas versões comparadas com o `latexdiff`).
- `scripts/run-tests.sh`: ignora exemplos com `% !requer: arquivo.cls` quando a classe não está
  instalada e gera e compila as diferenças de `versionamento/` com `latexdiff` (ou `latexdiff-so`).
- Formulários de *issue* para pedidos de exemplo, erros e comentários sobre o livro.

## 0.2.3 (2026-10-18)

- Ids de marcadores renomeados porque eram o começo de outro id do mesmo arquivo, e o `listings`
  incluía o trecho errado: `espacamentos` passou a `espacamentosuso`, `recursos` a `recursosuso` e
  `tabularxdesperdicio` a `colunasxiguais`. O `scripts/run-tests.sh` passa a acusar esses casos.

## 0.2.2 (2026-10-18)

- `codigo/estilo-codigo.tex`: o `literate` passa a cobrir também `Â`, `Ê`, `Ô`, `À`, `ü` e `Ü`
  (antes, um `Ê` em um código, como em "REFERÊNCIAS", parava a compilação com `Invalid UTF-8 byte
  sequence`).

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
