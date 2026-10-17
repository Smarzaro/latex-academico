# 01 – Inserir uma imagem

**Problema.** Inserir uma figura com título (acima), fonte (abaixo) e, se preciso, nota, citá-la no
texto e manter as imagens organizadas.

**Solução.** `graphicx` (`\includegraphics`), o ambiente `figure` e, da classe `abntex2`, o
`\fonte` e o `\nota`. Exemplo completo:
[`figura-imagem.tex`](../../exemplos/figuras/figura-imagem.tex).

```latex
\usepackage{graphicx}
\graphicspath{{imagens/}}             % as imagens ficam na pasta imagens/
```

```latex
\begin{figure}[htbp]
  \caption{Exemplo de inserção de figura no \LaTeX}\label{fig:imagem}
  \centering
  \includegraphics[width=.6\linewidth]{example-image-a}
  \fonte{Adaptado de Silva (2020).}
  \nota{A imagem é um exemplo e deve ser substituída.}
\end{figure}
```

No texto, cite com `\autoref{fig:imagem}`, que escreve "Figura 1" sozinho.

## Cuidados

- **Formato.** Prefira PDF (ou SVG convertido para PDF) para diagramas e gráficos, porque são
  vetoriais e não perdem nitidez. Use PNG com pelo menos 300 dpi para capturas de tela, e JPG para
  fotografias.
- **Pasta de imagens.** Com `\graphicspath{{imagens/}}`, basta `\includegraphics{arquivo}`, sem o
  nome da pasta nem a extensão.
- **Largura.** `width=.6\linewidth` usa 60% da largura do texto. Evite `height` e `width` juntos,
  que deformam a imagem (use `keepaspectratio` se precisar dos dois).
- **Título curto.** `\caption[título curto]{título longo}` põe o nome curto na lista de figuras.
- **Fonte obrigatória.** Toda ilustração tem fonte, mesmo a do próprio autor ("Elaborado pelo
  próprio autor"). Quando a imagem não é sua, indique a fonte e inclua a obra nas referências.
- **Posição.** Use `[htbp]` e deixe o LaTeX posicionar a figura perto da citação; a referência
  com `\autoref` continua correta mesmo que ela vá para outra página.
- **Cite sempre a figura no texto** e comente o que ela mostra.

> Para um exemplo que compila sem arquivos extras, o exemplo usa `example-image-a`, do pacote
> `mwe`. Troque pelo seu arquivo.
