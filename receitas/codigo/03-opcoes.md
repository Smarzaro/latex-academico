# 03 – Opções mais usadas do `listings`

As opções podem ser dadas no `\lstset` (para todas as listagens) ou entre colchetes em uma
listagem (só para ela).

| Opção | Efeito |
|---|---|
| `language=Python` | Linguagem da listagem ([receita 04](04-linguagens-e-acentos.md)); com dialeto: `language=[ANSI]C` |
| `numbers=none` | Remove a numeração das linhas (`left` a coloca à esquerda) |
| `firstnumber=10` | Começa a numeração na linha 10 (útil para trechos de arquivos) |
| `firstline=4, lastline=11` | Em `\lstinputlisting`, mostra só as linhas 4 a 11 |
| `linerange={3-5,9-12}` | Em `\lstinputlisting`, mostra intervalos de linhas |
| `frame=single` | Moldura (`none`, `tb`, `lines` etc.) |
| `backgroundcolor` | Cor de fundo, por exemplo `\color{black!4}` |
| `breaklines=true` | Quebra linhas longas (e `postbreak` marca a continuação) |
| `basicstyle` | Fonte e tamanho do código, por exemplo `\ttfamily\footnotesize` (tamanho 10); `\small` dá letra um pouco maior |
| `keywordstyle`, `commentstyle`, `stringstyle` | Estilo de palavras-chave, comentários e cadeias (cor, negrito, itálico) |
| `morekeywords={foo,bar}` | Acrescenta palavras-chave à linguagem |
| `escapechar=\%` | Permite comandos LaTeX dentro do código, depois do caractere (por exemplo, `\textbf`) |
| `tabsize=4` | Largura do caractere de tabulação, em espaços |
| `caption={...}`, `label={...}` | Título (acima) e rótulo para `\ref` |
| `gobble=4` | Descarta os 4 primeiros caracteres de cada linha (código recuado dentro de listas) |
| `autogobble` | Mede o recuo na primeira linha e o descarta (pacote `lstautogobble`) |
| `showspaces`, `showtabs` | Mostra os espaços (␣) e as tabulações (com `tab=\rightarrowfill`) |
| `showstringspaces` | Mostra só os espaços dentro de cadeias de caracteres |
| `deletekeywords={print}` | Retira palavras da lista de palavras-chave da linguagem |
| `emph={palavra}`, `emphstyle` | Destaca palavras escolhidas com um estilo próprio |
| `escapeinside={(*}{*)}` | Trecho em LaTeX dentro do código, entre `(*` e `*)` (fórmulas, negrito) |
| `stepnumber=2`, `numberfirstline` | Numera de 2 em 2 linhas, sempre incluindo a primeira |

O exemplo [`listings-opcoes.tex`](../../exemplos/codigo/listings-opcoes.tex) mostra essas opções,
uma por página.

Com `\footnotesize` cabem cerca de 85 colunas de código na largura do texto; linhas mais longas
são quebradas se `breaklines=true`.

> **`linerange` e marcadores.** O `linerange` aceita também *marcadores* em vez de números de
> linha: `linerange={BEGIN:id-END:id}, rangeprefix=\%\%, includerangemarker=false` lista o código
> entre as linhas `%%BEGIN:id` e `%%END:id`. Como o `-` separa o início do fim do intervalo, o `id`
> deve ter **só letras e números**. É assim que os exemplos deste repositório são incluídos em
> outros documentos.
