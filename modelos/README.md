# Modelos

Modelos para começar um documento: do mínimo ao trabalho completo.

| Arquivo | Para quê |
|---|---|
| [`abnt-minimo.tex`](abnt-minimo.tex) | Documento ABNT mínimo: `abntex2`, `biblatex-abnt`, um capítulo e a lista de referências |
| [`tcc-abntex2/`](tcc-abntex2/) | TCC completo com a `abntex2`: arquivo principal, um arquivo por capítulo, folha de aprovação, listas de figuras, quadros, códigos e tabelas, siglas com `acro`, apêndice e anexo |
| [`tcc-abntex2-ufv/`](tcc-abntex2-ufv/) | O mesmo TCC com a classe [`abntex2-ufv`](https://ctan.org/pkg/abntex2-ufv), que já define os flutuantes, as listas e os ambientes `ilustracao` e `tabela` (ignorado nos testes se a classe não estiver instalada) |

Nos modelos de TCC, copie a pasta inteira e compile o arquivo principal (`latexmk -pdf tcc.tex`).
As dúvidas mais comuns (ordem dos pacotes e das listas, `\include` e `\input`, flutuantes
próprios, apêndices e anexos) estão na receita
[abntex2/04 – Trabalho completo](../receitas/abntex2/04-trabalho-completo.md). Quando a
instituição oferece um modelo próprio, use-o: ele já traz a capa e os ajustes locais.
