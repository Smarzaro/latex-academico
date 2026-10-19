# 01 – Fórmulas no texto, em destaque e numeradas

**Problema.** Escrever uma fórmula no meio da frase, destacar outra em uma linha própria, numerar
as que serão citadas e alinhar desenvolvimentos de várias linhas.

**Solução.** Modo matemático no texto com `$...$` (ou `\(...\)`), em destaque com `\[...\]` e,
para numerar, os ambientes `equation` e `align` do `amsmath`, citados com `\eqref`.
Exemplo completo: [`modos.tex`](../../exemplos/matematica/modos.tex) (preâmbulo com
`\usepackage{amsmath}`).

## No texto

```latex
No texto, a fórmula fica na linha: $\lim_{x \to \infty} e^{-x} = 0$, \(x^{1/2} = \sqrt{x}\) e
$\int \frac{1}{x}\,dx = \ln\lvert x\rvert + c$. Para não alterar o espaçamento entre as linhas, o
\LaTeX\ reduz frações, limites e integrais.
```

No resultado, o limite sai com o `x \to \infty` ao lado do "lim", e não embaixo, e a fração fica
pequena. Fórmulas altas no meio do texto são sinal de que deveriam estar em destaque.

## Em destaque e numerada

```latex
Em destaque, a fórmula fica centralizada em uma linha própria:
\[
  \int \frac{1}{x}\,dx = \ln\lvert x\rvert + c
\]
e, quando precisa ser citada, é numerada com o ambiente \texttt{equation}:
\begin{equation}\label{eq:normal}
  f(x) = \frac{1}{\sigma\sqrt{2\pi}}\, e^{-\frac{(x-\mu)^2}{2\sigma^2}}
\end{equation}
A Equação~\ref{eq:normal} é a densidade da distribuição normal. Com \verb|\eqref| o número sai
entre parênteses: veja \eqref{eq:normal}.
```

`\ref` produz "1"; `\eqref`, "(1)", a forma usual de citar equações.

## Várias linhas alinhadas

```latex
O ambiente \texttt{align} alinha as linhas no \verb|&| e numera cada uma:
\begin{align}
  f(x) &= (x+a)(x+b) \\
       &= x^2 + (a+b)x + ab
\end{align}
Na versão \texttt{align*} nenhuma linha é numerada; \verb|\notag| retira o número de uma linha e
\verb|\tag{...}| troca o número por um rótulo:
\begin{align}
  f(x) &= (x+a)(x+b) \notag \\
       &= x^2 + (a+b)x + ab \tag{resultado}
\end{align}
```

O `&` marca o ponto de alinhamento (em geral antes do `=`) e `\\` separa as linhas.

| Ambiente | Uso | Numeração |
|---|---|---|
| `$...$` ou `\(...\)` | Fórmula curta dentro da frase | — |
| `\[...\]` ou `equation*` | Uma fórmula em destaque | Nenhuma |
| `equation` | Uma fórmula em destaque | Um número |
| `align` / `align*` | Várias linhas alinhadas | Um por linha / nenhum |

## Ajustes comuns

- **Pequenos espaços:** `\,` antes do `dx` separa o diferencial; `\quad` e `\qquad` dão espaços
  maiores entre fórmulas na mesma linha. Espaços digitados no modo matemático são ignorados.
- **Barras verticais:** `\lvert x\rvert` para o módulo, em vez de `|x|`, dá o espaçamento correto
  de delimitador.
- **Uma fórmula longa em várias linhas, com um só número:** ambiente `split` dentro de `equation`
  ou `multline`, ambos do `amsmath`.
- **Numeração por capítulo** (1.1, 1.2...): `\numberwithin{equation}{chapter}` no preâmbulo.
- **Pontuação:** a fórmula faz parte da frase; vírgula ou ponto final vão dentro do modo
  matemático, no fim da fórmula em destaque.

## Armadilhas

- **Não use `$$...$$`**: é sintaxe do TeX puro, com espaçamento vertical incorreto no LaTeX e
  incompatível com algumas opções de classe. Use `\[...\]`.
- **Linhas em branco:** dentro de uma fórmula em destaque, geram erro (*Missing $ inserted*);
  logo antes dela, começam um parágrafo novo e somam espaço. A fórmula deve ficar no mesmo
  parágrafo do texto que a introduz.
- **`\\` no fim da última linha de um `align`** cria uma linha vazia numerada.
- **Texto em fórmula em itálico estranho:** palavras dentro do modo matemático são lidas como
  produto de variáveis; use `\text{...}` (veja a [receita 03](03-recursos.md)).
- **`\eqref` e `align` vêm do `amsmath`:** sem o pacote, dão *Undefined control sequence* ou
  *Environment align undefined*.
