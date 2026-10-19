# 06 – Identidade visual e slides de transição

**Problema.** Dar aos slides de um curso (ou de um grupo de pesquisa) um visual próprio e
coerente: as cores da instituição, blocos que sempre significam a mesma coisa e um slide de
abertura para cada aula e cada seção, sem desenhá-los à mão.

**Solução.** Um tema pronto com as cores trocadas por `\setbeamercolor`, cores fixas para os três
tipos de bloco e os ganchos `\AtBeginPart` e `\AtBeginSection`, que inserem um frame a cada
`\part` e a cada `\section`. Tudo fica no preâmbulo do
[`curso.tex`](../../exemplos/apresentacoes/curso/curso.tex) (veja a
[receita 05](05-curso-com-subfiles.md)).

## Cores do tema

```latex
% Identidade visual: troque as duas cores e, se quiser, inclua o logo da instituição
\definecolor{primaria}{RGB}{31,78,121}
\definecolor{secundaria}{RGB}{214,140,30}
\usetheme{CambridgeUS}
\usecolortheme[named=primaria]{structure}
\setbeamercolor{palette primary}{bg=primaria!75!black, fg=white}     % faixas do tema
\setbeamercolor{palette secondary}{bg=primaria, fg=white}
\setbeamercolor{palette tertiary}{bg=secundaria, fg=black}
\setbeamercolor{palette quaternary}{bg=primaria!60!black, fg=white}
\setbeamercolor{frametitle}{fg=primaria}        % o CambridgeUS usa vermelho nos títulos
\setbeamercolor{title}{fg=primaria}
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{frametitle continuation}{}   % sem "I", "II" nos frames que continuam
% \titlegraphic{\includegraphics[height=1.2cm]{logo}}
```

- Duas cores nomeadas (`primaria` e `secundaria`) concentram a identidade: para outro curso, troque
  só os dois `\definecolor`.
- `\usecolortheme[named=...]{structure}` muda a cor dos elementos de estrutura (marcadores de
  lista, por exemplo); as *palettes* mudam as faixas do cabeçalho e do rodapé do tema.
- O `CambridgeUS` pinta o título dos slides e o do slide de título de vermelho escuro; as duas
  linhas com `frametitle` e `title` trazem esses títulos para a cor primária.
- `frametitle continuation` vazio tira os numerais romanos ("Referências I", "II") dos frames com
  `allowframebreaks`, como a lista de referências.
- `primaria!75!black` é a cor primária escurecida (75% dela e 25% de preto); `primaria!10`, mais
  abaixo, é um tom claro dela.

## Blocos com significado

```latex
% Blocos com significado: definição (block), exemplo (exampleblock), atenção (alertblock)
\setbeamercolor{block title}{bg=primaria, fg=white}
\setbeamercolor{block body}{bg=primaria!10}
\setbeamercolor{block title example}{bg=secundaria, fg=black}
\setbeamercolor{block body example}{bg=secundaria!10}
\setbeamercolor{block title alerted}{bg=red!70!black, fg=white}
\setbeamercolor{block body alerted}{bg=red!8}
```

E o uso, em uma aula ([`aula-01.tex`](../../exemplos/apresentacoes/curso/aulas/aula-01.tex)):

```latex
\begin{frame}{Texto e formatação separados}
  \begin{block}{Definição}
    O \LaTeX\ é um sistema de preparação de documentos: o autor escreve o conteúdo e a
    estrutura, e o programa cuida da aparência \parencite{lamport1994}.
  \end{block}
  \begin{exampleblock}{Exemplo}
    \texttt{\textbackslash section\{Introdução\}} cria uma seção numerada e a inclui no sumário.
  \end{exampleblock}
  \begin{alertblock}{Atenção}
    O arquivo \texttt{.tex} precisa ser compilado para gerar o PDF.
  \end{alertblock}
\end{frame}
```

Combine o significado com a turma no primeiro dia (azul é definição, laranja é exemplo,
vermelho é cuidado) e mantenha-o em todas as aulas.

## Slides de transição automáticos

```latex
% Slides de abertura gerados automaticamente para cada aula (\part) e cada seção
\AtBeginPart{%
  \begin{frame}[plain]
    \centering\vfill
    {\small\color{secundaria}\MakeUppercase{Aula \insertpartnumber}}\par\medskip
    {\Large\bfseries\color{primaria}\insertpart}\par
    \vfill
  \end{frame}}
\AtBeginSection[]{%
  \begin{frame}[plain]
    \centering\vfill
    {\huge\bfseries\color{primaria}\insertsectionhead}\par\medskip
    {\color{secundaria}\rule{.5\textwidth}{1.5pt}}\par
    \vfill
  \end{frame}}
```

- Cada `\part{Título}` gera um slide com "AULA N" e o título da aula; cada `\section{Título}`, um
  slide com o título da seção sobre um filete.
- `[plain]` tira cabeçalho e rodapé desses slides.
- O `[]` vazio do `\AtBeginSection` é o que vale para `\section*` (aqui, nada).

## Ajustes comuns e armadilhas

- Escolha cores com bom contraste no projetor: tons claros demais somem na tela, e texto escuro
  sobre fundo escuro fica ilegível.
- Para ver todos os nomes de cores e modelos que um tema usa, consulte o manual do `beamer`
  (`texdoc beamer`), nas seções sobre temas de cores.
- Os slides de transição contam como frames: entram no número do rodapé e no PDF.
