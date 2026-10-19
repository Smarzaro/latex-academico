# 01 – Configuração do `listings`

**Problema.** O `listings` sem configuração produz código em fonte genérica, sem cores e sem
quebra de linhas. Para um trabalho acadêmico, vale configurar uma vez, no preâmbulo, e
aplicar a todas as listagens.

**Solução.** Escolher a fonte, definir as cores e criar um estilo aplicado com `\lstset`.
O arquivo [`estilo-codigo.tex`](../../exemplos/codigo/estilo-codigo.tex) reúne tudo; os exemplos
o incluem com `\input{estilo-codigo}`.

```latex
\usepackage[varqu,varl,scaled=0.95]{inconsolata} % largura fixa legível (0/O, 1/l/I e & distintos)
\usepackage{xcolor}
\usepackage{listings}
\lstloadaspects{tex,emph}               % habilita as chaves texcsstyle, moretexcs e emphstyle
\definecolor{cod-kw}{RGB}{0,51,153}     % palavras-chave e comandos
\definecolor{cod-com}{RGB}{0,110,50}    % comentários
\definecolor{cod-str}{RGB}{163,21,21}   % cadeias de caracteres
\definecolor{cod-foco}{RGB}{190,70,0}   % palavras em destaque (opção emph)
\lstdefinestyle{codigo}{
  basicstyle=\ttfamily\footnotesize, columns=fixed, basewidth=0.5em,
  keepspaces=true, tabsize=4,
  keywordstyle=\bfseries\color{cod-kw}, commentstyle=\color{cod-com},
  stringstyle=\color{cod-str}, showstringspaces=false,
  texcsstyle=*\bfseries\color{cod-kw}, emphstyle=\bfseries\color{cod-foco},
  moretexcs={includegraphics, caption, toprule, midrule, ...},   % comandos de pacotes
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

- **Fonte.** A Inconsolata (`inconsolata`) distingue bem 0/O, 1/l/I e o `&`, e é estreita, o que
  reduz as quebras de linha; `varqu` usa aspas retas e `varl` um `l` com base. Alternativas
  incluídas no MiKTeX e no TeX Live: `FiraMono`, `sourcecodepro` e `beramono`. Como o pacote muda
  `\ttdefault`, vale também para o `\texttt` do texto. A opção `scaled` ajusta o tamanho relativo.
- **Largura fixa.** Use `columns=fixed` (e não `flexible`), senão o alinhamento das colunas do
  código se perde. O `basewidth` é a largura de cada coluna: o padrão (0,6 em) é largo para a
  Inconsolata e deixa as letras espaçadas; 0,5 em acompanha a largura da fonte.
- **Comandos do LaTeX.** A linguagem `[LaTeX]TeX` só destaca os comandos que conhece; `texcsstyle`
  define o estilo dos comandos (o `*` inclui a barra invertida) e `moretexcs` acrescenta comandos
  de pacotes, como `\includegraphics` e `\toprule`. O `\lstloadaspects{tex,emph}` é necessário
  para usar essas chaves no estilo antes de escolher a linguagem.
- **Destaque.** `emphstyle` define a aparência das palavras passadas em `emph={...}` em uma
  listagem, útil para chamar a atenção para o comando que está sendo explicado.
- **Cores.** Escolha cores que continuem legíveis em escala de cinza; palavras-chave em negrito e
  comentários em cor mais clara ajudam (a Inconsolata não tem itálico: um `\itshape` sairia reto,
  com aviso de fonte substituída). Para quem imprime em preto e branco, o estilo `codigopb`
  ([receita 05](05-preto-e-branco-e-minted.md)) troca as cores por negrito e cinza.
- **Quebra de linhas.** `breaklines=true` quebra linhas longas; `postbreak` marca a continuação
  com uma seta.
- **Rótulo e lista.** `\lstlistingname` troca "Listing" por "Código"; `\lstlistoflistings`
  imprime a lista, cujo título muda com `\renewcommand{\lstlistlistingname}{Lista de códigos}`.
