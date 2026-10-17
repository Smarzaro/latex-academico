# 06 – Dicas

- **Código longo** (mais de uma página) vai para apêndice ou repositório; no texto, mostre só o
  essencial e cite o repositório nas referências.
- **Nunca use imagem** (*print*) de código: não pode ser copiado nem lido por leitores de tela, e
  perde nitidez.
- **Cuide da indentação e da largura.** Com `\footnotesize` cabem cerca de 85 colunas de código
  na largura do texto; linhas mais longas são quebradas (`breaklines=true`).
- **Cite sempre a listagem no texto**, com `Código~\ref{rótulo}`, e explique o que ela faz.
- **Fonte obrigatória.** Indique a fonte abaixo da listagem (`\fonte{...}`), mesmo quando o
  código é do próprio autor.
- **Código de arquivos.** Prefira `\lstinputlisting` a copiar o código: o texto nunca fica
  diferente do arquivo, e você pode listar só as linhas de interesse.
- **Cores.** Verifique a legibilidade em escala de cinza; use o estilo em preto e branco para
  impressão sem cores.
- **Lista de códigos.** `\lstlistoflistings` imprime a lista (ajuste o título com
  `\lstlistlistingname`).
