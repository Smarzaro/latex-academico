# 03 – Trabalho com mais de um autor

**Problema.** Um trabalho em grupo (TCC em dupla, relatório de disciplina) precisa de vários
nomes na capa e na folha de rosto.

**Solução.** Todos os nomes vão no mesmo `\autor`, separados por `\and` (na mesma linha, com
vírgulas) ou por `\\` (um nome por linha). Exemplo completo, com as duas formas, uma em cada
página: [`autores.tex`](../../exemplos/abntex2/autores.tex).

Na mesma linha (resultado: "Ana Souza, Bruno Lima, Carla Dias"):

```latex
\autor{Ana Souza \and Bruno Lima \and Carla Dias}
\imprimircapa
```

Um nome por linha:

```latex
\autor{Ana Souza \\ Bruno Lima \\ Carla Dias}
\imprimircapa
```

## Ajustes comuns e armadilhas

- O exemplo repete `\autor` antes de cada `\imprimircapa` só para mostrar as duas formas no mesmo
  arquivo. No trabalho, use um único `\autor`, no preâmbulo, com os demais dados (veja a
  [receita 01](01-preambulo-e-dados.md)).
- Com muitos autores ou nomes longos, prefira um nome por linha: a linha única fica longa demais e
  quebra em lugar arbitrário.
- Os nomes saem na ordem em que foram escritos; combine a ordem com o grupo (alfabética, em geral).
- O mesmo `\autor` alimenta também a folha de rosto (`\imprimirfolhaderosto`); confira as duas
  páginas depois de compilar.
