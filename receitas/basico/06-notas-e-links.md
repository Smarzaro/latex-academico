# 06 – Notas de rodapé e links

**Problema.** Acrescentar notas de rodapé e escrever endereços da web que quebrem bem no fim da
linha e possam ser clicados no PDF.

**Solução.** `\footnote` para as notas, `\url` (com o pacote `xurl`) para endereços e `\href` (do
`hyperref`) para um texto clicável que leva a um endereço.
Exemplo completo: [`notas-e-links.tex`](../../exemplos/basico/notas-e-links.tex).

```latex
\usepackage{xurl}                 % \url com quebra de linha em qualquer ponto
\usepackage[hidelinks]{hyperref}  % links clicáveis no PDF; carregue por último
```

```latex
O \LaTeX\ é distribuído gratuitamente\footnote{Os pacotes ficam no CTAN: \url{https://ctan.org}.}
e tem uma grande comunidade de usuários.\footnote{Dúvidas podem ser enviadas ao
\href{https://tex.stackexchange.com}{TeX Stack Exchange}.}
```

| Comando | Resultado |
|---|---|
| `\footnote{texto}` | Número sobrescrito no texto e a nota no pé da página, numerada automaticamente |
| `\url{endereço}` | O endereço em fonte monoespaçada, sem tratar `_`, `%`, `#` e `~` como comandos |
| `\href{endereço}{texto}` | Só o texto aparece; o endereço fica no link |

## Ajustes comuns

- **`hidelinks`** tira as caixas coloridas que o `hyperref` desenha em volta dos links (elas não
  são impressas, mas poluem a tela). Para links coloridos, use
  `\hypersetup{colorlinks, allcolors=blue}`.
- **Por que `xurl`?** O `\url` padrão só quebra o endereço em alguns caracteres (como `/` e `.`);
  endereços longos acabam passando da margem. O `xurl` permite a quebra em qualquer ponto.
- **Posição da chamada da nota:** coloque o `\footnote` logo depois da palavra ou da pontuação, sem
  espaço antes (um espaço ou quebra de linha antes do comando afasta o número da palavra).

## Armadilhas

- **Carregue o `hyperref` por último.** Ele redefine muitos comandos; os poucos pacotes que pedem
  para vir depois dele (como `cleveref`) dizem isso na documentação.
- **`\href` em texto impresso:** no papel, o leitor não vê o endereço. Em referências e em trabalhos
  que serão impressos, prefira `\url`.
- **Endereços em referências bibliográficas** vão no campo `url` da entrada do `.bib`, e não em
  notas de rodapé (veja as receitas de [referências](../referencias/)).
- **Notas demais** atrapalham a leitura: se a informação é essencial, ela vai no texto; se não é,
  talvez possa sair.
