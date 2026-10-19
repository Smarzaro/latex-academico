# 01 – Comparar duas versões com o `latexdiff`

**Problema.** Mostrar ao orientador (ou à banca) o que mudou entre duas versões do texto, sem que
ele precise reler tudo.

**Solução.** O `latexdiff` lê as duas versões e escreve um terceiro `.tex`, igual à versão nova,
mas com as diferenças marcadas; compilado, ele mostra o texto removido riscado em vermelho e o
texto incluído sublinhado com uma linha ondulada em azul. Exemplos:
[`versao-1.tex`](../../exemplos/versionamento/versao-1.tex) (a versão antiga) e
[`versao-2.tex`](../../exemplos/versionamento/versao-2.tex) (a nova).

Um parágrafo da versão 1:

```latex
O uso de dispositivos móveis em sala de aula cresceu nos últimos anos. Este trabalho avalia o
impacto desse uso no desempenho dos alunos de uma turma de graduação.
```

O mesmo parágrafo na versão 2 (a quebra de linha mudou de lugar; isso não conta como diferença):

```latex
O uso de dispositivos móveis em sala de aula cresceu muito na última década. Este trabalho
avalia o impacto desse uso no desempenho dos alunos de duas turmas de graduação.
```

Na pasta dos exemplos, a versão antiga primeiro e a nova depois:

```sh
latexdiff versao-1.tex versao-2.tex > diferencas.tex
latexmk -pdf diferencas.tex
```

No `diferencas.tex`, o trecho vira:

```latex
O uso de dispositivos móveis em sala de aula cresceu \DIFdelbegin \DIFdel{nos últimos anos}\DIFdelend \DIFaddbegin \DIFadd{muito na última década}\DIFaddend . Este trabalho
avalia o impacto desse uso no desempenho dos alunos de \DIFdelbegin \DIFdel{uma turma }\DIFdelend \DIFaddbegin \DIFadd{duas turmas }\DIFaddend de graduação.
```

O `latexdiff` também acrescenta ao preâmbulo as definições de `\DIFadd` e `\DIFdel` (com os
pacotes `ulem` e `color`). Os arquivos originais não são alterados.

## Ajustes comuns

- **Outro estilo de marcação**: `latexdiff --type=CFONT versao-1.tex versao-2.tex > diferencas.tex`
  troca o sublinhado por cor e mudança de fonte (o texto incluído sai em azul, sem serifa);
  `--type=CHANGEBAR` só marca as linhas alteradas com uma barra na margem. A lista de estilos
  está em `latexdiff --help`.
- **Documento dividido em arquivos** (`\input`, `\include`): use `--flatten`, que junta os arquivos
  antes de comparar.
- **Versões guardadas no git**: o `latexdiff-vc` compara o arquivo atual com uma versão do
  histórico, por exemplo `latexdiff-vc --git -r HEAD~1 texto.tex`.
- **Compilar o resultado**: o `diferencas.tex` usa os mesmos pacotes, figuras e `.bib` da versão
  nova; gere-o na mesma pasta dela (ou copie o que ele usa) e compile com a mesma sequência
  (por exemplo, `latexmk`, que roda o `biber` quando é preciso).

## Armadilhas

- **MiKTeX**: se o `latexdiff` acusar a falta do módulo `Algorithm::Diff` do Perl, use o
  `latexdiff-so`, que já traz esse módulo embutido, com os mesmos argumentos.
- **Windows PowerShell 5.1**: o redirecionamento `>` grava o arquivo em UTF-16, que o LaTeX não lê.
  Rode o comando no Prompt de Comando (`cmd`) ou no Git Bash.
- **Ordem dos arquivos**: o primeiro é o antigo. Invertidos, o que foi incluído aparece como
  removido.
- **Tabelas, fórmulas e figuras** são as partes em que a marcação mais falha. Se o
  `diferencas.tex` não compilar por causa de uma fórmula destacada, use
  `--math-markup=whole`, que marca a fórmula inteira como alterada em vez de procurar a mudança
  dentro dela. Confira essas partes à mão.
- O `diferencas.tex` é descartável: não o edite nem o use como nova versão.

## Lista de conferência

- [ ] Guardou a versão enviada da última vez (cópia datada ou versão no git).
- [ ] Comando com o arquivo antigo primeiro.
- [ ] `diferencas.pdf` compila e mostra riscado o que saiu e sublinhado o que entrou.
- [ ] Partes com tabelas e fórmulas conferidas à parte.
