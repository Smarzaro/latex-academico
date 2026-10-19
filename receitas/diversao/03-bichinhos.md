# 03 – Patos e bichinhos

**Problema.** Ilustrar um slide, um cartaz ou uma lista com um desenho simpático, sem procurar
imagens (e licenças) na internet.

**Solução.** Os pacotes `tikzducks` (patos) e `tikzlings` (pinguim, coruja, gato, abelha e
outros), que desenham os bichos em TikZ, com acessórios escolhidos por opções. Exemplo completo:
[`bichinhos.tex`](../../exemplos/diversao/bichinhos.tex).

```latex
\usepackage{tikzducks}                % \duck[opções]
\usepackage{tikzlings}                % \penguin, \owl, \cat, \bee...
```

```latex
\begin{center}
\begin{tikzpicture}[scale=1.5]
  \duck[graduate=black, tassel=red, book=\scalebox{0.4}{\LaTeX}, bookcolour=blue!60]
\end{tikzpicture}
\quad
\begin{tikzpicture}[scale=1.5]
  \penguin[signpost=\scalebox{0.5}{Olá!}]
\end{tikzpicture}
\quad
\begin{tikzpicture}[scale=1.5]
  \owl[magichat, magicwand]
\end{tikzpicture}
\end{center}
```

- Cada bicho é um comando usado dentro de um `tikzpicture`; o tamanho vem do `scale` da figura.
- Os acessórios são opções: `graduate=black` põe um capelo preto e `tassel=red` a borla vermelha;
  `book=` recebe o texto da capa do livro e `bookcolour=` a cor dele; `signpost=` escreve em uma
  placa. Opções sem valor, como `magichat` e `magicwand`, usam as cores padrão.
- Texto dentro de acessórios pequenos precisa ser reduzido: o `\scalebox{0.4}{...}` faz o
  `\LaTeX` caber na capa do livro.
- As cores do próprio bicho também são opções (por exemplo, `body=` e `bill=` no pato); a lista
  completa de acessórios e cores está na documentação de cada pacote (`texdoc tikzducks`,
  `texdoc tikzlings`).
- Em um `beamer`, os desenhos podem aparecer por partes com `\only` ou `\visible`, como qualquer
  elemento do slide.
