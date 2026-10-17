# 02 – Uso básico

**Problema.** Mostrar um trecho de código com título, numeração e fonte; listar parte de um
arquivo sem copiar o código; citar um trecho curto no meio de uma frase.

**Solução.** `lstlisting` (código no texto), `lstinputlisting` (código de um arquivo) e
`lstinline` (no meio da frase). Pressupõe a configuração da
[receita 01](01-listings-configuracao.md).

## Código no texto

Exemplo completo: [`listings-basico.tex`](../../exemplos/codigo/listings-basico.tex).

```latex
\begin{lstlisting}[language=Python,
    caption={Função em Python, com numeração de linhas e sintaxe colorida},
    label={cod:python}]
def media(valores):
    """Calcula a média aritmética de uma lista."""
    if not valores:
        return 0.0
    total = 0  # acumulador
    for v in valores:
        total += v
    return total / len(valores)
\end{lstlisting}
\fonte{Elaborado pelo próprio autor.}
```

Cite no texto com `Código~\ref{cod:python}` e explique o que o código faz. O `\fonte{...}` (da
`abntex2`) coloca a fonte logo abaixo; é obrigatória, mesmo para código do próprio autor.

## Parte de um arquivo

Em vez de copiar o código, use `\lstinputlisting` com `firstline`/`lastline` (ou `linerange`):
o código do texto nunca fica diferente do arquivo. Exemplo:
[`listings-arquivo.tex`](../../exemplos/codigo/listings-arquivo.tex).

```latex
\lstinputlisting[language=Python, firstline=4, lastline=11, numbers=none,
    caption={Trecho de um arquivo (linhas 4 a 11), sem numeração de linhas},
    label={cod:arquivo}]{assets/exemplo.py}
\fonte{Arquivo \texttt{exemplo.py}, do autor.}
```

## No meio de uma frase

`\lstinline[language=Python]{total += v}` soma o valor ao acumulador. Como o código vem entre
delimitadores (aqui, chaves), evite o delimitador dentro do trecho.
