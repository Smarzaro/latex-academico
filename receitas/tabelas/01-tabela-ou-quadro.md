# 01 – Tabela ou quadro?

**Problema.** Qualquer conteúdo em linhas e colunas *parece* uma tabela, mas as normas
distinguem dois objetos (ABNT NBR 14724; normas de apresentação tabular do IBGE). Classificar
tudo como tabela é um erro formal comum: as listas ficam erradas (itens textuais na "Lista de
tabelas") e a apresentação foge do padrão. Isso não impede a compilação nem a leitura, mas é o
tipo de ajuste que a biblioteca ou a banca pode exigir antes da versão final.

**Regra prática.** Se você pode somar, comparar ou calcular com o conteúdo das células, é
**tabela**. Se as células contêm frases, é **quadro**.

|  | Tabela | Quadro |
|---|---|---|
| Conteúdo | Dados numéricos; o número é a informação central (medidas, contagens, percentuais) | Informação textual ou mista: definições, requisitos, comparações, cronogramas, tecnologias |
| Bordas | Abertas nos lados: sem linhas verticais; linhas horizontais no topo, sob o cabeçalho e na base | Fechadas: linhas em todos os lados e entre as linhas e colunas |
| Numeração e lista | "Tabela N"; Lista de tabelas | "Quadro N"; Lista de quadros |
| Rodapé | Abaixo, à esquerda: fonte, legenda e nota | O mesmo |

Toda tabela e todo quadro devem ser citados no texto (`\autoref{rótulo}`) e ficar o mais perto
possível da citação.

**Como fazer.**

- Tabela: [receita 03](03-tabela-simples.md) (e as 04 e 05 para casos especiais).
- Quadro: [receita 06](06-quadro.md).

> **Posição.** Use `[htbp]` e deixe o LaTeX posicionar o objeto perto da citação. Não force
> posições (`[H]`): isso gera grandes espaços em branco. A referência feita com `\autoref`
> continua correta mesmo que o objeto vá para outra página.
