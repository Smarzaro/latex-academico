# Versionamento

Um trabalho acadêmico passa por muitas versões: a que foi para o orientador, a que voltou com
correções, a que foi para a banca, a final. Como o texto em LaTeX é um arquivo de texto puro, as
diferenças entre duas versões podem ser calculadas por programas e mostradas no próprio PDF,
com o texto removido riscado e o texto incluído sublinhado.

O programa para isso é o `latexdiff`, que acompanha o TeX Live e o MiKTeX. Os exemplos estão em
[`exemplos/versionamento/`](../../exemplos/versionamento/): duas versões do mesmo texto curto,
que o `scripts/run-tests.sh` compara a cada execução.

| Receita | O que resolve |
|---|---|
| [01 – Comparar duas versões com o `latexdiff`](01-latexdiff.md) | Gerar um PDF que mostra o que foi incluído, removido e alterado entre duas versões |

Guardar as versões é outro assunto: um sistema de controle de versão (como o git) registra cada
mudança com data e mensagem, e o `latexdiff` pode comparar qualquer par dessas versões. Mesmo
sem ele, guarde uma cópia datada do `.tex` a cada envio ao orientador ou à banca
(`texto-2026-03-15.tex`): é ela que você vai comparar com a versão seguinte.
