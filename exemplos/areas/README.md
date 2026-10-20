# Recursos por área do conhecimento

Exemplos de pacotes próprios de cada área, para material didático, trabalhos e provas. Cada arquivo
é um documento completo e compilável; o livro *LaTeX para Documentos Acadêmicos* mostra uma amostra
deles.

| Área | Arquivo | Pacotes |
|---|---|---|
| Química | [`quimica.tex`](quimica.tex) | `mhchem` (equações), `chemfig` (fórmula estrutural da cafeína), `siunitx` (grandezas) |
| Estruturas de dados | [`estruturas-de-dados.tex`](estruturas-de-dados.tex) | `forest` (árvore binária de busca), TikZ (lista encadeada), `algpseudocodex` (busca binária em português) |
| Bancos de dados | [`bancos-de-dados.tex`](bancos-de-dados.tex) | `fddiagram` (dependências funcionais), álgebra relacional, SQL com `listings` |
| Programação | [`programacao.tex`](programacao.tex) | fluxograma com TikZ, `algorithm2e` em português |
| Biologia | [`biologia.tex`](biologia.tex) | `genealogytree` (heredograma), quadro de Punnett com `tabular` |
| Matemática | [`matematica.tex`](matematica.tex) | `tkz-euclide` (triângulo e circunferência inscrita), `pgfplots` com `fillbetween` (área sob a curva), `cancel` (simplificação), tabela-verdade com `tabular`, `bussproofs` (dedução natural) |
| Matemática (LuaLaTeX) | [`logica-truthtable.tex`](logica-truthtable.tex) | `truthtable` (tabela-verdade calculada automaticamente) |
| Física | [`fisica.tex`](fisica.tex) | `circuitikz` (circuito RC), TikZ (corpo livre no plano inclinado), `derivative`, `braket` e `siunitx` (notação) |

O `logica-truthtable.tex` só compila com LuaLaTeX: a primeira linha, `% !TEX program = lualatex`,
avisa o TeXstudio e os testes do repositório. No VS Code, use a receita *latexmk (lualatex)* do
LaTeX Workshop, que por padrão ignora o comentário; no Overleaf, escolha o compilador em
*Menu > Compiler*.

## Sua área não está aqui?

Peça um exemplo pelo formulário
[Pedido de exemplo ou receita](https://github.com/Smarzaro/latex-academico/issues/new/choose),
indicando a área do conhecimento, ou contribua com um exemplo por *pull request* (veja a seção
"Contribuir" do [README](../../README.md)). Exemplos de engenharias, estatística, linguística e
música são bem-vindos.
