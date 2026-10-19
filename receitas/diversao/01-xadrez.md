# 01 – Xadrez

**Problema.** Escrever uma partida de xadrez e mostrar o tabuleiro na posição final, com as casas
do último lance destacadas, sem montar a posição peça por peça.

**Solução.** O pacote `xskak`, que lê os lances e acompanha a posição, e o `chessboard` (carregado
por ele), que desenha o tabuleiro. Exemplo completo, com o "mate do pastor":
[`xadrez.tex`](../../exemplos/diversao/xadrez.tex).

```latex
\usepackage{xskak}                    % partidas (carrega o chessboard)
```

```latex
\newchessgame
Partida: \mainline{1. e4 e5 2. Bc4 Nc6 3. Qh5 Nf6 4. Qxf7#}

\xskakset{moveid=\xskakgetgame{lastmoveid}}   % posição depois do último lance
\begin{center}
  \chessboard[setfen=\xskakget{nextfen}, showmover=false,
              pgfstyle=border, color=red, markfields={f7, h5}]   % a cor antes das casas
\end{center}
```

- `\newchessgame` começa uma partida na posição inicial; `\mainline` imprime os lances e, ao mesmo
  tempo, os executa. As letras das peças são as da notação em inglês (K, Q, R, B, N), mas o PDF
  mostra as figuras das peças, que valem em qualquer idioma.
- `\xskakset{moveid=...}` aponta para um lance; `\xskakget{nextfen}` devolve a posição depois
  dele, no formato FEN, que o `\chessboard` desenha com `setfen`. Para mostrar a posição de outro
  momento da partida, troque `lastmoveid` pelo número e cor do lance (por exemplo, `2w`).
- `markfields` destaca casas e `pgfstyle=border` desenha uma moldura nelas. Aqui as casas são a de
  partida (h5) e a de chegada (f7) do último lance.
- `showmover=false` esconde o indicador de quem joga.

## Armadilha: a ordem das opções

No `\chessboard`, as opções de estilo valem para as marcas que vêm **depois** delas. Por isso o
exemplo escreve `pgfstyle=border, color=red` antes de `markfields`; com o `color=red` depois do
`markfields`, ele não teria efeito e as molduras sairiam pretas.
