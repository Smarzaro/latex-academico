# 01 – Um arquivo por capítulo

**Problema.** Um documento longo em um único arquivo fica difícil de navegar, de revisar e de
comparar entre versões, e cada compilação processa o texto inteiro.

**Solução.** Um arquivo principal com a classe, o preâmbulo e a ordem dos capítulos, e um arquivo
por capítulo (só com o conteúdo) incluído com `\include`. Durante a escrita, `\includeonly`
compila só os capítulos em revisão.
Exemplo completo: [`principal.tex`](../../exemplos/organizacao/principal.tex), com os capítulos em
[`capitulos/`](../../exemplos/organizacao/capitulos/).

```
organizacao/
├── principal.tex          classe, preâmbulo e lista de capítulos
└── capitulos/
    ├── introducao.tex     só o conteúdo do capítulo
    └── metodologia.tex
```

## O arquivo principal

```latex
\documentclass[a4paper, 12pt]{report}
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage[brazilian]{babel}
\usepackage[hidelinks]{hyperref}

% Para compilar só alguns capítulos (mais rápido durante a escrita), descomente:
% \includeonly{capitulos/metodologia}

\begin{document}
\tableofcontents

\include{capitulos/introducao}    % sem a extensão .tex
\include{capitulos/metodologia}
\end{document}
```

## Um capítulo

Arquivo [`capitulos/introducao.tex`](../../exemplos/organizacao/capitulos/introducao.tex):

```latex
\chapter{Introdução}\label{cap:introducao}

Este capítulo está no arquivo \texttt{capitulos/introducao.tex}. A metodologia é descrita no
\autoref{cap:metodologia}, que está em outro arquivo: os rótulos funcionam entre arquivos
porque todos são compilados juntos pelo arquivo principal.
```

No resultado, o `\autoref` escreve "Capítulo 2", com o número do capítulo definido no outro
arquivo, e o sumário lista os dois capítulos.

Um trabalho completo organizado assim, com a `abntex2`, está em
[`modelos/tcc-abntex2/`](../../modelos/tcc-abntex2/).

## `\include` ou `\input`?

| | `\include{arquivo}` | `\input{arquivo}` |
|---|---|---|
| Quebra de página | Sempre começa e termina com `\clearpage` | Nenhuma: o texto entra no ponto do comando |
| `\includeonly` | Funciona | Não se aplica |
| Pode ser aninhado | Não (um arquivo incluído não pode ter outro `\include`) | Sim |
| Uso típico | Capítulos, apêndices | Preâmbulo em arquivo separado, tabelas e figuras longas, seções |

## Compilar só um capítulo: `\includeonly`

Com `\includeonly{capitulos/metodologia}` no preâmbulo, só a metodologia é processada. Os números
de página e de capítulo e as referências aos capítulos omitidos são mantidos, porque o LaTeX os lê
dos arquivos `.aux` da compilação anterior (cada `\include` grava o seu próprio `.aux`). Por isso,
compile o documento inteiro pelo menos uma vez antes de usar o `\includeonly`. Para vários
capítulos, separe-os com vírgula: `\includeonly{capitulos/introducao,capitulos/metodologia}`.

## Armadilhas

- **Compile sempre o arquivo principal.** Um capítulo sozinho não tem `\documentclass` e dá erro.
  No TeXstudio, defina o principal como documento raiz (no menu *Opções*); no TeXstudio e no
  VS Code (LaTeX Workshop), a primeira linha `% !TeX root = ../principal.tex` no capítulo faz o
  mesmo; no Overleaf, escolha o *Main document* no menu.
- **Caminhos relativos ao arquivo principal.** Dentro de um capítulo, `\includegraphics` e
  `\input` procuram os arquivos a partir da pasta do principal, não da pasta do capítulo.
- **Nomes sem espaços e sem acentos** (`metodologia.tex`, `capitulos/`): espaços e acentos em
  nomes de arquivos causam erros difíceis de diagnosticar em algumas instalações.
- **Esqueceu o `\includeonly` ativo?** A versão final sai sem capítulos. Comente-o antes de gerar o
  PDF para entrega.
- **Não use `\include` para trechos pequenos** no meio de um capítulo: a quebra de página forçada
  aparece no PDF. Use `\input`.
