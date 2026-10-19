# 03 – Lista de exercícios

**Problema.** Preparar uma lista de exercícios, sem pontos nem quadro de notas, com lacunas para
completar, itens de verdadeiro ou falso e respostas que podem ser divulgadas depois.

**Solução.** A classe `exam` sem a opção `addpoints`, com `\fillin` para as lacunas e
`\qformat` para trocar o "1." da questão por um título "Exercício 1". Exemplo completo:
[`lista-exercicios.tex`](../../exemplos/avaliacoes/lista-exercicios.tex).

No preâmbulo, além da classe, do `fontenc` e do `babel`:

```latex
\renewcommand{\solutiontitle}{\noindent\textbf{Resposta:}\enspace}
\qformat{\textbf{Exercício \thequestion}\hfill}   % título da questão em linha própria
```

```latex
\begin{questions}
  \question O comando que inicia o corpo do documento é \fillin[\texttt{\textbackslash begin\{document\}}][5cm].

  \question Marque V (verdadeiro) ou F (falso).
  \begin{parts}
    \part \fillin[V][1cm] O \texttt{\%} inicia um comentário.
    \part \fillin[F][1cm] Uma linha em branco junta dois parágrafos.
  \end{parts}

  \question Escreva o código de uma lista numerada com dois itens.
  \begin{solutionorbox}[2.5cm]
    \texttt{\textbackslash begin\{enumerate\} \textbackslash item A \textbackslash item B
      \textbackslash end\{enumerate\}}
  \end{solutionorbox}
\end{questions}
```

- `\fillin[resposta][largura]` traça uma linha em branco da largura dada; com a opção `answers`, a
  resposta aparece escrita sobre a linha. Sem a largura, a linha tem um tamanho padrão.
- Com `\qformat`, o título ocupa uma linha inteira (o `\hfill` a completa) e o enunciado começa na
  linha seguinte. Para voltar ao formato numerado ("1."), apague o `\qformat`.
- Para comandos do LaTeX dentro do enunciado, escreva a barra com `\textbackslash` e as chaves
  com `\{` e `\}`, dentro de `\texttt`.
- A versão com respostas sai como na [receita 02](02-gabarito.md): um arquivo com
  `\PassOptionsToClass{answers}{exam}` e `\input{lista-exercicios}`.
