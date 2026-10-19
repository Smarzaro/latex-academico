# 02 – Matrizes e delimitadores

**Problema.** Escrever matrizes e determinantes com os parênteses, colchetes ou barras do tamanho
do conteúdo.

**Solução.** Os ambientes de matriz do `amsmath` (`pmatrix`, `bmatrix`, `vmatrix`...), que já
trazem os delimitadores e dispensam a especificação de colunas; o ambiente `array` com
`\left`/`\right` quando é preciso controlar o alinhamento das colunas.
Exemplo completo: [`matrizes.tex`](../../exemplos/matematica/matrizes.tex) (preâmbulo com
`\usepackage{amsmath}`).

```latex
Com \texttt{array} e delimitadores ajustáveis:
\[
  A = \left( \begin{array}{ccc}
        a_{11} & a_{12} & a_{13} \\
        a_{21} & a_{22} & a_{23}
      \end{array} \right)
\]
Com os ambientes do \texttt{amsmath} (sem especificação de colunas):
\[
  \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix} \quad
  \begin{bmatrix} 1 & 0 \\ 0 & 1 \end{bmatrix} \quad
  \begin{vmatrix} a & b \\ c & d \end{vmatrix} = ad - bc
\]
```

Como em uma tabela, `&` separa as colunas e `\\` separa as linhas.

| Ambiente | Delimitador |
|---|---|
| `matrix` | nenhum |
| `pmatrix` | ( ) |
| `bmatrix` | [ ] |
| `Bmatrix` | { } |
| `vmatrix` | \| \| (determinante) |
| `Vmatrix` | ‖ ‖ (norma) |

## Ajustes comuns

- **Alinhar colunas à esquerda ou à direita** (por exemplo, números com sinal): `array` com
  `{rrr}` ou `{lll}`, entre `\left(` e `\right)`.
- **Reticências:** `\cdots` (horizontal), `\vdots` (vertical) e `\ddots` (diagonal) para matrizes
  genéricas (n × n).
- **Matriz pequena no meio do texto:** `smallmatrix`, com os delimitadores escritos à mão:
  `$\left(\begin{smallmatrix} 1 & 0 \\ 0 & 1 \end{smallmatrix}\right)$`.
- **Delimitadores ajustáveis em qualquer fórmula:** `\left(` ... `\right)` crescem com o
  conteúdo (frações, somatórios). Para um tamanho fixo, use `\bigl(`, `\Bigl(`, `\biggl(` e os
  correspondentes `\bigr)`, `\Bigr)`, `\biggr)`.

## Armadilhas

- **`\left` sem `\right`** (ou o contrário) dá erro. Quando só um lado tem delimitador, o outro
  recebe um ponto invisível: `\left. ... \right|`.
- **Mais de 10 colunas** em `pmatrix` e afins dão erro; aumente o limite com
  `\setcounter{MaxMatrixCols}{20}`.
- **Os ambientes de matriz só funcionam no modo matemático**: dentro de `\[...\]`, `$...$` ou de
  um ambiente como `equation`.
