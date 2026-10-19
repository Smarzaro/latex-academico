# 01 – Primeiro documento e preâmbulo em português

**Problema.** Escrever o menor documento que compila, entender as partes dele (classe, preâmbulo e
corpo) e configurá-lo para textos em português, com acentos e hifenização corretos.

**Solução.** Comece pelo documento mínimo para testar a instalação; depois acrescente, no
preâmbulo, os três pacotes que todo texto em português com pdfLaTeX precisa.

## Testar a instalação

Exemplo completo: [`ola-mundo.tex`](../../exemplos/basico/ola-mundo.tex).

```latex
\documentclass{article}
\begin{document}
Olá, mundo!
\end{document}
```

Se esse arquivo gera um PDF, a distribuição (TeX Live ou MiKTeX) e o editor estão funcionando.

## Classe, preâmbulo e corpo

Exemplo completo: [`estrutura-minima.tex`](../../exemplos/basico/estrutura-minima.tex).

```latex
\documentclass[a4paper, 12pt]{article}
% O trecho entre \documentclass e \begin{document} é o preâmbulo:
% nele são carregados os pacotes e feitas as configurações do documento.
\usepackage[T1]{fontenc}          % codificação da saída (acentos e hifenização corretos)
\usepackage{lmodern}              % fonte Latin Modern
\usepackage[brazilian]{babel}     % português do Brasil

\begin{document}
Aqui vai o texto do artigo.
\end{document}
```

- **Classe** (`\documentclass`): define o tipo de documento e a aparência geral. `article` para
  textos curtos (sem capítulos), `report` e `book` para textos com capítulos; as classes
  acadêmicas (como a `abntex2`) partem delas. As opções entre colchetes valem para o documento
  todo: tamanho do papel (`a4paper`) e da letra (`10pt`, `11pt` ou `12pt`).
- **Preâmbulo**: pacotes e configurações. Nada do que está aqui aparece diretamente no PDF.
- **Corpo**: o texto, entre `\begin{document}` e `\end{document}`. O que vem depois do
  `\end{document}` é ignorado.

## O preâmbulo para português

Exemplo completo: [`portugues.tex`](../../exemplos/basico/portugues.tex).

```latex
\usepackage[T1]{fontenc}          % codificação da saída: acentos copiáveis e hifenização correta
\usepackage{lmodern}              % fonte Latin Modern (versão moderna da Computer Modern)
\usepackage[brazilian]{babel}     % termos traduzidos (Capítulo, Sumário...) e hifenização
```

No exemplo, o `\tableofcontents` e o `\chapter` mostram "Sumário" e "Capítulo 1" em vez de
"Contents" e "Chapter 1".

## Armadilhas

- **`inputenc` não é mais necessário.** Desde 2018 o LaTeX lê os arquivos em UTF-8 por padrão;
  `\usepackage[utf8]{inputenc}`, comum em modelos antigos, é inofensivo, mas dispensável. Salve
  sempre o `.tex` em UTF-8 (é o padrão dos editores atuais).
- **Sem `fontenc` com `T1`**, as letras acentuadas são montadas a partir de dois caracteres: o PDF
  fica certo na tela, mas a busca e a cópia de palavras acentuadas falham e a hifenização de
  palavras com acento é prejudicada.
- **XeLaTeX e LuaLaTeX** usam fontes do sistema com o pacote `fontspec`: nesse caso não carregue
  `fontenc` nem `lmodern`; o `babel` continua necessário.
- **Mensagem de erro?** Leia a primeira mensagem do log, não a última: os erros seguintes costumam
  ser consequência do primeiro. O número da linha (`l.12`) indica onde o LaTeX percebeu o problema,
  que pode estar um pouco antes.
