# Changes

## 0.10.5 (2026-10-20)

- `codigo/listings-opcoes.tex`, trecho `palavraschave`: o mesmo código aparece duas vezes, sem e
  com `morekeywords`/`deletekeywords`, para o resultado mostrar a diferença. O `morekeywords`
  acrescenta só `self` (o `len` já é palavra-chave do Python no `listings`).

## 0.10.4 (2026-10-20)

- `codigo/estilo-codigo.tex`: o trecho `estilo` foi dividido em três, para o livro mostrá-los
  em separado: `estilopacotes` (pacotes e cores), `estilocodigo` (o estilo `codigo`, o `\lstset`
  e os nomes) e `estilopb` (a versão em preto e branco, agora depois do `\lstset`, sem mudar o
  resultado). O `literate` traduz também os travessões (`–`, `—`).
- `codigo/estilo-minimo.tex`: docstring mais curta, que cabe numa linha na largura do livro.

## 0.10.3 (2026-10-20)

- Comentário da linha da lista nos preâmbulos com `quadro` e `grafico`: `--` no lugar do
  travessão, que o `literate` do estilo de código não traduz (a listagem que mostra o trecho
  parava com *Invalid UTF-8 byte sequence*).

## 0.10.2 (2026-10-20)

Conferência com o texto da NBR 10520:2023, da NBR 14724:2024, da NBR 6027:2012 e da
NBR 6028:2021.

- Palavras-chave com ponto e vírgula, inicial minúscula e ponto final (NBR 6028:2021, 4.1.7) no
  `abntex2/tcc-esqueleto.tex`, no modelo `tcc-abntex2` e na receita `abntex2/02`; antes, eram
  separadas por ponto, como na edição de 2003.
- Listas de quadros, gráficos e códigos no formato da NBR 14724 ("Quadro 1 – Título ..... 5"):
  `\cftquadroname`, `\cftquadroaftersnum` e `\cftquadronumwidth` nos exemplos com `quadro` e
  `grafico`; no modelo `tcc-abntex2`, o código passa a ser um flutuante `codigo` com lista própria.
- Modelo `tcc-abntex2`: o `\autoref` escreve "Seção 2" (a NBR 14724 organiza o trabalho em seções, e
  não em capítulos), e o sumário fica no padrão da classe (`abnt-6027-2012`), que alinha os títulos
  como recomenda a NBR 6027; o esqueleto também deixa de usar `sumario=tradicional`.
- Receita `tabelas/02`: a NBR 14724 pede que título e rodapé acompanhem as margens da ilustração,
  em letra menor e uniforme; o "cabeçalho centralizado, rodapé à esquerda" não é da norma.
- Receitas `abntex2/01` (fonte 12 recomendada, frente e verso recomendado, sumário),
  `abntex2/04` (código como flutuante, seções, NBR 6027), `siglas-glossario` (listas separadas
  recomendadas; símbolos na ordem do texto) e `referencias/09` (ano da norma, *et al.* opcional,
  citação longa: recuo padronizado, 4 cm recomendado).
- `referencias/citacoes.tex`: "Passos, Fonseca e Chaves (1995, p. 35) defendem".

## 0.10.1 (2026-10-20)

- `referencia-cruzada/02-autoref-cleveref.md`: a receita mostrava a configuração antiga do
  `cleveref` (nomes e conjunções definidos à mão); agora usa a opção `brazilian`, como o exemplo,
  e avisa que figuras e equações saem abreviadas ("fig. 1"), salvo com `noabbrev`.
- Linhas dos trechos com até 78 colunas, como pede o livro: comentários em `hifenizacao.tex`,
  `autoref-cleveref.tex` e no `\newlistentry` dos quadros e gráficos; `\sisetup` do
  `tabela-simples.tex` em duas linhas.

## 0.10.0 (2026-10-20)

Revisão técnica dos exemplos (normas, pacotes e saída em português) e exemplos novos.

**Novos**

- `modelos/tcc-abntex2/`: TCC completo com a `abntex2` (arquivo principal, um arquivo por
  capítulo, folha de aprovação, resumos, listas de figuras, quadros, códigos e tabelas, siglas com
  `acro`, figura, quadro, código, tabela, equação, apêndice e anexo). `modelos/tcc-abntex2-ufv/`:
  o mesmo trabalho com a classe `abntex2-ufv` (`ilustracao`, `tabela`, floats `quadro` e
  `codigo`, `\listadesiglas`, `\imprimirfolhadeaprovacao`). Receita
  `abntex2/04-trabalho-completo.md`, com as dúvidas mais comuns.
