# 05 – Slides de uma disciplina com `subfiles`

**Problema.** Organizar os slides de uma disciplina inteira: uma aula por arquivo, com o mesmo
visual em todas, podendo compilar só a aula da semana ou o curso completo, e gerar uma versão
para impressão.

**Solução.** O pacote `subfiles`: um arquivo principal (`curso.tex`) tem o preâmbulo comum e
junta as aulas; cada aula (`aulas/aula-01.tex`, `aulas/aula-02.tex`) declara o principal como
"classe" e, compilada sozinha, usa o preâmbulo dele. Exemplo completo:
[`curso/`](../../exemplos/apresentacoes/curso/).

```
curso/
├── curso.tex              preâmbulo comum + \subfile de cada aula
├── curso-handout.tex      versão para impressão
├── referencias-curso.bib
└── aulas/
    ├── aula-01.tex
    └── aula-02.tex
```

## Arquivo principal

```latex
\documentclass[aspectratio=169, xcolor=table]{beamer}   % table: \rowcolors nas tabelas
\usepackage[T1]{fontenc}
\usepackage[brazilian]{babel}
\usepackage{subfiles}              % aulas em arquivos separados, cada uma compilável
```

```latex
% Caminhos que funcionam ao compilar o curso (nesta pasta) e uma aula (em aulas/)
\graphicspath{{imagens/}{../imagens/}}
\usepackage[backend=biber, style=abnt]{biblatex}
\addbibresource{\subfix{referencias-curso.bib}}
```

No corpo do `curso.tex`, depois do slide de título:

```latex
\subfile{aulas/aula-01}
\subfile{aulas/aula-02}
```

## Cada aula

```latex
\documentclass[../curso.tex]{subfiles}

\begin{document}

\part{O que é o \LaTeX}
\begin{refsection}       % referências próprias desta aula
```

A aula termina com `\end{refsection}` e `\end{document}`. Dentro do curso, o `subfiles` ignora o
preâmbulo e o `\begin{document}` da aula e usa só o corpo; compilada sozinha, a aula usa o
preâmbulo do `curso.tex`.

- `\part` marca o início de cada aula: no curso completo, as aulas são numeradas, e a
  [receita 06](06-identidade-visual.md) gera o slide de abertura a partir dele.
- `refsection` dá a cada aula a sua lista de referências, só com as obras citadas nela.

## Caminhos relativos

O problema dos arquivos separados é a pasta: o curso é compilado em `curso/`, e a aula, em
`curso/aulas/`. Há duas soluções no exemplo:

- `\subfix{arquivo}` corrige o caminho de um arquivo do preâmbulo (aqui, o `.bib`) conforme o
  documento que está sendo compilado;
- `\graphicspath` com as duas pastas (`imagens/` e `../imagens/`) acha as figuras nos dois casos.
  O exemplo não tem figuras; crie a pasta `curso/imagens/` quando precisar.

## Versão para impressão

```latex
\PassOptionsToClass{handout}{beamer}
\input{curso}
```

O `curso-handout.tex` só acrescenta a opção `handout` e lê o `curso.tex` inteiro. Nesse modo,
cada frame vira uma única página, com todo o conteúdo visível: no exemplo, o curso tem 18
páginas e a versão para impressão, 13.

## Como compilar

```sh
latexmk -pdf curso.tex            # curso completo (na pasta curso/)
latexmk -pdf aula-01.tex          # só uma aula (na pasta curso/aulas/)
latexmk -pdf curso-handout.tex    # versão para impressão (na pasta curso/)
```

## Armadilhas

- Compilada sozinha, a aula 2 mostra "Aula 1" no slide de abertura: a contagem das `\part`
  recomeça em cada documento. No curso completo, o número sai certo.
- Comandos de preâmbulo (`\usepackage`, `\definecolor`, `\newcommand`) ficam só no `curso.tex`;
  na aula, o que vem antes do `\begin{document}` é ignorado dentro do curso.
- Uma aula é inserida no curso pelo caminho relativo ao `curso.tex` (`aulas/aula-01`), sem a
  extensão.
- Referências cruzadas entre aulas (`\ref` para um rótulo de outra aula) só se resolvem no curso
  completo; na aula compilada sozinha, saem como `??`.
