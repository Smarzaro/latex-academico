# 02 – Referências que escrevem o tipo: `\autoref` e `\cref`

**Problema.** Escrever "Figura~\ref{...}", "Seção~\ref{...}" à mão é repetitivo e sujeito a
inconsistência (uma figura citada como "Tabela", "seção" ora com maiúscula, ora sem).

**Solução.** `\autoref` (do `hyperref`) escreve o tipo e o número, e todo o texto vira link.
O `cleveref` vai além: `\cref` com minúscula, `\Cref` com maiúscula, plural e vários rótulos de
uma vez.
Exemplo completo: [`autoref-cleveref.tex`](../../exemplos/referencia-cruzada/autoref-cleveref.tex).

```latex
\usepackage[hidelinks]{hyperref}   % links e \autoref
\usepackage[brazilian]{cleveref}   % depois do hyperref; nomes em português
% só para elementos que o pacote não conhece (ex.: um flutuante "quadro"),
% ou para trocar um nome: \crefname{tipo}{singular}{plural}
\crefname{quadro}{quadro}{quadros}
\Crefname{quadro}{Quadro}{Quadros}
```

A opção `brazilian` traz os nomes (seção, tabela, figura, capítulo, apêndice, item...) e as
conjunções ("seções 1 e 2", "seções 1 a 3"). Ela vai no próprio `cleveref` (ou nas opções da classe):
a opção dada só ao `babel` não chega até ele.

```latex
\section{Introdução}\label{sec:intro}
Com \verb|\autoref|: veja a \autoref{sec:metodo}. Com \verb|\cref|: veja a \cref{sec:metodo};
no início da frase, \verb|\Cref|: \Cref{sec:metodo} descreve o método. Vários rótulos de uma
vez: \cref{sec:intro,sec:metodo}; uma tabela: \cref{tab:dados}.

\section{Método}\label{sec:metodo}
```

No resultado:

| Código | Saída |
|---|---|
| `\autoref{sec:metodo}` | Seção 2 |
| `\cref{sec:metodo}` | seção 2 |
| `\Cref{sec:metodo}` | Seção 2 |
| `\cref{sec:intro,sec:metodo}` | seções 1 e 2 |
| `\cref{tab:dados}` | tabela 1 |

## Qual usar

- **Só `hyperref`:** `\autoref` basta na maioria dos trabalhos. Com o `babel` em português, os
  nomes já saem traduzidos ("Capítulo", "Seção", "Figura", "Tabela") e sempre com maiúscula.
- **`cleveref`:** quando se quer o nome em minúscula no meio da frase, plurais e listas de rótulos
  (`\cref{fig:a,fig:b,fig:c}`). Carregue-o com a opção `brazilian`, como no exemplo.

Escolha um dos dois e use-o no documento todo.

## Ajustes comuns

- **Tipos novos no `cleveref`:** um flutuante criado no preâmbulo (`quadro`, `grafico`) precisa
  de um par `\crefname`/`\Crefname`, como no exemplo; sem ele, sai `??` no lugar do nome.
- **Abreviações:** com a opção `brazilian`, figuras e equações saem abreviadas no meio da frase
  ("fig. 1", "eq. (1)"). Para o nome inteiro, use `\usepackage[brazilian, noabbrev]{cleveref}`.
- **Ambientes novos no `\autoref`** (como um flutuante `quadro`): o nome vem do comando
  `\<contador>autorefname`, por exemplo `\newcommand{\quadroautorefname}{Quadro}`.
- **Intervalos:** `\crefrange{fig:a}{fig:d}` produz "figs. 1 a 4" (ou "figuras 1 a 4", com `noabbrev`).

## Armadilhas

- **Ordem dos pacotes:** `cleveref` depois do `hyperref` (é uma das exceções à regra de carregar o
  `hyperref` por último).
- **Não escreva o tipo duas vezes:** `Figura~\autoref{fig:x}` sai como "Figura Figura 1".
- **Classes acadêmicas** podem já carregar o `hyperref` ou definir os nomes: consulte a
  documentação da classe antes de redefinir.
