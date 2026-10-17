# 06 – Quadro bem formatado

**Problema.** Apresentar informação textual em linhas e colunas (requisitos, tecnologias,
comparações, cronogramas) com bordas fechadas e texto bem distribuído.

**Solução.** `tabularx` com colunas `X` (largura automática) e colunas `p{largura}` com
`\raggedright\arraybackslash` (evitam espaçamento irregular de palavras em colunas estreitas).
Aumentar o `\arraystretch` para 1,2 ou 1,3 melhora muito a leitura.

A `abntex2` não define o ambiente `quadro`. Declare-o no preâmbulo (o `\newfloat` é do `memoir`):

```latex
\newfloat{quadro}{loq}{Quadro}
\newlistof{listofquadros}{loq}{Lista de quadros}   % \listofquadros imprime a lista
```

Exemplo completo: [`quadro-requisitos.tex`](../../exemplos/tabelas/quadro-requisitos.tex).

```latex
\usepackage{tabularx}
\usepackage{array}
```

```latex
\begin{quadro}[htbp]
  \caption{Requisitos funcionais do sistema (exemplo)}\label{qua:requisitos}
  \renewcommand{\arraystretch}{1.25}
  \begin{tabularx}{\textwidth}{|c|>{\raggedright\arraybackslash}p{3.6cm}|X|c|}
    \hline
    \textbf{ID} & \textbf{Requisito} & \textbf{Descrição} & \textbf{Prioridade} \\
    \hline
    RF01 & Cadastrar usuário & O sistema deve permitir que o visitante crie uma conta... & Alta \\
    \hline
  \end{tabularx}
  \fonte{Elaborado pelo próprio autor.}
\end{quadro}
```

## Variações

- **Cabeçalho centralizado.** Em um quadro com texto à esquerda, centralize os cabeçalhos com um
  `\multicolumn{1}{|c|}{...}` de uma só coluna. Para reduzir a letra de um quadro denso, use
  `\small` dentro do ambiente. Exemplo:
  [`quadro-tecnologias.tex`](../../exemplos/tabelas/quadro-tecnologias.tex).
- **Siglas.** Valem dentro de quadros, com a ressalva da [receita 03](03-tabela-simples.md) sobre
  a expansão de siglas em `tabularx`.