- `matematica/elementos.tex` e receita `matematica/04-elementos-basicos.md`: `^`, `_`, chaves,
  `\frac`, `\sqrt`, `\sum`, `\int` e letras gregas.
- `codigo/estilo-minimo.tex`: estilo mínimo do `listings` (fonte, cores, numeração, moldura,
  quebra de linhas e acentos), citado na receita `codigo/01`.
- `tabelas/tabela-fonte-nota.tex` (`\IBGEtab` e `threeparttable`) e
  `figuras/figura-fonte-nota.tex` (`minipage` da largura da imagem): título, fonte e nota na
  largura do objeto só com a `abntex2` e pacotes do CTAN. Receitas `tabelas/02` e `figuras/01`.

**Correções**

- Referências: sem a opção `noslsn` em todos os exemplos, modelos e receitas. A NBR 6023:2025
  (itens 8.4.4, 8.5.5 e 8.5.6) pede "[S. l.]", "[s. n.]" e "[S. l.: s. n.]" quando faltam o local
  e a editora; as receitas mostram a saída real.
- `referencia-cruzada/autoref-cleveref.tex`: `cleveref` com a opção `brazilian`, que já traduz
  os nomes; fica um `\crefname` de exemplo para o quadro.
- `\autoref` de quadros e gráficos escrevia só o número ("no 1"): `\quadroautorefname` e
  `\graficoautorefname` nos preâmbulos.
- Listas de quadros e de gráficos sem pontilhado e com o número da página colado ao título:
  `\newlistentry` depois do `\newlistof`.
- `figuras/grafico-pgfplots.tex`: vírgula decimal nos eixos e rótulos (`use comma`).
- `tabelas/tabela-simples.tex`: trecho `tabelapreambulo`, com `booktabs`, `siunitx` e `\sisetup`.
- `codigo/minted-basico.tex` e receita `codigo/05`: o minted 3 traz o Pygments; o
  `-shell-escape` só é preciso no MiKTeX e no TeX Live anterior a 2024.
- `figuras/figura-subfiguras.tex` e receita `figuras/02`: o `subcaption` funciona com o
  `memoir`; a subfigura é citada com `Figura~\ref` (o `\autoref` escreve "Subfigure").
- Pôsteres: comentário do `\bibitemsep` corrigido. `basico/comandos-proprios.tex`:
  `\estrangeiro` com `\emph`. `codigo/listings-opcoes.tex`: título antes da imagem no trecho
  `destaque`. `basico/hifenizacao.tex`: comentário sobre o `\hyphenation` no preâmbulo.
  `diversao/sudoku-dados.tex`: algarismos em `\Large`.
- Rótulos de código com o prefixo `lst:` (antes `cod:`), como na receita
  `referencia-cruzada/01`, que agora lista também `gra:` e lembra que os prefixos são uma
  convenção, não uma regra do LaTeX.

## 0.9.1 (2026-10-20)

- `areas/06-matematica.md`, `exemplos/areas/README.md` e `run-tests.sh`: o LaTeX Workshop (VS
  Code) ignora o comentário `% !TEX program` por padrão; o texto passa a indicar a receita
  *latexmk (lualatex)*.
- Entrada da versão 0.9.0 reescrita sem colchete seguido de parênteses, que o `check-links.sh`
  lia como link quebrado.

## 0.9.0 (2026-10-20)

- `areas/matematica.tex` e receita `areas/06-matematica.md`: geometria com `tkz-euclide`
  (triângulo retângulo e circunferência inscrita), área sob a curva com `pgfplots` e
  `fillbetween`, simplificação passo a passo com `cancel` e `mathtools`, tabela-verdade e notação
  de conjuntos, dedução natural com `bussproofs`.
- `areas/logica-truthtable.tex`: tabela-verdade calculada pelo pacote `truthtable`, o primeiro
  exemplo do guia que exige LuaLaTeX.
- `areas/fisica.tex` e receita `areas/07-fisica.md`: circuito RC com `circuitikz`, diagrama de
  corpo livre no plano inclinado com TikZ, notação com `derivative`, `braket` e `siunitx`, e
  `\sen` em português.
- `run-tests.sh`: exemplos com `% !TEX program = lualatex` (ou `xelatex`) nas três primeiras
  linhas são compilados com esse motor.
