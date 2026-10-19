# Documentos longos em vários arquivos

Um TCC, uma dissertação ou um livro ficam mais fáceis de escrever, revisar e versionar quando cada
capítulo está em um arquivo próprio e um arquivo principal reúne tudo. O exemplo compilável está em
[`exemplos/organizacao/`](../../exemplos/organizacao/).

| Receita | O que resolve |
|---|---|
| [01 – Um arquivo por capítulo](01-um-arquivo-por-capitulo.md) | `\include` e `\input`, `\includeonly` para compilar só o capítulo em revisão, rótulos entre arquivos |

Para as referências cruzadas entre capítulos (`\label`, `\ref`, `\autoref`), veja as receitas de
[referência cruzada](../referencia-cruzada/).

## Lista de conferência

- Só o arquivo principal tem `\documentclass`, preâmbulo e `\begin{document}`?
- Os capítulos são compilados a partir do principal (o editor sabe qual é o arquivo principal)?
- Os nomes de arquivos e pastas não têm espaços nem acentos?
- O `\includeonly` foi comentado antes de gerar a versão final?
