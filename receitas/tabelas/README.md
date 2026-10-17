# Tabelas e quadros

Receitas para apresentar dados e informações em linhas e colunas em documentos acadêmicos
(padrão ABNT, com a apresentação tabular do IBGE). Os exemplos compiláveis estão em
[`exemplos/tabelas/`](../../exemplos/tabelas/).

| Receita | O que resolve |
|---|---|
| [01 – Tabela ou quadro?](01-tabela-ou-quadro.md) | Qual dos dois usar e por que não classificar tudo como tabela |
| [02 – Título, fonte, legenda e nota](02-titulo-fonte-legenda-nota.md) | Os quatro elementos de toda ilustração e tabela e a ordem deles |
| [03 – Tabela bem formatada](03-tabela-simples.md) | `booktabs`, `siunitx` e `\IBGEtab`; ajustes de largura, unidades e notas |
| [04 – Células mescladas](04-celulas-mescladas.md) | Cabeçalhos agrupados com `multicolumn`, `multirow` e `cmidrule` |
| [05 – Tabela longa](05-tabela-longa.md) | `longtable`: várias páginas, cabeçalho repetido e "Continua" |
| [06 – Quadro bem formatado](06-quadro.md) | Bordas fechadas, `tabularx` e colunas de largura fixa |

## Lista de conferência

- O conteúdo é numérico (tabela) ou textual (quadro)?
- O título está acima, com "Tabela N" ou "Quadro N", e a fonte (e, se houver, a legenda e a
  nota) abaixo, à esquerda e em espaço simples?
- A tabela ou o quadro é citado e comentado no texto (`\autoref{rótulo}`)?
- A tabela não tem linhas verticais e o quadro tem as bordas fechadas?
- Os números estão alinhados pela vírgula e as unidades estão no cabeçalho?
- O tamanho de letra e o espaçamento são uniformes entre as tabelas?
- As listas de tabelas e de quadros estão no pré-textual?
