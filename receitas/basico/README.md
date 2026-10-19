# Primeiros passos

Receitas para quem está começando: a estrutura de um documento, o preâmbulo para textos em
português, como o LaTeX trata espaços e parágrafos, as divisões do texto, o alinhamento, a
hifenização, as notas de rodapé, os links e os comandos próprios. Os exemplos compiláveis estão em
[`exemplos/basico/`](../../exemplos/basico/).

| Receita | O que resolve |
|---|---|
| [01 – Primeiro documento e preâmbulo em português](01-primeiro-documento.md) | Classe, preâmbulo e corpo; `fontenc`, `lmodern` e `babel`; por que não usar mais `inputenc` |
| [02 – Espaços, parágrafos e comentários](02-espacos-paragrafos-comentarios.md) | Espaços ignorados, linha em branco, `%`, `\hspace`, `\vspace`, recuo e entrelinhas com `setspace` |
| [03 – Divisões do documento](03-divisoes.md) | `\chapter`, `\section`... até `\subparagraph`; numeração e sumário |
| [04 – Alinhamento do texto](04-alinhamento.md) | `\raggedright`, `\centering` e os ambientes `flushleft`, `flushright` e `center` |
| [05 – Hifenização](05-hifenizacao.md) | Palavras que o LaTeX não sabe dividir: `\-` e `\hyphenation` |
| [06 – Notas de rodapé e links](06-notas-e-links.md) | `\footnote`, `\url` com `xurl` e `\href` com `hyperref` |
| [07 – Comandos próprios](07-comandos-proprios.md) | `\newcommand` sem argumento, com argumento e com argumento opcional |

## Lista de conferência

- O documento compila sem erros a partir de um preâmbulo mínimo (`fontenc`, `lmodern`, `babel`)?
- Os termos automáticos ("Capítulo", "Sumário") saem em português?
- Os parágrafos são separados por linha em branco, e não por `\\`?
- As divisões seguem a hierarquia, sem pular níveis (seção, subseção, subsubseção)?
- O log não tem avisos de `Overfull \hbox` (texto passando da margem) sem tratamento?
- O `hyperref` é o último pacote carregado (salvo os que pedem para vir depois dele)?
