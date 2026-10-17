# 02 – Título, fonte, legenda e nota

**Problema.** Toda ilustração (figura, quadro, gráfico, código) e toda tabela têm quatro
elementos, e a ordem importa (ABNT NBR 14724).

| Elemento | Papel | No LaTeX (classe abntex2) |
|---|---|---|
| **Título** | Identifica o objeto; vem **acima**, com a palavra designativa, o número, um travessão e o texto ("Figura 3 – Arquitetura do sistema") | `\caption{...}` |
| **Fonte** | Indica de onde vem a informação; é **obrigatória**, mesmo para obra do próprio autor ("Elaborado pelo próprio autor") | `\fonte{...}` |
| **Legenda** | Explica símbolos, siglas, cores ou partes da ilustração; só quando há algo a explicar | texto da própria ilustração ou, em classes que o definem, `\legenda{...}` |
| **Nota** | Observações e informações complementares (data da coleta, ressalvas, método) | `\nota{...}` |

Fonte, legenda e nota formam o **rodapé**: ficam abaixo, em linhas seguidas, em espaço simples,
tamanho 10 e alinhadas à esquerda do objeto.

**Cabeçalho centralizado, rodapé à esquerda.** Para figuras, diagramas, gráficos, quadros e
códigos, a NBR 14724/2025 recomenda **centralizar o cabeçalho** (tipo, número e título) e
**alinhar à esquerda o rodapé**, respeitando as margens da ilustração. Nas tabelas, o título
costuma ficar à esquerda (padrão do IBGE).

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

> **Nota para quem usa a classe `abntex2-ufv`.** A classe traz os ambientes `ilustracao` e
> `tabela`, que medem o conteúdo e dão ao título e ao rodapé a largura dele, aceitam `\legenda`
> e deixam fonte, legenda e nota em espaço simples. A documentação da classe os descreve.
