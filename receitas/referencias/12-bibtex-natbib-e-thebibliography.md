# 12 – BibTeX, `natbib` e `thebibliography`

**Problema.** Trabalhar com um modelo de periódico ou um documento antigo que não usa o
`biblatex`: referências com BibTeX ou escritas à mão.

**Solução.** As duas formas clássicas, ainda presentes em modelos de revistas e eventos. Para
trabalhos novos, prefira o `biblatex` com o estilo `abnt` (veja o [README desta pasta](README.md)).

## BibTeX com `natbib`

Exemplo completo: [`bibtex-natbib.tex`](../../exemplos/referencias/bibtex-natbib.tex), com as
entradas em [`classico.bib`](../../exemplos/referencias/classico.bib).

```latex
\usepackage[round]{natbib}        % citações entre parênteses

\begin{document}
Citação implícita: \citep{knuth1986}. Citação explícita: \citet{goossens1997}.

\bibliographystyle{plainnat}      % estilo das referências (.bst)
\bibliography{classico}           % arquivo classico.bib, sem a extensão
\end{document}
```

Resultado: "Citação implícita: (Knuth, 1986). Citação explícita: Goossens et al. (1997)."

| `natbib` | Equivalente no `biblatex` | Uso |
|---|---|---|
| `\citep{chave}` | `\parencite{chave}` | citação entre parênteses |
| `\citet{chave}` | `\textcite{chave}` | autor no fluxo da frase |
| `\citep[p.~35]{chave}` | `\parencite[p.~35]{chave}` | com página |

Diferenças em relação ao `biblatex`:

- **O estilo é um arquivo `.bst`** (`plainnat`, `abbrvnat`, o do periódico), escolhido com
  `\bibliographystyle`, e o arquivo `.bib` vai em `\bibliography`, sem a extensão.
- **O programa é o `bibtex`**, não o `biber`. O `latexmk` descobre qual rodar sozinho.
- **Os estilos `.bst` não traduzem os termos.** Com `plainnat`, a lista sai com "and" entre os
  autores, mesmo com o `babel` em português. Para a ABNT com BibTeX, o `abntex2` traz o
  pacote `abntex2cite`, mas o `biblatex-abnt` é o caminho recomendado hoje.
- **Acentos no `.bib`.** O BibTeX clássico não entende UTF-8 em todos os casos: nomes com acento
  podem sair na ordem errada. O `biber` não tem esse problema.

## Lista escrita à mão: `thebibliography`

Exemplo completo: [`thebibliography.tex`](../../exemplos/referencias/thebibliography.tex), sem
arquivo `.bib`.

```latex
O \TeX\ foi criado por Knuth \cite{knuth1986}. Para gráficos, consulte
\cite{goossens1997}.

\begin{thebibliography}{9}   % o argumento é o rótulo mais largo da lista
  \bibitem{knuth1986} KNUTH, D. E. \textbf{The \TeX book}.
    Reading: Addison-Wesley, 1986.
  \bibitem{goossens1997} GOOSSENS, M.; RAHTZ, S.; MITTELBACH, F.
    \textbf{The \LaTeX\ Graphics Companion}. Reading: Addison-Wesley, 1997.
\end{thebibliography}
```

Resultado: "O TeX foi criado por Knuth [1]. Para gráficos, consulte [2].", com a lista numerada
na ordem dos `\bibitem`.

- **A formatação é toda manual.** Negrito, pontuação e ordem dos elementos são escritos em cada
  item; nada confere a norma.
- **Todos os itens aparecem**, citados ou não, e na ordem em que foram escritos.
- **O argumento** (`{9}`, `{99}`) só serve para medir a largura do maior rótulo: use `{99}` para
  listas com 10 a 99 itens.

Serve para um documento curto e isolado. Para qualquer trabalho com muitas referências, ou que
vai ser revisado, o arquivo `.bib` poupa tempo e erros.
