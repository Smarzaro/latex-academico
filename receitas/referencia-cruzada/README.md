# Referência cruzada

Referências a capítulos, seções, figuras, tabelas, equações e itens de lista que se atualizam
sozinhas quando o texto muda: nada de "Figura 3" digitado à mão. Os exemplos compiláveis estão em
[`exemplos/referencia-cruzada/`](../../exemplos/referencia-cruzada/).

| Receita | O que resolve |
|---|---|
| [01 – Rótulos e referências](01-label-ref-pageref.md) | `\label`, `\ref` e `\pageref` em itens de lista, figuras, tabelas e seções; prefixos dos rótulos |
| [02 – Referências que escrevem o tipo](02-autoref-cleveref.md) | `\autoref` (`hyperref`) e `\cref`/`\Cref` (`cleveref`) em português |

Para as equações (`\eqref`), veja a
[receita 01 de matemática](../matematica/01-modos-e-equacoes.md).

## Lista de conferência

- Toda figura, tabela e quadro é citado no texto antes de aparecer (ou logo depois)?
- O `\label` de cada flutuante está depois do `\caption`?
- Nenhuma referência sai como "??" e o log não tem *There were undefined references*?
- Os rótulos seguem um padrão de prefixos (`cap:`, `sec:`, `fig:`, `tab:`, `eq:`)?
- O tipo do elemento ("Figura", "Seção") é escrito sempre do mesmo jeito: à mão com `~\ref` ou
  sempre por `\autoref`/`\cref`, sem misturar?
