# latex-academico

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

## Como usar

**Copiar um exemplo.** Cada arquivo de `exemplos/` é um documento completo: copie-o, compile-o e
adapte. Para compilar:

```bash
cd exemplos/tabelas
latexmk -pdf tabela-simples.tex
```

**Compilar tudo** (o mesmo que o CI faz):

```bash
sh scripts/run-tests.sh            # todos
sh scripts/run-tests.sh tabelas    # só os que casam com o padrão
```

Requisitos: TeX Live ou MiKTeX recente (2024 ou mais), `latexmk` e os pacotes `abntex2`,
`biblatex-abnt`, `booktabs`, `siunitx`, `multirow`, `tabularx`, `longtable`, `xcolor`, `listings`,
`FiraMono`, `tikz`, `pgfplots`, `acro` e `mwe`. O exemplo do `minted` exige também Python e o
Pygments e `-shell-escape` (o script o ignora se não houver Pygments).

```bash
sh scripts/check-links.sh          # confere os links entre os arquivos Markdown
```

## Usar os exemplos em outro documento (por exemplo, um livro)

Cada exemplo marca o trecho que vale a pena exibir entre as linhas `%%BEGIN:id` e `%%END:id`.
Um documento externo inclui só esse trecho:

```latex
\lstinputlisting[linerange={BEGIN:tabelasimples-END:tabelasimples},
                 rangeprefix=\%\%, includerangemarker=false]{recursos/exemplos/tabelas/tabela-simples.tex}
```

O `id` tem **só letras e números** (o `-` separa o início do fim do intervalo no `listings`). O
teste [`tests/inclusao-livro.tex`](tests/inclusao-livro.tex) garante que esse mecanismo funciona.

Para manter o repositório do documento sincronizado com este, adicione-o como **submódulo do
git**:

```bash
git submodule add https://github.com/Smarzaro/latex-academico recursos
git submodule update --remote        # para trazer as novidades; depois, commit do novo ponteiro
```

O documento externo compila sempre contra uma versão fixa dos exemplos, e você decide quando
atualizar.

## Relação com a classe `abntex2-ufv`

Este repositório é independente da classe
[`abntex2-ufv`](https://github.com/Smarzaro/abntex2-ufv) (TCC de Sistemas de Informação da
UFV-CRP). Os exemplos usam a classe `abntex2`, da CTAN. Onde a classe `abntex2-ufv` oferece
um atalho (ambientes `ilustracao`, `tabela`, `codigo`), a receita avisa em uma nota.

## Licenças

- **Texto** (receitas, README, documentação): [CC BY 4.0](LICENSE).
- **Código** (arquivos `.tex`, scripts e trechos de código dos exemplos): [CC0 1.0](LICENSE-CODE),
  para que você cole os trechos no seu trabalho sem se preocupar com atribuição.

## Como citar

Veja [`CITATION.cff`](CITATION.cff) (o GitHub mostra o botão *Cite this repository*).

## Autor

Rodrigo Smarzaro ([Universidade Federal de Viçosa](https://www.ufv.br)).

## Contribuir

Correções e novas receitas são bem-vindas por *pull request*. Regras básicas: cada receita tem
um exemplo `.tex` compilável em `exemplos/`; os ids dos marcadores `%%BEGIN`/`%%END` têm só
letras e números; rode `sh scripts/run-tests.sh` antes de enviar.
