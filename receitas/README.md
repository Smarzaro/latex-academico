# Índice das receitas

| Tema | Estado | Conteúdo |
|---|---|---|
| [Primeiros passos](basico/) | disponível | estrutura do documento, preâmbulo em português, espaços e parágrafos, divisões, alinhamento, hifenização, notas e links, comandos próprios |
| [Documentos longos](organizacao/) | disponível | um arquivo por capítulo, `\include` × `\input`, `\includeonly` |
| [Referência cruzada](referencia-cruzada/) | disponível | `\label`, `\ref`, `\pageref`, `\autoref`, `\cref` em português |
| [Tabelas e quadros](tabelas/) | disponível | tabela ou quadro, título/fonte/legenda/nota, tabela IBGE, células mescladas, tabela longa, quadro |
| [Figuras e gráficos](figuras/) | disponível | inserir imagem, subfiguras, diagramas com TikZ, gráficos com PGFPlots |
| [Matemática](matematica/) | disponível | fórmulas no texto e em destaque, `equation`, `align`, `\eqref`, matrizes, `cases`, operadores, teoremas, `siunitx` |
| [Código-fonte](codigo/) | disponível | configuração do `listings`, uso básico, opções, linguagens e acentos, preto e branco e `minted`, dicas |
| [Referências e citações](referencias/) | disponível | catálogo de entradas do `biblatex-abnt`, ajustes finos, comandos de citação |
| [Siglas, abreviaturas e glossário](siglas-glossario/) | disponível | `acro`, lista de siglas, lista de abreviaturas, glossário |
| [abnTeX2](abntex2/) | disponível | preâmbulo e dados do trabalho, ordem dos elementos (pré-textuais, textuais, pós-textuais), vários autores |
| [Classe abntex2-ufv](abntex2-ufv/) | disponível | ambiente `tabela` × `\IBGEtab`, figura com `ilustracao`, código-fonte como ilustração (float `codigo`), comparados com a abntex2 |
| [Escrita acadêmica](escrita/) | disponível | o que escrever em cada seção: introdução, objetivos, referencial, metodologia, resultados, conclusão |
| [Cronograma](cronograma/) | disponível | quadro com marcas, quadro com células sombreadas, diagrama de Gantt |
| [Apresentações e pôsteres](apresentacoes/) | disponível | beamer básico, sobreposições, modelo de defesa (metropolis), pôster (tikzposter), slides de uma disciplina com `subfiles`, identidade visual e transições, código, tabelas e diagramas nos slides |
| [Provas e listas de exercícios](avaliacoes/) | disponível | classe `exam`: prova, gabarito do mesmo arquivo, lista de exercícios, versões embaralhadas com `exam-randomizechoices`, scripts `gerar-versoes` |
| [Recursos por área do conhecimento](areas/) | disponível | química (`mhchem`, `chemfig`), estruturas de dados (`forest`, `algpseudocodex`), bancos de dados (`fddiagram`, SQL), programação (fluxograma, `algorithm2e`), biologia (`genealogytree`, Punnett) |
| [Diversão com LaTeX](diversao/) | disponível | xadrez, sudoku e dados, `tikzducks`/`tikzlings`, fractais, calendário, QR code, palavras cruzadas com [solução](../exemplos/diversao/solucao-palavras-cruzadas.md) |
| [Versionamento](versionamento/) | disponível | comparar duas versões com o `latexdiff` |

## Formato de uma receita

1. **Problema** (uma ou duas frases).
2. **Solução**, com o link para o exemplo `.tex` compilável em [`../exemplos/`](../exemplos/).
3. O código essencial, copiado do trecho marcado do exemplo (o `.tex` é a fonte da verdade).
4. Ajustes comuns, armadilhas e a lista de conferência.
5. Uma nota, quando existe, para quem usa a classe `abntex2-ufv`.
