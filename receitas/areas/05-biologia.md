# 05 – Biologia

**Problema.** Desenhar um heredograma (homens em quadrados, mulheres em círculos, afetados
preenchidos) e montar o quadro de Punnett de um cruzamento.

**Solução.** O pacote `genealogytree` para o heredograma, com estilos próprios para cada símbolo,
e um `tabular` comum para o quadro de Punnett. Exemplo completo:
[`biologia.tex`](../../exemplos/areas/biologia.tex).

```latex
\usepackage[all]{genealogytree}       % heredogramas e árvores genealógicas
\usepackage{array}
```

## Heredograma

```latex
Heredograma de uma característica recessiva (símbolos cheios: afetados):
\begin{center}
\begin{genealogypicture}[node size=9mm, level size=9mm, level distance=9mm,
    box={colback=white, colframe=black, boxrule=0.6pt, boxsep=0pt,
         left=0pt, right=0pt, halign=center, valign=center, fontupper=\tiny},
    edges={foreground={black, line width=0.6pt}, background={white}},
    homem/.style={box={sharp corners}},          % quadrado
    mulher/.style={box={arc=4.5mm}},             % círculo (arco = metade do lado)
    afetado/.style={box={colback=black!75, colupper=white}}]
  child{
    g[homem]{I-1} p[mulher]{I-2}
    c[mulher]{II-1}
    c[homem, afetado]{II-2}
    child{
      g[mulher]{II-3} p[homem]{II-4}
      c[homem]{III-1}
      c[mulher, afetado]{III-2}
    }
  }
\end{genealogypicture}
\end{center}
```

- A árvore é descrita por famílias: `child{...}` é uma família; nela, `g` é a pessoa que pertence
  à família de cima (na raiz, um dos genitores), `p` o cônjuge e `c` cada filho. Um `child`
  dentro de outro é a família formada por um dos filhos: aqui, II-3 e II-4.
- Cada pessoa é uma caixa do `tcolorbox` (por isso a opção `all`). As opções em `box={...}` valem
  para todas; `node size` (largura) e `level size` (altura) iguais fazem as caixas quadradas, de
  9 mm, e `level distance` é o espaço entre as gerações.
- Os símbolos vêm de três estilos do próprio exemplo: `homem` (cantos vivos: quadrado), `mulher`
  (arco igual a metade do lado: círculo) e `afetado` (fundo escuro, letra branca). Combine-os nos
  colchetes: `c[mulher, afetado]{III-2}`.
- O pacote também tem um modelo pronto de símbolos (`symbol nodes`). O exemplo prefere estilos
  próprios, que dão controle direto sobre o tamanho, o preenchimento e o texto de cada símbolo;
  para outros casos (portador, falecido), crie outro estilo da mesma forma.
- Os números romanos indicam a geração e os arábicos, o indivíduo, como de costume nos
  heredogramas.

## Quadro de Punnett

```latex
Cruzamento \textit{Aa} $\times$ \textit{Aa}:
\begin{center}
\renewcommand{\arraystretch}{1.6}
\begin{tabular}{c|>{\centering\itshape}p{1cm}|>{\centering\itshape\arraybackslash}p{1cm}|}
  \multicolumn{1}{c}{} & \multicolumn{1}{c}{\textit{A}} & \multicolumn{1}{c}{\textit{a}} \\
  \cline{2-3}
  \textit{A} & AA & Aa \\ \cline{2-3}
  \textit{a} & Aa & aa \\ \cline{2-3}
\end{tabular}
\end{center}
Proporção genotípica 1~\textit{AA} : 2~\textit{Aa} : 1~\textit{aa}.
```

- As colunas `p{1cm}` têm largura fixa, para as células ficarem quadradas; `>{\centering\itshape}`
  (pacote `array`) centraliza e põe em itálico todos os genótipos, sem repetir `\textit`.
- `\arraybackslash` vem na última coluna: depois de `\centering`, ele devolve ao `\\` o papel de
  fim de linha da tabela.
- Os gametas ficam fora da grade: o `\multicolumn{1}{c}{...}` da primeira linha tira os filetes
  verticais, e `\cline{2-3}` traça as linhas só sobre as células do cruzamento.
- Para um di-híbrido (4 × 4), acrescente duas colunas iguais e mude o `\cline` para `{2-5}`.
