# 04 – Alinhamento do texto

**Problema.** Alinhar um trecho à esquerda, à direita ou ao centro, em vez do texto justificado
padrão.

**Solução.** Há duas formas: os comandos `\raggedright`, `\raggedleft` e `\centering`, que valem
até o fim do grupo em que estão, e os ambientes `flushleft`, `flushright` e `center`, que delimitam
o trecho e acrescentam espaço vertical antes e depois.
Exemplo completo: [`alinhamento.tex`](../../exemplos/basico/alinhamento.tex).

## Com comandos

```latex
\begin{minipage}{5cm}
  \raggedright
  Um bloco de texto alinhado à esquerda, com a margem direita irregular.
\end{minipage}

\bigskip
\begin{minipage}{5cm}
  \raggedleft
  Um bloco de texto alinhado à direita, com a margem esquerda irregular.
\end{minipage}

\bigskip
\begin{minipage}{5cm}
  \centering
  Um bloco de texto centralizado.
\end{minipage}
```

No exemplo, cada `minipage` limita o efeito do comando ao seu interior: fora dela o texto volta a
ser justificado.

## Com ambientes

```latex
\begin{flushleft}
  Texto alinhado à esquerda.
\end{flushleft}

\begin{flushright}
  Texto alinhado à direita.
\end{flushright}

\begin{center}
  Texto centralizado.
\end{center}
```

## Qual usar

| Situação | Use |
|---|---|
| Centralizar uma imagem ou tabela dentro de `figure` ou `table` | `\centering` (o ambiente `center` somaria espaço vertical ao do flutuante) |
| Um trecho isolado no meio do texto | `center`, `flushleft` ou `flushright` |
| O alinhamento de uma célula, caixa ou `minipage` inteira | o comando dentro dela |
| Uma região grande, sem criar ambiente | o comando entre chaves: `{\raggedright ... \par}` |

## Armadilhas

- **Um comando solto vale até o fim do documento** (ou do ambiente em que está). Limite-o com um
  ambiente ou com chaves.
- **Termine o parágrafo dentro do grupo.** Em `{\centering Texto.}` o parágrafo só termina depois
  do `}`, quando o comando já perdeu o efeito; escreva `{\centering Texto.\par}`.
- **Texto alinhado à esquerda com hifenização.** `\raggedright` quase não hifeniza e deixa a margem
  direita muito irregular em colunas estreitas; o comando `\RaggedRight` do pacote `ragged2e`
  mantém a hifenização.
