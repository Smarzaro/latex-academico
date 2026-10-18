# latex-academico

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23458965.svg)](https://doi.org/10.5281/zenodo.23458965)

Receitas, exemplos e modelos de LaTeX para documentos acadêmicos (trabalhos de conclusão de
curso, dissertações, teses, artigos), com atenção às normas da ABNT.

**Summary (English):** *latex-academico* is a collection of recipes, compilable examples and
templates for typesetting academic documents in LaTeX, with attention to the Brazilian ABNT
standards (Portuguese-language content): tables and charts, figures, source code listings,
references with biblatex-abnt, acronyms, schedules. Every example is a complete `.tex` file that
is compiled by continuous integration, so the recipes do not go stale. Text is licensed under
CC BY 4.0 and code examples under CC0 1.0.

---

## O que há aqui

- **[`receitas/`](receitas/)**: textos curtos, um problema por receita, com a solução, o código e
  os cuidados.
- **[`exemplos/`](exemplos/)**: arquivos `.tex` completos e compiláveis que as receitas usam. O
  código dos exemplos é a fonte da verdade; o texto das receitas aponta para eles.
- **[`modelos/`](modelos/)**: preâmbulos mínimos para começar um documento.
- **[`scripts/`](scripts/)** e **[`tests/`](tests/)**: compilam todos os exemplos e conferem os
  marcadores de inclusão.

### Receitas disponíveis

| Tema | Receitas |
|---|---|
| [Tabelas e quadros](receitas/tabelas/) | tabela ou quadro, título/fonte/legenda/nota, tabela IBGE, células mescladas, tabela longa, quadro |
| [Figuras e gráficos](receitas/figuras/) | inserir imagem, subfiguras, diagramas com TikZ, gráficos com PGFPlots |
| [Código-fonte](receitas/codigo/) | configuração do `listings`, uso básico, opções, linguagens e acentos, preto e branco e `minted`, dicas |
| [Referências e citações](receitas/referencias/) | catálogo de entradas do `biblatex-abnt`, ajustes finos, comandos de citação |
| [Siglas, abreviaturas e glossário](receitas/siglas-glossario/) | `acro`, lista de siglas, lista de abreviaturas, glossário |
| [Cronograma](receitas/cronograma/) | quadro com marcas, quadro com células sombreadas, diagrama de Gantt |
| [Escrita acadêmica](receitas/escrita/) | o que escrever em cada seção do trabalho |

Veja o [índice completo](receitas/README.md).

### Exemplos sem receita (ainda)

| Tema | Exemplos |
|---|---|
| [Primeiros passos](exemplos/basico/) | olá mundo, estrutura mínima, espaços e comentários, divisões, português, hifenização, alinhamento, espaçamentos, notas e links, comandos próprios |
| [Documentos longos](exemplos/organizacao/) | documento dividido em arquivos com `\include` |
| [Referência cruzada](exemplos/referencia-cruzada/) | `\label`/`\ref`/`\pageref`, `\autoref` e `cleveref` |
| [Matemática](exemplos/matematica/) | modos inline e destaque, `equation`, `align`, matrizes, casos, teoremas, unidades |
| [Apresentações e pôster](exemplos/apresentacoes/) | beamer básico, sobreposições, modelo de apresentação (metropolis), pôster (tikzposter), slides de uma disciplina organizados com `subfiles` (`curso/`: aulas compiláveis separadamente, slides de transição automáticos, versão para impressão) |
| [abnTeX2](exemplos/abntex2/) | esqueleto de TCC: elementos pré-textuais, textuais e pós-textuais; vários autores |
| [abntex2-ufv](exemplos/abntex2-ufv/) | ambientes `tabela` e `ilustracao` e float `codigo` da classe [abntex2-ufv](https://ctan.org/pkg/abntex2-ufv), comparados com a abntex2 |
| [Provas e listas](exemplos/avaliacoes/) | prova com pontuação e gabarito do mesmo arquivo, lista de exercícios (classe `exam`), prova com várias versões embaralhadas e scripts que geram as versões e os gabaritos (`gerar-versoes.sh`, `gerar-versoes.ps1`) |
| [Versionamento](exemplos/versionamento/) | duas versões de um texto comparadas com o `latexdiff` |


## Licenças

- **Texto** (receitas, README, documentação): [CC BY 4.0](LICENSE).
- **Código** (arquivos `.tex`, scripts e trechos de código dos exemplos): [CC0 1.0](LICENSE-CODE),
  para que você cole os trechos no seu trabalho sem se preocupar com atribuição.

## Como citar

Veja [`CITATION.cff`](CITATION.cff) (o GitHub mostra o botão *Cite this repository*). O DOI
[10.5281/zenodo.23458965](https://doi.org/10.5281/zenodo.23458965) aponta sempre para a versão mais
recente; cada versão tem também o seu DOI próprio, listado no Zenodo.

## Autor

Rodrigo Smarzaro ([Universidade Federal de Viçosa](https://www.ufv.br)).

## Pedidos, erros e sugestões

Use as [*issues*](https://github.com/Smarzaro/latex-academico/issues/new/choose) do repositório,
com os formulários prontos:

- **Pedido de exemplo ou receita**: um tema que ainda não está aqui;
- **Erro em exemplo ou receita**: um exemplo que não compila ou um resultado errado;
- **Comentário sobre o livro**: erratas, dúvidas e sugestões dos leitores do livro *LaTeX para
  Documentos Acadêmicos*, que usa estes exemplos.

Os formulários aplicam os rótulos `pedido`, `erro` e `livro`, o que facilita acompanhar o que
entra nas próximas versões.

## Opiniões e relatos

Gostou do guia ou do livro, tem uma crítica ou quer contar como o conteúdo ajudou no seu trabalho?
Escreva na categoria [Feedback](https://github.com/Smarzaro/latex-academico/discussions/categories/feedback)
das *Discussions*. Os relatos orientam as próximas edições e, com a sua autorização (perguntada no
formulário), trechos podem ser citados em materiais do livro e do guia.

## Contribuir

Correções e novas receitas são bem-vindas por *pull request*. Regras básicas: cada receita tem
um exemplo `.tex` compilável em `exemplos/`; os ids dos marcadores `%%BEGIN`/`%%END` têm só
letras e números; rode `sh scripts/run-tests.sh` antes de enviar. Exemplos que dependem de uma
classe fora da distribuição levam `% !requer: arquivo.cls` nas primeiras linhas e são ignorados
pelos testes quando ela não está instalada (os da `abntex2-ufv` podem ser testados com
`TEXINPUTS` apontando para a classe).
