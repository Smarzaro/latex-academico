# 05 – Preto e branco e `minted`

## Impressão em preto e branco

O estilo `codigopb` é o mesmo `codigo` sem cores: palavras-chave em negrito, comentários em
cinza e fundo branco (a Inconsolata não tem itálico). Está definido em
[`estilo-codigo.tex`](../../exemplos/codigo/estilo-codigo.tex). Escolha-o em uma listagem com
`[style=codigopb]` ou para todas com `\lstset{style=codigopb}`. Exemplo:
[`listings-pb.tex`](../../exemplos/codigo/listings-pb.tex).

```latex
\lstdefinestyle{codigopb}{style=codigo, keywordstyle=\bfseries,
  texcsstyle=*\bfseries, emphstyle=\bfseries, commentstyle=\color{black!60},
  stringstyle=\relax, backgroundcolor=\color{white}, rulecolor=\color{black},
  numberstyle=\tiny}
```

## Alternativa: `minted`

O `minted` usa o Pygments (Python) e produz uma coloração mais fiel à de editores de código, para
muitas linguagens. Exemplo: [`minted-basico.tex`](../../exemplos/codigo/minted-basico.tex).

```latex
\usepackage[cache=false]{minted}
\setminted{fontsize=\footnotesize, linenos, frame=lines, breaklines, autogobble}
\renewcommand{\listingscaption}{Código}
```

```latex
\begin{listing}[htbp]
  \caption{Função em Python, colorida com o minted}\label{cod:minted}
\begin{minted}{python}
def media(valores):
    return sum(valores) / len(valores)
\end{minted}
  \fonte{Elaborado pelo próprio autor.}
\end{listing}
```

Compile com `-shell-escape`:

```bash
latexmk -pdf -shell-escape documento.tex
```

**Cuidados.**

- É preciso ter o Python e o Pygments instalados (`pip install Pygments`).
- `-shell-escape` permite que o documento execute programas externos: use só com documentos de
  confiança. Em máquinas locais e em integração contínua, isso complica a instalação e a
  segurança. O Overleaf suporta o `minted`.
- Com `cache=false`, o `minted` não cria a pasta `_minted-*`, o que simplifica o repositório.
- O `listings` dispensa tudo isso e é a escolha mais simples para trabalhos acadêmicos.

**Comparação.** Os exemplos [`comparacao-listings.tex`](../../exemplos/codigo/comparacao-listings.tex),
[`comparacao-listings-estilo.tex`](../../exemplos/codigo/comparacao-listings-estilo.tex) e
[`comparacao-minted.tex`](../../exemplos/codigo/comparacao-minted.tex) mostram o mesmo código com o
`listings` sem configuração, com o estilo deste repositório e com o `minted` sem opções.

| | `listings` | `minted` |
|---|---|---|
| Instalação | Só o pacote | Python, Pygments e `-shell-escape` |
| Análise do código | Lista de palavras-chave por linguagem | Analisador léxico completo (Pygments) |
| Linguagens | Cerca de 100, novas com `\lstdefinelanguage` | Mais de 500, todas as do Pygments |
| Destaque | Palavras-chave, comentários e cadeias | Também números, operadores, funções, decoradores |
| Acentos (pdfLaTeX) | Exige `literate` | Funcionam sem configuração |
| Personalização | Total, por chaves do pacote | Por estilos do Pygments e opções do `fancyvrb` |
| Velocidade | Rápido | Mais lento (chama um programa externo) |
| Overleaf e CI | Funciona sem ajustes | Overleaf sim; CI precisa do Pygments |