- `check-links.sh`: ignora os blocos de código dos `.md`, onde os pontos entre parênteses do
  `tkz-euclide` (como no `\tkzLabelPoints`) pareciam links.

## 0.8.5 (2026-10-20)

- Receitas para os seis exemplos que ainda não tinham uma: `figuras/05-ambientes-flutuantes.md`
  (`ambientes-flutuantes.tex`), `tabelas/07-tabular-passo-a-passo.md` (`tabular-basico.tex`),
  `referencias/11-estilos-do-biblatex.md` (`biblatex-comandos.tex` e `biblatex-autordata.tex`) e
  `referencias/12-bibtex-natbib-e-thebibliography.md` (`bibtex-natbib.tex` e
  `thebibliography.tex`). Todos os exemplos do guia agora têm receita.

## 0.8.4 (2026-10-20)

- `codigo/comparacao-listings.tex`, `comparacao-listings-estilo.tex` e `comparacao-minted.tex`:
  código com linhas de até 44 caracteres. Com o documento em 12 pt, o `listings` sem configuração
  cabe na largura do texto, e as três versões saem na mesma escala, sem linhas além da margem.

## 0.8.3 (2026-10-20)

- `tabelas/tabular-basico.tex`: uma linha a mais nas tabelas dos trechos `colunap` e `tabularx`,
  com outra célula de texto longo quebrada na largura da coluna.
- `release.yml`: a release (e o DOI de versão no Zenodo) sai sozinha só nas versões principais
  (`vX.0.0`); as outras tags ganham release manualmente, pelo *Run workflow*, quando for preciso.

## 0.8.2 (2026-10-19)

- `avaliacoes/prova-versoes.tex`: o trecho `versoesquestoes` (todas as questões) dá lugar a
  `versoesprimeira`, só com a primeira questão, que já mostra `randomizechoices`,
  `\correctchoice`, `\altcorreta` e o rótulo da folha de respostas. O resultado compilado não muda.

## 0.8.1 (2026-10-19)

- `apresentacoes/modelo-apresentacao.tex`: trecho do preâmbulo mais curto (comentário do
  `frametitle continuation` no cabeçalho, sem a linha em branco, e o `\titlegraphic` comentado fora
  do trecho). O resultado compilado não muda.
- `apresentacoes/poster-evento/poster-beamerposter.tex`: o preâmbulo passa a ter dois trechos,
  `beamerposterpacotes` (pacotes) e `beamerposterreferencias` (ajustes da lista de referências), no
  lugar de `beamerposterpreambulo`.

## 0.8.0 (2026-10-19)

- `apresentacoes/poster-evento/`: o mesmo pôster de evento acadêmico (painel de 90 × 120 cm) feito
  com os quatro pacotes de pôster mais usados: `beamerposter`, `tikzposter`, `a0poster` e a
  biblioteca `poster` do `tcolorbox`. Arte desenhada com TikZ e figuras geradas no próprio
  documento, sem imagens de terceiros; tamanhos de letra de evento (36 pt no texto); legendas
  acima com "Fonte:" abaixo; referências com o `biblatex-abnt` em 24 pt, com tamanho, entrelinha e
  espaço entre as referências configuráveis; apoio financeiro opcional.
- Receita 08 de apresentações: o pôster de evento nos quatro pacotes e a comparação entre eles.
- `.gitignore`: `a0header.ps`, gravado pela classe `a0poster`.

## 0.7.4 (2026-10-19)

- *S. l.* e *s. n.* deixam de ser escritos no `.bib`: a NBR 6023:2018 não os exige mais, e o
  `biblatex-abnt` os trata como opção (imprime as expressões quando falta o local ou a editora;
  `noslsn` as omite). `referencias/catalogo.bib` (página da *web* e obra sem autoria) e as
  receitas 01, 07 e 08 de referências passam a omitir o campo `location`.

## 0.7.3 (2026-10-19)

- Linhas de código com até 78 colunas nos trechos marcados (eram 79), para a moldura das
  listagens caber dentro da largura do texto no livro: comentários com um espaço a menos antes
  (com os vizinhos realinhados) e linhas de texto requebradas. O resultado compilado não muda.
- `tabelas/tabela-longa.tex`: 34 linhas de dados (eram 60) e papel A5, para a tabela continuar
  passando de uma página com um código mais curto.

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
