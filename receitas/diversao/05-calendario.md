# 05 – Calendário

**Problema.** Montar o calendário de um mês, com os dias da semana em português, os fins de
semana apagados e as datas de provas e entregas destacadas.

**Solução.** A biblioteca `calendar` do TikZ, que calcula os dias da semana a partir das datas.
Exemplo completo: [`calendario.tex`](../../exemplos/diversao/calendario.tex).

```latex
\usepackage{tikz}
\usetikzlibrary{calendar}
```

```latex
\begin{center}
\textbf{Novembro de 2026}\par\smallskip
\begin{tikzpicture}
  % cabeçalho: uma coluna por dia da semana, com o mesmo espaçamento dos dias
  \foreach \d [count=\i from 0] in {seg, ter, qua, qui, sex, sáb, dom}
    \node[font=\footnotesize\bfseries, text height=1.6ex, text depth=0.3ex]
      at (\i*8mm, 6mm) {\d};
  \calendar[dates=2026-11-01 to 2026-11-30, week list, day xshift=8mm,
            day yshift=6mm, day code={
              \node[anchor=center, minimum size=5.5mm, inner sep=0pt,
                    name=\pgfcalendarsuggestedname] {\tikzdaytext};}]
    if (weekend) [black!40]
    if (equals=2026-11-12) [nodes={draw=red, thick, circle}]            % prova 1
    if (equals=2026-11-26) [nodes={fill=blue!20, rounded corners=1pt}]   % entrega
  ;
\end{tikzpicture}\par\smallskip
\footnotesize\textcolor{red}{$\bigcirc$} prova \qquad
\colorbox{blue!20}{\phantom{0}} entrega do trabalho
\end{center}
```

- `week list` põe uma semana por linha, começando na segunda-feira; `day xshift` e `day yshift`
  são as distâncias entre as colunas e entre as linhas.
- O cabeçalho é desenhado à parte, com o mesmo passo de 8 mm, e por isso fica alinhado com as
  colunas dos dias. Os `text height` e `text depth` fixos alinham as abreviaturas pela base, com e
  sem acento.
- `day code` troca o desenho padrão de cada dia por um nó centralizado, de tamanho fixo; assim o
  círculo e o fundo dos destaques têm sempre o mesmo tamanho, com um ou dois algarismos.
- As condições `if (...)` aplicam estilos: `weekend` pega sábados e domingos; `equals=` uma data.
  Há outras, como `Monday`, `between=... and ...` e `day of month=`.
- A legenda abaixo do calendário repete os símbolos dos destaques; mantenha-a sempre que usar cor.

## Outro mês

1. Troque as datas em `dates=` (primeiro e último dia do mês) e o título.
2. Troque as datas das condições `equals=` (e os comentários).
3. Não é preciso mudar o cabeçalho: a biblioteca calcula em que coluna cai o dia 1.

Para vários meses, repita o bloco, um por mês. Outros arranjos e condições estão na seção
"Calendar Library" do manual do TikZ (`texdoc tikz`).
