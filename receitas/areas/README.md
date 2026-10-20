# Recursos por área do conhecimento

Cada área tem pacotes que resolvem os seus problemas de notação: equações químicas, árvores e
pseudocódigo, dependências funcionais, fluxogramas, heredogramas, provas, circuitos. As receitas abaixo mostram um
ponto de partida por área, com o essencial de cada pacote e as armadilhas mais comuns. Os
exemplos compiláveis e a lista de pacotes estão em [`exemplos/areas/`](../../exemplos/areas/).

| Receita | O que resolve |
|---|---|
| [01 – Química](01-quimica.md) | Fórmulas e equações com `mhchem`, fórmula estrutural com `chemfig`, grandezas com `siunitx` |
| [02 – Estruturas de dados](02-estruturas-de-dados.md) | Árvore com `forest`, lista encadeada com TikZ, pseudocódigo em português com `algpseudocodex` |
| [03 – Bancos de dados](03-bancos-de-dados.md) | Dependências funcionais com `fddiagram`, álgebra relacional, consulta SQL com `listings` |
| [04 – Programação](04-programacao.md) | Fluxograma com TikZ e algoritmo em português com `algorithm2e` |
| [05 – Biologia](05-biologia.md) | Heredograma com `genealogytree` e quadro de Punnett com `tabular` |
| [06 – Matemática](06-matematica.md) | Geometria com `tkz-euclide`, área sob a curva com `pgfplots`, simplificação com `cancel`, tabela-verdade (também automática, com `truthtable` e LuaLaTeX) e dedução natural com `bussproofs` |
| [07 – Física](07-fisica.md) | Circuito com `circuitikz`, diagrama de corpo livre com TikZ, derivadas com `derivative`, notação de Dirac com `braket` e grandezas com `siunitx` |

Em um trabalho acadêmico, cada um desses desenhos entra em um ambiente flutuante (`figure`, ou o
`algorithm` do próprio pacote), com título, fonte e menção no texto; os exemplos mostram só o
conteúdo para ficarem curtos. Sua área não está aqui? Veja como pedir ou contribuir com um exemplo
no [README dos exemplos](../../exemplos/areas/README.md).
