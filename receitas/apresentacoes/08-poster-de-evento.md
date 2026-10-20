# 08 – Pôster de evento em quatro pacotes

**Problema.** Fazer o pôster (painel) no modelo de um evento acadêmico: tamanho definido pelo
evento (aqui, 90 × 120 cm), faixa com o nome do evento, título, autor, seções em duas colunas,
figuras e tabela com legenda e fonte, referências e apoio financeiro, com letras grandes o
bastante para leitura a um metro.

**Solução.** O mesmo pôster está feito com os quatro pacotes de pôster mais usados, para comparar
o caminho de cada um. Os quatro saem praticamente iguais e usam o mesmo arquivo de referências.
Exemplos completos na pasta
[`poster-evento/`](../../exemplos/apresentacoes/poster-evento/):

| Arquivo | Pacote | Como o pôster é montado |
|---|---|---|
| [`poster-beamerposter.tex`](../../exemplos/apresentacoes/poster-evento/poster-beamerposter.tex) | `beamerposter` (sobre a `beamer`) | um único `frame`, colunas com `columns`, seções com `block` |
| [`poster-tikzposter.tex`](../../exemplos/apresentacoes/poster-evento/poster-tikzposter.tex) | classe `tikzposter` | a página é uma figura TikZ; `\column` e `\block` |
| [`poster-a0poster.tex`](../../exemplos/apresentacoes/poster-evento/poster-a0poster.tex) | classe `a0poster` | página comum; colunas com `minipage` e seções com um comando próprio |
| [`poster-tcbposter.tex`](../../exemplos/apresentacoes/poster-evento/poster-tcbposter.tex) | biblioteca `poster` do `tcolorbox` | grade de linhas e colunas; cada seção é uma caixa `\posterbox` |

Toda a arte (faixa do alto, ondas do pé, ícone) é desenhada com TikZ e as figuras são geradas
no próprio documento: não há imagens de terceiros. No apoio financeiro, as imagens de exemplo do
pacote `mwe` ficam no lugar dos logotipos dos financiadores.

## O que os quatro têm em comum

- **Tamanhos de letra pedidos pelo evento**: texto com 36 pt, títulos das seções com 40 pt,
  título do trabalho com 72 pt em duas linhas, legendas e fonte com 30 pt, referências com 24 pt.
- **Legendas acima** de figuras e tabelas, numeradas, e "Fonte:" abaixo, como pede a ABNT.
- **Referências** com o `biblatex-abnt`, sem *S. l.* e *s. n.* (opção `noslsn`), em coluna única
  no fim da segunda coluna. Três valores no preâmbulo controlam a lista:

  ```latex
  \newcommand{\refletra}{24pt}       % tamanho da letra (o texto do pôster tem 36 pt)
  \newcommand{\refentrelinha}{29pt}  % distância entre as linhas de uma mesma referência
  \newcommand{\refespaco}{0pt}       % espaço entre as referências
  ```

  A NBR 6023 pede uma linha em branco entre as referências (`\refespaco` igual a
  `\baselineskip`), que num pôster ocupa muito espaço; por isso o padrão aqui é 0.
- **Apoio financeiro** opcional, na largura toda, no pé: `\apoiofalse` retira a seção.

## Comparação

| | `beamerposter` | `tikzposter` | `a0poster` | `tcbposter` |
|---|---|---|---|---|
| Tipo | pacote sobre a `beamer` | classe | classe | biblioteca do `tcolorbox` |
| Tamanho do painel | qualquer (`width`, `height` em cm) | A0 a A2; outros exigem ajuste interno | A0 a A3; outros com `geometry` e `\anullfalse` | qualquer (`geometry`) |
| Colunas | `columns`/`column` | `\column{fração}` | `minipage` ou `multicol` | grade (`rows`, `columns`) |
| Seções | `block`, com aparência pelos *templates* | `\block`, com estilos e temas prontos | comando próprio, desenhado à mão | `\posterbox`, com todas as opções do `tcolorbox` |
| Figuras e tabelas | `figure` e `table` | `tikzfigure` ou `\captionof` | `\captionof` (sem flutuantes) | `\captionof` (sem flutuantes) |
| Arte de fundo | *template* `background` | `\definebackgroundstyle` | pacote `eso-pic` | `underlay` da caixa que cobre o painel |
| Ponto forte | quem já usa a `beamer` reaproveita temas e cores | temas e paletas prontos | simples: é uma página comum | posição exata de cada caixa |
| Ponto fraco | `\normalfont` volta ao tamanho do texto (atenção nas referências) | título e tamanhos de letra exigem redefinições internas | tudo é feito à mão | mais verboso; larguras não aceitam expressões |

Outros nomes aparecem em modelos antigos: a classe `baposter` (que não está no TeX Live nem no
MiKTeX: é baixada à parte) e a classe `sciposter`, hoje pouco usada.

## Armadilhas

- **Tamanho das referências.** O `biblatex` compõe a lista com `\bibfont`, e não com o tamanho em
  vigor; o `biblatex-abnt` usa `\normalfont` no subtítulo, e no `beamer` ele volta ao tamanho do
  texto. Os exemplos redefinem `\bibfont` e, dentro dele, `\normalfont`.
- **Espaço entre as referências.** O estilo `abnt` define `\bibitemsep` no fim do preâmbulo; a
  troca precisa vir no início do documento (`\AtBeginDocument`), como nos exemplos.
- **Colunas não se equilibram sozinhas**: em todos os pacotes, um bloco não passa para a outra
  coluna. Ajuste o conteúdo para as colunas terminarem em alturas parecidas.
- **Regras do evento**: confira no edital o tamanho do painel, a orientação, os tamanhos de letra
  e os elementos obrigatórios (logotipos, agradecimento a agências de fomento).
