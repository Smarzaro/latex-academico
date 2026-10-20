# Apresentações e pôsteres

Slides de defesa, de seminário ou de aula se fazem com a classe `beamer`: cada `frame` vira uma
página do PDF (ou várias, quando o conteúdo é revelado aos poucos), e o PDF é projetado em tela
cheia em qualquer leitor. Pôsteres para eventos se fazem em uma única página grande, com a classe
`tikzposter` ou com os pacotes comparados na receita 08. Nos dois casos, citações, referências, tabelas, figuras e fórmulas funcionam como no
texto do trabalho.

Os exemplos compiláveis estão em [`exemplos/apresentacoes/`](../../exemplos/apresentacoes/); a
subpasta [`curso/`](../../exemplos/apresentacoes/curso/) mostra os slides de uma disciplina
inteira, com uma aula por arquivo, e a subpasta
[`poster-evento/`](../../exemplos/apresentacoes/poster-evento/), o mesmo pôster de evento em
quatro pacotes.

| Receita | O que resolve |
|---|---|
| [01 – Primeira apresentação com beamer](01-primeira-apresentacao.md) | Preâmbulo, slide de título, frames, listas e blocos |
| [02 – Revelar o conteúdo aos poucos](02-revelar-aos-poucos.md) | `\pause`, especificadores `<...>`, listas incrementais, `\uncover` e `\only` |
| [03 – Modelo para defesa ou seminário](03-modelo-de-defesa.md) | Tema `metropolis`, roteiro, colunas, citações e referências, slide final |
| [04 – Pôster acadêmico](04-poster.md) | Pôster A0 com `tikzposter`: título, colunas, blocos e figura |
| [05 – Slides de uma disciplina com `subfiles`](05-curso-com-subfiles.md) | Uma aula por arquivo, cada aula compilável sozinha, curso completo e versão para impressão |
| [06 – Identidade visual e slides de transição](06-identidade-visual.md) | Cores próprias, blocos com significado, abertura automática de aulas e seções |
| [07 – Código, tabelas e diagramas nos slides](07-codigo-tabelas-diagramas.md) | `lstlisting` com destaques, tabela com linhas alternadas, diagrama revelado em passos |
| [08 – Pôster de evento em quatro pacotes](08-poster-de-evento.md) | O mesmo pôster de 90 × 120 cm com `beamerposter`, `tikzposter`, `a0poster` e `tcbposter`, e a comparação entre eles |

## Antes de começar

- Um slide é lido em segundos: frases curtas, poucos tópicos, letra grande. Prefira uma figura ou
  um diagrama a um parágrafo.
- Uma regra prática para defesas: cerca de um slide por minuto de apresentação.
- Teste o PDF no projetor (ou na proporção dele) antes do dia: os exemplos usam 16:9
  (`aspectratio=169`); sem a opção, o `beamer` usa 4:3.
