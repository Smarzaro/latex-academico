# 01 – Tabela: `\IBGEtab` ou ambiente `tabela`

**Problema.** Montar uma tabela no padrão IBGE (título acima, fonte e nota abaixo, tudo na
largura da tabela) e saber o que muda entre a classe `abntex2` e a `abntex2-ufv`.

**Solução.** Na `abntex2`, o comando `\IBGEtab`; na `abntex2-ufv`, o ambiente `tabela`, com os
mesmos três argumentos na mesma ordem: título, conteúdo e rodapé. A tabela é a mesma nos dois
exemplos, para comparar o resultado lado a lado:
[`tabela-abntex2.tex`](../../exemplos/abntex2-ufv/tabela-abntex2.tex) e
[`tabela-ufv.tex`](../../exemplos/abntex2-ufv/tabela-ufv.tex).

Preâmbulo comum (linhas do `booktabs` e alinhamento decimal do `siunitx`):

```latex
\usepackage{booktabs}                 % \toprule, \midrule, \bottomrule
\usepackage{siunitx}                  % colunas S: alinhamento decimal
\sisetup{output-decimal-marker = {,}, group-separator = {.}, group-minimum-digits = 4}
```

## Classe abntex2: `\IBGEtab`

```latex
\begin{table}[htbp]
\IBGEtab{\caption{Usuários ativos e tempo médio de sessão por plataforma}\label{tab:abntex2}}{%
  \begin{tabular}{l S[table-format=5.0] S[table-format=2.1]}
    \toprule
    \textbf{Plataforma} & {\textbf{Usuários (un.)}} & {\textbf{Sessão (min)}} \\
    \midrule
    Web     & 12840 &  8,4 \\
    Android &  9317 & 11,9 \\
    iOS     &  4102 & 12,3 \\
    \bottomrule
  \end{tabular}%
}{\fonte{Elaborado pelo próprio autor.}\nota{Dados fictícios, apenas para exemplo.}}
\end{table}
```

## Classe abntex2-ufv: ambiente `tabela`

```latex
\begin{table}[htbp]
\begin{tabela}{\caption{Usuários ativos e tempo médio de sessão por plataforma}\label{tab:ufv}}%
              {\elaboracaopropria\nota{Dados fictícios, apenas para exemplo.}}
  \begin{tabular}{l S[table-format=5.0] S[table-format=2.1]}
    \toprule
    \textbf{Plataforma} & {\textbf{Usuários (un.)}} & {\textbf{Sessão (min)}} \\
    \midrule
    Web     & 12840 &  8,4 \\
    Android &  9317 & 11,9 \\
    iOS     &  4102 & 12,3 \\
    \bottomrule
  \end{tabular}
\end{tabela}
\end{table}
```

## O que muda no resultado

- Nos dois casos o título fica alinhado à esquerda da tabela, com as linhas seguintes recuadas
  sob o texto do título, e o rodapé tem a largura da tabela.
- No ambiente `tabela`, a fonte e a nota saem em linhas seguidas, em espaço simples e letra
  menor; no `\IBGEtab` da `abntex2`, há um espaço entre elas.
- O ambiente `tabela` também reduz a letra do conteúdo, como o `\IBGEtab`.
- `\elaboracaopropria` é um atalho da `abntex2-ufv` para `\fonte{Elaborado pelo próprio autor}`
  (sem ponto final). Na `abntex2` escreva o `\fonte{...}` por extenso.

## Ajustes comuns e armadilhas

- O ambiente `tabela` não é um float: ele vai **dentro** do `table`, que é quem numera e posiciona
  a tabela.
- No `\IBGEtab`, o conteúdo é um argumento entre chaves; termine o `\end{tabular}` com `%` para não
  acrescentar um espaço depois da tabela. No ambiente `tabela`, o conteúdo fica entre o
  `\begin` e o `\end`, sem chaves.
- A largura do título e do rodapé é a da tabela; para uma largura mínima maior (uma tabela muito
  estreita com título longo), use o argumento opcional: `\begin{tabela}[8cm]{...}{...}`.
- O título vai no primeiro argumento, com o `\label` **depois** do `\caption`.

## Lista de conferência

- [ ] `table` por fora, `tabela` (ou `\IBGEtab`) por dentro.
- [ ] Título acima, fonte obrigatória abaixo (mesmo que seja do próprio autor).
- [ ] Sem linhas verticais; colunas numéricas com `S` e vírgula decimal.

Para tabelas na `abntex2` em geral (tabela ou quadro, tabela longa, células mescladas), veja as
receitas de [tabelas e quadros](../tabelas/).
