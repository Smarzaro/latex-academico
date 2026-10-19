# 03 – Casos, operadores, teoremas e unidades

**Problema.** Escrever funções definidas por partes, conjuntos numéricos e funções com nome
(como seno), apresentar definições, teoremas e demonstrações numerados e grafar números com
unidades de medida no padrão brasileiro.

**Solução.** `amsmath` (`cases`, `\text`, `\DeclareMathOperator`), `amssymb` (`\mathbb`),
`amsthm` (teoremas e demonstração) e `siunitx` (números e unidades).
Exemplo completo: [`recursos.tex`](../../exemplos/matematica/recursos.tex).

```latex
\usepackage{amsmath, amssymb}   % amssymb: \mathbb e outros símbolos
\usepackage{amsthm}             % ambientes de teorema
\usepackage{siunitx}            % números e unidades
\sisetup{locale = DE, output-decimal-marker = {,}}
\newtheorem{teorema}{Teorema}
\theoremstyle{definition}
\newtheorem{definicao}{Definição}
\DeclareMathOperator{\sen}{sen}  % seno em português
```

```latex
\begin{definicao}
O valor absoluto de $x \in \mathbb{R}$ é
\[
  \lvert x \rvert =
  \begin{cases}
    x,  & \text{se } x \geq 0, \\
    -x, & \text{caso contrário.}
  \end{cases}
\]
\end{definicao}

\begin{teorema}[Pitágoras]
Em um triângulo retângulo de catetos $a$, $b$ e hipotenusa $c$, vale $a^2 + b^2 = c^2$.
\end{teorema}

\begin{proof}
Fica como exercício. Note que $\sen^2\theta + \cos^2\theta = 1$.
\end{proof}

A velocidade medida foi de \qty{12,5}{\metre\per\second}, com erro de \qty{0,3}{\percent}.
```

No resultado: "**Definição 1.**" com o texto em letra reta, "**Teorema 1** (Pitágoras)." com o
texto em itálico, "*Demonstração.*" terminada por um quadradinho, e "12,5 m s⁻¹" e "0,3 %".

## O que cada recurso faz

| Recurso | Para quê |
|---|---|
| `cases` | Chave à esquerda e as condições alinhadas no `&` |
| `\text{...}` | Texto normal dentro de fórmula (com os espaços preservados: `\text{se }`) |
| `\mathbb{R}` | Conjuntos numéricos: ℕ, ℤ, ℚ, ℝ, ℂ |
| `\DeclareMathOperator` | Nome de função em letra reta e com o espaçamento de operador (`\sen x`) |
| `\newtheorem{nome}{Título}` | Ambiente numerado; o argumento opcional (`[Pitágoras]`) dá o nome do resultado |
| `\theoremstyle{definition}` | Os ambientes declarados depois dele têm o texto em letra reta |
| `proof` | "Demonstração." com o símbolo de fim de prova |
| `\qty{valor}{unidade}` | Número e unidade com o espaço correto e a vírgula decimal |

## Ajustes comuns

- **Numeração por seção ou capítulo:** `\newtheorem{teorema}{Teorema}[section]` produz "Teorema
  2.1". Para que lema e teorema compartilhem a mesma sequência:
  `\newtheorem{lema}[teorema]{Lema}`.
- **Ambiente sem número:** `\newtheorem*{observacao}{Observação}`.
- **Unidade como fração (m/s):** `\sisetup{per-mode = symbol}`.
- **Só o número ou só a unidade:** `\num{12345,6}` agrupa os milhares; `\unit{\kilo\gram}`
  escreve a unidade sem número.
- **Outras funções em português:** `\DeclareMathOperator{\tg}{tg}`; as que já existem (`\cos`,
  `\log`, `\lim`, `\max`) não precisam ser declaradas.

## Armadilhas

- **`sen` escrito direto** (`$sen x$`) sai em itálico, como o produto das variáveis s, e, n e x.
  Use o operador declarado.
- **Palavras em fórmulas sem `\text`** saem em itálico e sem espaços.
- **`\mathbb` sem `amssymb`** dá *Undefined control sequence*.
- **Ordem no preâmbulo:** `\theoremstyle` vale para os `\newtheorem` que vêm depois dele;
  declare primeiro os ambientes de estilo padrão (teoremas) e depois os de definição.
- **`\qty` e `\unit` são da versão 3 do `siunitx`** (2021). Em instalações antigas, os comandos
  equivalentes são `\SI` e `\si`; prefira atualizar a distribuição.
- **Classes acadêmicas** podem já definir ambientes de teorema: confira antes de criar os seus.
