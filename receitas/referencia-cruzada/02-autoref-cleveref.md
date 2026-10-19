# 02 – Referências que escrevem o tipo: `\autoref` e `\cref`

**Problema.** Escrever "Figura~\ref{...}", "Seção~\ref{...}" à mão é repetitivo e sujeito a
inconsistência (uma figura citada como "Tabela", "seção" ora com maiúscula, ora sem).

**Solução.** `\autoref` (do `hyperref`) escreve o tipo e o número, e todo o texto vira link.
O `cleveref` vai além: `\cref` com minúscula, `\Cref` com maiúscula, plural e vários rótulos de
uma vez.
Exemplo completo: [`autoref-cleveref.tex`](../../exemplos/referencia-cruzada/autoref-cleveref.tex).

```latex
\usepackage[hidelinks]{hyperref}   % links e \autoref
\usepackage{cleveref}              % depois do hyperref
% nomes usados pelo \cref/\Cref (singular, plural)
\crefname{section}{seção}{seções}
\Crefname{section}{Seção}{Seções}
\crefname{table}{tabela}{tabelas}
\Crefname{table}{Tabela}{Tabelas}
% o cleveref não traduz as conjunções para o português
\newcommand{\crefpairconjunction}{ e }
\newcommand{\crefmiddleconjunction}{, }
\newcommand{\creflastconjunction}{ e }
\newcommand{\crefrangeconjunction}{ a }
```

```latex
\section{Introdução}\label{sec:intro}
Com \verb|\autoref|: veja a \autoref{sec:metodo}. Com \verb|\cref|: veja a \cref{sec:metodo};
no início da frase, \verb|\Cref|: \Cref{sec:metodo} descreve o método. Vários rótulos de uma
vez: \cref{sec:intro,sec:metodo}.

\section{Método}\label{sec:metodo}
```

No resultado:

| Código | Saída |
|---|---|
| `\autoref{sec:metodo}` | Seção 2 |
| `\cref{sec:metodo}` | seção 2 |
| `\Cref{sec:metodo}` | Seção 2 |
| `\cref{sec:intro,sec:metodo}` | seções 1 e 2 |

## Qual usar

- **Só `hyperref`:** `\autoref` basta na maioria dos trabalhos. Com o `babel` em português, os
  nomes já saem traduzidos ("Capítulo", "Seção", "Figura", "Tabela") e sempre com maiúscula.
- **`cleveref`:** quando se quer o nome em minúscula no meio da frase, plurais e listas de rótulos
  (`\cref{fig:a,fig:b,fig:c}`). Ele exige definir os nomes em português, como no exemplo.

Escolha um dos dois e use-o no documento todo.

## Ajustes comuns

- **Outros tipos no `cleveref`:** acrescente um par `\crefname`/`\Crefname` para cada tipo usado
  (`chapter`, `figure`, `equation`, `enumi` para itens de lista...). Sem isso, os tipos comuns saem
  com a abreviação em inglês ("fig. 1", "eq. (1)") e os ambientes próprios, como teoremas, com
  `??` no lugar do nome.
- **Ambientes novos no `\autoref`** (como um flutuante `quadro`): o nome vem do comando
  `\<contador>autorefname`, por exemplo `\newcommand{\quadroautorefname}{Quadro}`.
- **Intervalos:** `\crefrange{fig:a}{fig:d}` produz "figuras 1 a 4", desde que o nome `figure`
  esteja definido e com a conjunção `\crefrangeconjunction` do exemplo (o padrão é "to").

## Armadilhas

- **Ordem dos pacotes:** `cleveref` depois do `hyperref` (é uma das exceções à regra de carregar o
  `hyperref` por último).
- **Não escreva o tipo duas vezes:** `Figura~\autoref{fig:x}` sai como "Figura Figura 1".
- **Classes acadêmicas** podem já carregar o `hyperref` ou definir os nomes: consulte a
  documentação da classe antes de redefinir.
