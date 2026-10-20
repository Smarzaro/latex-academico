# 02 – Título, fonte, legenda e nota

**Problema.** Toda ilustração (figura, quadro, gráfico, código) e toda tabela têm quatro
elementos, e a ordem importa (ABNT NBR 14724).

| Elemento | Papel | No LaTeX (classe abntex2) |
|---|---|---|
| **Título** | Identifica o objeto; vem **acima**, com a palavra designativa, o número, um travessão e o texto ("Figura 3 – Arquitetura do sistema") | `\caption{...}` |
| **Fonte** | Indica de onde vem a informação; é **obrigatória**, mesmo para obra do próprio autor ("Elaborado pelo próprio autor") | `\fonte{...}` |
| **Legenda** | Explica símbolos, siglas, cores ou partes da ilustração; só quando há algo a explicar | texto da própria ilustração ou, em classes que o definem, `\legenda{...}` |
| **Nota** | Observações e informações complementares (data da coleta, ressalvas, método) | `\nota{...}` |

Fonte, legenda e nota formam o **rodapé**: vêm logo abaixo, nessa ordem, em espaço simples e em
letra menor que a do texto, de tamanho uniforme (NBR 14724:2024, 5.1, 5.2 e 5.8).

**Na largura da ilustração.** A norma pede que tipo, número, título, fonte, legenda e notas
**acompanhem as margens da ilustração** (5.8): numa imagem estreita, o título e o rodapé ficam na
largura dela, e não na do texto. Ela não diz se centralizam ou alinham à esquerda; o "cabeçalho
centralizado, rodapé à esquerda" é regra de manuais de instituições, como o da UFV (classe
`abntex2-ufv`). Nas tabelas, o padrão do IBGE põe o título à esquerda.

**Em tabelas, use `\IBGEtab`.** O comando do `abntex2` recebe o título, a tabela e o rodapé,
nessa ordem, e dá à tabela o espaçamento correto (veja a [receita 03](03-tabela-simples.md)):

```latex
\begin{table}[htbp]
\IBGEtab{%
  \caption{Título}\label{tab:exemplo}%
}{%
  \begin{tabular}{...} ... \end{tabular}%
}{%
  \fonte{Elaborado pelo próprio autor.}%
  \nota{Observação.}%
}
\end{table}
```

**Fora do `\IBGEtab`, use o `threeparttable`.** O ambiente do pacote `threeparttable` mede a
tabela e dá ao título, à fonte e à nota a largura dela, com o `tabular` comum:

```latex
\begin{table}[htbp]
  \centering
  \begin{threeparttable}
    \caption{Título}\label{tab:exemplo}
    \begin{tabular}{...} ... \end{tabular}
    \fonte{Elaborado pelo próprio autor.}
    \nota{Observação.}
  \end{threeparttable}
\end{table}
```

As duas formas, lado a lado: [`tabela-fonte-nota.tex`](../../exemplos/tabelas/tabela-fonte-nota.tex).
Em figuras, o mesmo efeito vem de uma `minipage` com a largura da imagem (receita
[figuras/01](../figuras/01-incluir-imagem.md)).

> **Nota para quem usa a classe `abntex2-ufv`.** A classe traz os ambientes `ilustracao` e
> `tabela`, que medem o conteúdo e dão ao título e ao rodapé a largura dele, aceitam `\legenda`
> e deixam fonte, legenda e nota em espaço simples. A documentação da classe os descreve.
