# 05 – Gerar várias versões de uma vez

**Problema.** Compilar uma por uma as versões de uma prova, e o gabarito de cada uma, é repetitivo
e dá margem a erro (versão errada, PDF sobrescrito, gabarito de outra versão).

**Solução.** Os scripts [`gerar-versoes.sh`](../../exemplos/avaliacoes/gerar-versoes.sh) (Linux,
macOS e Git Bash) e [`gerar-versoes.ps1`](../../exemplos/avaliacoes/gerar-versoes.ps1)
(PowerShell, no Windows). Para cada versão de 1 a N, eles chamam o `latexmk` duas vezes: uma para
a prova e outra, com `\gabarito` definido, para o gabarito. Servem para qualquer prova preparada
como na [receita 04](04-prova-com-versoes.md), isto é, com estas linhas no preâmbulo:

```latex
\providecommand{\versao}{1}          % versão padrão, se nenhuma for informada na compilação
\setrandomizerseed{\versao}          % a versão é a semente do sorteio: mesma versão, mesma ordem
\ifdefined\gabarito \printanswers \fi
```

## Uso

Na pasta da prova, informe o arquivo e o número de versões (3, se omitido):

```sh
sh gerar-versoes.sh prova-versoes.tex 4
```

```powershell
.\gerar-versoes.ps1 prova-versoes.tex 4
```

O resultado fica na pasta `versoes/`:

```text
versoes/prova-versoes-v1.pdf   versoes/prova-versoes-gabarito-v1.pdf
versoes/prova-versoes-v2.pdf   versoes/prova-versoes-gabarito-v2.pdf
...
versoes/aux/                   arquivos auxiliares (podem ser apagados)
```

## Ajustes comuns e armadilhas

- Copie o script para a pasta da sua prova; ele grava `versoes/` na pasta em que é executado.
- No PowerShell, se a execução de scripts estiver bloqueada, rode
  `powershell -ExecutionPolicy Bypass -File .\gerar-versoes.ps1 prova.tex 4`, que libera só
  essa execução.
- Os dois scripts compilam em silêncio. O de PowerShell para e informa a versão com erro; o de
  shell para sem mensagem (por causa do `set -e`). Nos dois casos, o motivo está no `.log` da
  versão em `versoes/aux/`.
- No `.sh`, o `-usepretex` termina com um espaço antes das aspas (`"\def\versao{$v} "`): no Git
  Bash, sem esse espaço, as barras invertidas e as chaves se perdem. Mantenha o espaço se adaptar
  o script.
- Para outra combinação, por exemplo só os gabaritos, apague a chamada correspondente do
  `latexmk` no laço do script.

## Lista de conferência

- Cada PDF de prova mostra no cabeçalho o número da versão do nome do arquivo?
- A chave de respostas de cada gabarito confere com a ordem das alternativas da prova da mesma
  versão (confira ao menos uma questão por versão)?
- Os PDFs foram gerados de novo depois da última alteração na prova?
