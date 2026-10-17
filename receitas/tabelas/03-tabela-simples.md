# 03 – Tabela bem formatada

**Problema.** Fazer uma tabela no padrão IBGE: sem linhas verticais, linhas horizontais só no
topo, sob o cabeçalho e na base, números alinhados pela vírgula decimal e título e rodapé na
largura da tabela.

**Solução.** `booktabs` (as linhas), `siunitx` (colunas `S`, alinhamento decimal) e `\IBGEtab`
do `abntex2` (título, tabela e rodapé).
Exemplo completo: [`tabela-simples.tex`](../../exemplos/tabelas/tabela-simples.tex).

```latex
\usepackage{booktabs}
\usepackage{siunitx}
\sisetup{output-decimal-marker = {,}, group-separator = {.}, group-minimum-digits = 4}
```

```latex
\begin{table}[htbp]
\IBGEtab{%
  \caption{Usuários ativos e tempo médio de sessão por plataforma}\label{tab:simples}%
}{%
  \begin{tabular}{l S[table-format=5.0] S[table-format=2.1] S[table-format=2.1]}
    \toprule
    \textbf{Plataforma} & {\textbf{Usuários (un.)}} & {\textbf{Sessão (min)}} & {\textbf{Rejeição (\%)}} \\
    \midrule
    Web     & 12840 &  8,4 & 31,2 \\
    Android &  9317 & 11,9 & 24,7 \\
    iOS     &  4102 & 12,3 & 22,0 \\
    \bottomrule
  \end{tabular}%
}{%
  \fonte{Elaborado pelo próprio autor.}%
  \nota{Dados fictícios, apenas para exemplo.}%
}
\end{table}
```

Entre chaves `{...}`, os cabeçalhos das colunas `S` protegem o texto da formatação numérica.

## Ajustes mais comuns

- **Alinhamento.** Texto à esquerda (`l`), números pela vírgula decimal (`S[table-format=3.1]`,
  em que o formato indica o máximo de dígitos antes e depois da vírgula), colunas centralizadas
  (`c`) só para códigos e marcas.
- **Unidades.** Coloque a unidade no cabeçalho ("Tempo (ms)"), não em cada célula.
- **Largura.** Se a tabela passa das margens, reduza a fonte com `\small` ou `\footnotesize`
  antes do `tabular` (o tamanho deve ser uniforme em todas as tabelas), diminua o espaço entre
  colunas com `\setlength{\tabcolsep}{3pt}` ou use `tabularx` com colunas `X`, que se ajustam à
  largura do texto. `\resizebox{\textwidth}{!}{...}` resolve, mas encolhe a letra de modo
  irregular: deixe como último recurso.
- **Altura das linhas.** `\renewcommand{\arraystretch}{1.2}` dá mais respiro (use dentro do
  ambiente, para não afetar o documento todo).
- **Sinais convencionais (IBGE).** Hífen (–) para zero absoluto; três pontos (…) para dado não
  disponível; `x` para dado omitido. Não deixe células vazias sem explicação.
- **Notas.** `\nota{...}` explica a tabela como um todo; para notas de células específicas, use
  letras sobrescritas (`\textsuperscript{a}`) e explique-as no rodapé.
- **Agrupamento de milhares.** `group-minimum-digits = 4` agrupa a partir de quatro dígitos
  (`9.317`); o padrão do `siunitx` só agrupa a partir de cinco.

> **Atenção às siglas dentro de tabelas.** Em `tabularx` e `longtable` o conteúdo das células
> pode ser composto mais de uma vez, o que confunde pacotes de siglas (como o `acro`). Faça a
> primeira ocorrência de cada sigla no texto corrido e use a sigla pura nas células.
