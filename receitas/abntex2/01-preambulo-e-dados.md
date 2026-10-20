# 01 – Preâmbulo e dados do trabalho

**Problema.** Começar um TCC (ou dissertação, ou tese) com a classe `abntex2`: quais opções
passar, que pacotes carregar e onde informar título, autor, orientador e natureza do trabalho.

**Solução.** A classe com as opções de papel, letra e idiomas; um conjunto pequeno de pacotes
(acentos, figuras, referências com o `biblatex-abnt`); e os comandos de dados da `abntex2`, que
alimentam a capa e a folha de rosto. Exemplo completo:
[`tcc-esqueleto.tex`](../../exemplos/abntex2/tcc-esqueleto.tex).

## Classe

```latex
\documentclass[12pt, a4paper, oneside, english, brazilian, sumario=tradicional]{abntex2}
```

- `12pt` e `a4paper`: letra e papel da NBR 14724.
- `oneside`: impressão só na frente (anverso). Para frente e verso, `twoside`; as margens
  interna e externa passam a alternar entre as páginas pares e ímpares.
- `english, brazilian`: os idiomas do documento; o **último** é o principal. O inglês é preciso
  para o *abstract*.
- `sumario=tradicional`: sumário no estilo tradicional do LaTeX/`memoir`. Sem a opção, a classe
  usa `sumario=abnt-6027-2012`, que segue a recomendação da NBR 6027; compile das duas formas e
  escolha a que o seu manual de normalização pede.

## Pacotes

```latex
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{indentfirst}              % recua também o primeiro parágrafo de cada seção
\usepackage{graphicx}
\usepackage{csquotes}
\usepackage[backend=biber, style=abnt, uniquename=init, giveninits,
            repeatfields]{biblatex}
\usepackage{ragged2e}
\usepackage{xurl}
\addbibresource{../referencias/catalogo.bib}
\appto{\bibsetup}{\RaggedRight}       % referências à esquerda (NBR 6023), com hifenização
\urlstyle{same}
\hypersetup{hidelinks}                % a abntex2 carrega o hyperref; links sem moldura
```

- `fontenc` com `T1` e `lmodern`: acentos e hifenização corretos, com fontes vetoriais.
- `indentfirst`: na tradição brasileira, o primeiro parágrafo após um título também tem recuo.
- O `biblatex` com o estilo `abnt` (pacote `biblatex-abnt`) e o programa `biber` formata as
  referências; o `latexmk` roda o `biber` sozinho. As opções e o alinhamento à esquerda estão
  explicados nas [receitas de referências](../referencias/).
- `\hypersetup{hidelinks}`: a `abntex2` já carrega o `hyperref`; esta linha tira as molduras
  coloridas dos links, que aparecem na tela mas ficam estranhas no PDF impresso.

## Dados do trabalho

```latex
\titulo{Meu primeiro TCC com abn\TeX2}
\autor{Nome do Autor}
\local{Cidade}
\instituicao{Nome da Instituição \par Nome do \emph{campus} ou da unidade}
\data{\the\year}
\orientador{Prof. Dr. Fulano de Tal}
\coorientador{Profa. Dra. Beltrana da Silva}
\tipotrabalho{Trabalho de Conclusão de Curso (Graduação)}
\preambulo{Trabalho apresentado à Nome da Instituição como parte das exigências
para a obtenção do título de Bacharel em Nome do Curso.}
```

Esses comandos só guardam os dados; quem os imprime são `\imprimircapa` e `\imprimirfolhaderosto`
(veja a [receita 02](02-ordem-dos-elementos.md)). O `\preambulo` é o texto da folha de rosto que
diz a natureza do trabalho, o objetivo (grau pretendido) e a instituição.

## Ajustes comuns e armadilhas

- `\par` dentro de `\instituicao` quebra a linha (instituição, unidade, departamento).
- `\data{\the\year}` imprime o ano da compilação; para a versão final, escreva o ano fixo.
- Sem coorientador, apague a linha `\coorientador`: a folha de rosto só mostra o que foi
  informado.
- O caminho do `\addbibresource` é relativo à pasta do `.tex`; no seu trabalho, em geral, é só o
  nome do arquivo (`\addbibresource{referencias.bib}`).
- Um documento curto, só com capítulos e referências, pode partir do modelo
  [`abnt-minimo.tex`](../../modelos/abnt-minimo.tex), que tem o mesmo preâmbulo reduzido.
