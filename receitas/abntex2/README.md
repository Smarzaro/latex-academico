# abnTeX2

A classe `abntex2` (pacote `abntex2`, no TeX Live e no MiKTeX) formata trabalhos acadêmicos
conforme a NBR 14724: capa, folha de rosto, resumos, listas, sumário, texto, referências,
apêndices e anexos, com as margens, os espaçamentos e a numeração de páginas da norma. Ela é
construída sobre o `memoir`, cujos comandos continuam disponíveis.

As receitas abaixo partem de um esqueleto de TCC que compila e mostra a ordem dos elementos. Os
exemplos estão em [`exemplos/abntex2/`](../../exemplos/abntex2/); para começar um documento
curto (só capítulos e referências), use o modelo
[`modelos/abnt-minimo.tex`](../../modelos/abnt-minimo.tex).

| Receita | O que resolve |
|---|---|
| [01 – Preâmbulo e dados do trabalho](01-preambulo-e-dados.md) | Opções da classe, pacotes essenciais e os dados que vão para a capa e a folha de rosto |
| [02 – Ordem dos elementos do trabalho](02-ordem-dos-elementos.md) | Pré-textuais, textuais e pós-textuais: resumos, listas, sumário, alíneas, citação longa, apêndices e anexos |
| [03 – Trabalho com mais de um autor](03-varios-autores.md) | Vários nomes na capa, na mesma linha ou um por linha |
| [04 – Trabalho completo](04-trabalho-completo.md) | O modelo de TCC com um arquivo por capítulo, listas, siglas, quadro e código, e as dúvidas mais comuns |

Assuntos ligados, em outras receitas:

- referências e citações com o `biblatex-abnt`: [referências e citações](../referencias/);
- tabelas no padrão IBGE (`\IBGEtab`), quadros, `\fonte` e `\nota`: [tabelas e quadros](../tabelas/);
- siglas e abreviaturas: [siglas e glossário](../siglas-glossario/);
- o que escrever em cada parte: [escrita acadêmica](../escrita/);
- a classe `abntex2-ufv`, construída sobre a `abntex2`: [abntex2-ufv](../abntex2-ufv/).

Quando a instituição oferece um modelo próprio (uma classe ou um preâmbulo pronto), use-o: ele já
traz a capa, a folha de aprovação e os ajustes locais.
