# 01 – Configuração do `listings`

**Problema.** O `listings` sem configuração produz código em fonte genérica, sem cores e sem
quebra de linhas. Para um trabalho acadêmico, vale configurar uma vez, no preâmbulo, e
aplicar a todas as listagens.

**Solução.** Escolher a fonte, definir as cores e criar um estilo aplicado com `\lstset`.
O arquivo [`estilo-codigo.tex`](../../exemplos/codigo/estilo-codigo.tex) reúne tudo; os exemplos
o incluem com `\input{estilo-codigo}`.

```latex
\usepackage[scaled=0.88]{FiraMono}      % fonte de largura fixa legível (0/O e 1/l/I distintos)
\usepackage{xcolor}
\usepackage{listings}
\definecolor{cod-kw}{RGB}{0,51,153}     % palavras-chave
\definecolor{cod-com}{RGB}{0,110,50}    % comentários
\definecolor{cod-str}{RGB}{163,21,21}   % cadeias de caracteres
\lstdefinestyle{codigo}{
  basicstyle=\ttfamily\footnotesize, columns=fixed, keepspaces=true, tabsize=4,
  keywordstyle=\bfseries\color{cod-kw}, commentstyle=\itshape\color{cod-com},
  stringstyle=\color{cod-str}, showstringspaces=false,
  numbers=left, numberstyle=\tiny\color{black!55}, numbersep=7pt,
  backgroundcolor=\color{black!4}, frame=single, rulecolor=\color{black!25},
  breaklines=true, postbreak={\mbox{\textcolor{cod-com}{$\hookrightarrow$}\space}},
  extendedchars=true,
  literate={á}{{\'a}}1 {é}{{\'e}}1 {ã}{{\~a}}1 {ç}{{\c c}}1 ...}   % veja a receita 04
\lstset{style=codigo}
\renewcommand{\lstlistingname}{Código}            % legenda: "Código N"
```

A versão completa do `literate` (todas as vogais acentuadas e `ç`) está no arquivo do exemplo.

## O que cada escolha faz

- **Fonte.** `FiraMono` distingue bem 0/O e 1/l/I e mantém a largura fixa. Alternativas
  incluídas no MiKTeX e no TeX Live: `sourcecodepro`, `zi4` (Inconsolata, mais leve) e `beramono`.
  Como o pacote muda `\ttdefault`, vale também para o `\texttt` do texto. A opção `scaled`
  ajusta o tamanho relativo.
- **Largura fixa.** Use `columns=fixed` (e não `flexible`), senão o alinhamento das colunas do
  código se perde.
- **Cores.** Escolha cores que continuem legíveis em escala de cinza; palavras-chave em negrito e
  comentários em itálico ajudam. Para quem imprime em preto e branco, o estilo `codigopb`
  ([receita 05](05-preto-e-branco-e-minted.md)) desliga as cores.
- **Quebra de linhas.** `breaklines=true` quebra linhas longas; `postbreak` marca a continuação
  com uma seta.
- **Rótulo e lista.** `\lstlistingname` troca "Listing" por "Código"; `\lstlistoflistings`
  imprime a lista, cujo título muda com `\renewcommand{\lstlistlistingname}{Lista de códigos}`.
