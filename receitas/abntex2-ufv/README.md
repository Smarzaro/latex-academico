# Classe abntex2-ufv

A classe [`abntex2-ufv`](https://ctan.org/pkg/abntex2-ufv), disponível no CTAN, é construída sobre
a `abntex2`: carrega a `abntex2` (e, com ela, o `memoir`), fixa papel A4 e português do Brasil
como idioma principal, usa por padrão letra de 12 pt e acrescenta ambientes para montar
ilustrações e tabelas na largura do próprio conteúdo. Os comandos da `abntex2` (`\fonte`, `\nota`,
`\IBGEtab`, `\imprimircapa`...) continuam disponíveis; as receitas abaixo mostram só o que muda.

Cada receita compara o mesmo objeto feito com a `abntex2` pura e com a `abntex2-ufv`. Os
exemplos compiláveis estão em [`exemplos/abntex2-ufv/`](../../exemplos/abntex2-ufv/); os que usam
a classe começam com a linha `% !requer: abntex2-ufv.cls`.

| Receita | O que resolve |
|---|---|
| [01 – Tabela: `\IBGEtab` ou ambiente `tabela`](01-tabela.md) | Tabela IBGE com título e rodapé na largura da tabela, nas duas classes |
| [02 – Figura com o ambiente `ilustracao`](02-figura-ilustracao.md) | Título, fonte, legenda e nota na largura da imagem |
| [03 – Código-fonte como ilustração](03-codigo.md) | Float `codigo`, com numeração e lista próprias |

## Instalação

A classe está no CTAN e entra no TeX Live e no MiKTeX como pacote `abntex2-ufv`. Se o compilador
acusar `File 'abntex2-ufv.cls' not found`, instale o pacote pelo gerenciador da distribuição
(`tlmgr install abntex2-ufv` no TeX Live; o MiKTeX Console no MiKTeX) ou copie o
`abntex2-ufv.cls` e o `abntex2-ufv.sty` para a pasta do documento. Para usar uma cópia em outra
pasta sem instalá-la, aponte a variável `TEXINPUTS` para ela (é o que os testes deste repositório
fazem quando a classe não está na distribuição).

## Quando usar cada classe

- **`abntex2`**: a classe de referência para trabalhos acadêmicos no padrão ABNT, com os elementos
  pré-textuais, textuais e pós-textuais; veja as receitas de [abnTeX2](../abntex2/).
- **`abntex2-ufv`**: quando o modelo da sua instituição for ela, ou quando você quiser os ambientes
  `tabela` e `ilustracao` (título e rodapé que acompanham a largura do conteúdo, legenda, rodapé
  em espaço simples) e os floats `quadro`, `grafico` e `codigo` com listas próprias.

Diferenças que aparecem logo no preâmbulo:

- `\documentclass{abntex2-ufv}` já escolhe 12 pt, A4, uma face (`oneside`) e o idioma; os
  exemplos não passam nenhuma opção à classe.
- A classe carrega o `fontenc` com `T1` e o `indentfirst`; os demais pacotes (`graphicx`,
  `booktabs`, `siunitx`, `biblatex`...) continuam no preâmbulo do documento.
- A partir da versão 1.7 a classe não carrega mais o `biblatex`: carregue-o no preâmbulo, como na
  [receita de referências](../referencias/). A opção antiga `nobiblatex` é ignorada, com aviso.
