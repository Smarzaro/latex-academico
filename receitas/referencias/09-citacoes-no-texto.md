# 09 – Citações no texto

O sistema de chamada adotado é o **autor-data** (NBR 10520:2023). O sistema numérico não pode ser
usado quando há notas. Exemplo completo e compilável:
[`citacoes.tex`](../../exemplos/referencias/citacoes.tex).

## Comandos e resultado

| Comando | Resultado |
|---|---|
| `\cite{ex-livro}` | (Huberman, 1986) — um autor |
| `\cite[p.~35]{ex-livro}` | (Huberman, 1986, p. 35) — com página |
| `\cite{ex-livro,ex-artigo}` | (Huberman, 1986; Hevner *et al.*, 2004) — várias obras, em ordem alfabética |
| `\cite{ex-livro-3}` | (Passos; Fonseca; Chaves, 1995) — três autores |
| `\cite{ex-livro-4}` | (Gamma *et al.*, 2000) — quatro ou mais autores (a norma permite também citar todos, sempre da mesma forma) |
| `\textcite{ex-livro}` | Huberman (1986) — no fluxo da frase |
| `\textcite[p.~35]{ex-livro-3}` | Passos, Fonseca e Chaves (1995, p. 35) |
| `\cite{ex-entidade}` | (Universidade Federal de Viçosa, 1999) — autor institucional |
| `\cite{ex-norma}` | (Associação Brasileira de Normas Técnicas, 2024) |
| `\cite{ex-sem-autor}` | (Pequena [...], 2012) — sem autoria |
| `\cite{ex-sem-autor-artigo}` | (Os grandes [...], 1981) — sem autoria, com `shorttitle` |
| `\cite{ex-reeside-a,ex-reeside-b}` | (Reeside, 1927a,b) — mesmo autor e ano: letras a, b |
| `\textapud{ex-livro}{ex-livro-3}` | Huberman (1986 *apud* Passos; Fonseca; Chaves, 1995) — citação de citação; só a obra consultada entra na lista |

Use `~` (espaço sem quebra) antes do número da página: `p.~35`. As citações sem autoria e o
formato "[...]" dependem dos ajustes da [receita 02](02-ajustes-finos.md).

## Outras regras da NBR 10520:2023

- **Supressões** no trecho citado são indicadas por `[...]`; interpolações e comentários, por
  `[ ]`; ênfase por sublinhado, negrito ou itálico, seguida de "*grifo nosso*" ou "*grifo próprio*"
  na chamada.
- **Tradução** própria de trecho citado: acrescente *tradução nossa* na chamada.
- Citações diretas de documento **sem paginação** indicam a localização do trecho (`local.`,
  capítulo, artigo etc.).
- O **ponto final** encerra a frase, não a citação.
- **Citação direta longa** (mais de três linhas) vai em parágrafo próprio, com recuo padronizado
  (a norma recomenda 4 cm), em letra menor, espaço simples e sem aspas; a classe `abntex2` oferece o ambiente `citacao`.
