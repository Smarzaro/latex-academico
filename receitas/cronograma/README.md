# Cronograma

O cronograma mostra que o trabalho é viável: liste as atividades na ordem lógica (revisão
bibliográfica, levantamento de requisitos, modelagem, implementação, testes, escrita, defesa), com
duração realista e margem para imprevistos, e relacione-as aos objetivos específicos. Em um projeto
de TCC (TCC I), o cronograma é elemento esperado; na monografia final, em geral, é suprimido.

Como o cronograma não traz dados numéricos, ele é um **quadro** (e não uma tabela); os diagramas
(Gantt) são **figuras**. Escolha *uma* das formas abaixo. Os exemplos compiláveis estão em
[`exemplos/cronograma/`](../../exemplos/cronograma/).

| Receita | Forma |
|---|---|
| [01 – Quadro com marcas e com células sombreadas](01-quadro-marcas-e-sombreado.md) | Quadros; o sombreado imprime bem em preto e branco |
| [02 – Diagrama de Gantt](02-diagrama-de-gantt.md) | Figura em TikZ: barras ao longo do tempo, com as sobreposições evidentes |

Para projetos com entregas (relatórios, artigos), o exemplo
[`cronograma-entregas.tex`](../../exemplos/cronograma/cronograma-entregas.tex) destaca em outra cor os
meses com marco de entrega. Para cronogramas com muitas atividades, que passam de uma página, troque
o `tabular` por um `longtable`, que repete o cabeçalho em cada página.

Em todos os exemplos o objeto ocupa a largura do texto sem alterar o tamanho da letra. Em qualquer
caso a fonte é obrigatória e a legenda (ou a nota) explica o símbolo usado.
