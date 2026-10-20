# 04 – Trabalho completo: um arquivo por capítulo, listas, siglas, quadro e código

**Problema.** Juntar num só trabalho tudo o que as outras receitas mostram em separado: arquivo
principal e capítulos em arquivos próprios, folha de aprovação, listas de figuras, quadros,
códigos, tabelas e siglas, apêndices e anexos.

**Solução.** O modelo [`modelos/tcc-abntex2/`](../../modelos/tcc-abntex2/) é um TCC completo com
a classe `abntex2`, testado a cada versão do guia. Copie a pasta inteira e compile o arquivo
principal:

```
tcc-abntex2/
├── tcc.tex             preâmbulo, dados do trabalho e ordem dos elementos
├── pretextuais/        folha-aprovacao.tex e resumos.tex (com \input)
├── capitulos/          um arquivo por capítulo, apêndice e anexo (com \include)
└── referencias.bib
```

```bash
latexmk -pdf tcc.tex
```

A variante [`modelos/tcc-abntex2-ufv/`](../../modelos/tcc-abntex2-ufv/) faz o mesmo com a classe
`abntex2-ufv` (CTAN), que já traz os flutuantes `quadro`, `grafico` e `codigo`, as listas de
siglas e de abreviaturas, a folha de aprovação e os ambientes `ilustracao` e `tabela`, que medem o
conteúdo e alinham título, fonte e nota na largura dele. Compare os dois preâmbulos para ver o que
a classe faz por você.

## O arquivo principal

O `tcc.tex` tem quatro blocos no preâmbulo (pacotes; quadro e código; siglas; dados do trabalho)
e, no corpo, a ordem da NBR 14724:

```latex
\pretextual
\imprimircapa
\imprimirfolhaderosto  % a linha seguinte fica em branco (ele lê um argumento)

\input{pretextuais/folha-aprovacao}   % \input: sem quebra de página
\input{pretextuais/resumos}
\listoffigures*  \listofquadros*  \listofcodigos*  \listoftables*
\printacronyms
\tableofcontents*

\textual
\include{capitulos/introducao}        % sem a extensão .tex
...
\postextual
\printbibliography[title=Referências]
\begin{apendicesenv} \partapendices \include{capitulos/apendice-questionario} \end{apendicesenv}
\begin{anexosenv} \partanexos \include{capitulos/anexo-regulamento} \end{anexosenv}
```

(No modelo, cada lista fica numa linha, seguida de `\cleardoublepage`.)

## Dúvidas mais comuns

- **Em que ordem carregar os pacotes?** Codificação e fonte primeiro (`fontenc`, `lmodern`); os
  demais no meio; o `biblatex` perto do fim. A `abntex2` já carrega o `hyperref`: não o carregue de
  novo, ajuste-o com `\hypersetup`. Se usar o `cleveref`, ele vem depois de todos.
- **Onde ficam os pacotes dos capítulos?** No arquivo principal. Os arquivos de `capitulos/` não
  têm preâmbulo nem `\begin{document}`: começam no `\chapter`.
- **`\include` ou `\input`?** `\include` começa página nova, grava um `.aux` por capítulo e permite
  compilar só alguns com `\includeonly{capitulos/metodologia}` (as referências aos outros
  continuam certas). Use-o para capítulos, apêndices e anexos. Para pedaços que não começam página
  (a folha de aprovação logo depois da folha de rosto, os resumos), use `\input`. Um arquivo
  incluído com `\include` não pode ter outro `\include` dentro.
- **Onde vai o `\textual`?** No arquivo principal, antes do primeiro `\include`. Ele muda a
  numeração das páginas para arábica e liga os cabeçalhos; dentro de um capítulo, só valeria a
  partir dali.
- **Em que ordem vêm as listas?** Ilustrações (figuras, quadros, códigos...), tabelas, siglas e
  abreviaturas, símbolos e, por último, o sumário. Com uma lista por tipo, troque o título "Lista
  de ilustrações" por "Lista de figuras" (o modelo mostra como). O `*` em `\listoffigures*` deixa a
  lista fora do sumário, como pede a norma.
- **O quadro não existe na `abntex2`.** Declare-o com `\newfloat`, `\newlistof` e `\newlistentry`
  (comandos do `memoir`). Sem o `\newlistentry`, a lista de quadros sai sem pontilhado e com o
  número da página colado ao título.
- **A lista de códigos aparece no sumário.** O `\lstlistoflistings` do `listings` se põe no
  sumário na `abntex2`. O modelo usa `\newlistof{listofcodigos}{lol}{Lista de códigos}` e
  `\listofcodigos*`, e `numberbychapter=false` para numerar os códigos como as figuras (1, 2, 3, e
  não 3.1).
- **A folha de rosto "engole" a linha seguinte.** O `\imprimirfolhaderosto` lê um argumento:
  deixe uma linha em branco depois dele.
- **Apêndice ou anexo?** Apêndice é texto do próprio autor (`apendicesenv`); anexo é documento de
  terceiros (`anexosenv`). O `\partapendices` e o `\partanexos` imprimem a folha de abertura.
  No texto, `\autoref` escreve "Apêndice A" também para um anexo: escreva `Anexo~\ref{...}`.
- **Siglas no resumo?** O resumo é lido sozinho; escreva a sigla por extenso ali e deixe o `\ac`
  para o texto. As listas do `acro` só trazem as siglas usadas.
- **Folha de aprovação assinada e ficha catalográfica.** Depois da defesa, troque a página gerada
  pelo PDF assinado com `\includepdf` (pacote `pdfpages`); a ficha, feita pela biblioteca, entra do
  mesmo jeito, no verso da folha de rosto.

## Armadilhas

- **Compilar um capítulo** (`latexmk capitulos/introducao.tex`) dá erro: compile sempre o
  `tcc.tex`. No editor, abra o arquivo principal ou marque-o como "documento raiz".
- **Nomes de arquivo com espaço ou acento** em `\include` causam erros difíceis de entender: use
  minúsculas, sem acento, com hífen (`apendice-questionario.tex`).
- **`\includeonly` esquecido:** antes da versão final, comente a linha, ou o PDF sai sem os
  outros capítulos.
