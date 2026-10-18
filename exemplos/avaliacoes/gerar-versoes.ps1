# Gera várias versões de uma prova feita com exam + exam-randomizechoices, e o gabarito de cada uma.
# A prova precisa ter, no preâmbulo:  \providecommand{\versao}{1}  \setrandomizerseed{\versao}
#                                     \ifdefined\gabarito \printanswers \fi
# Uso (na pasta da prova, no PowerShell):  .\gerar-versoes.ps1 prova-versoes.tex 4
#   gera versoes\prova-versoes-v1.pdf ... -v4.pdf e versoes\prova-versoes-gabarito-v1.pdf ...
# Os arquivos auxiliares ficam em versoes\aux\ e podem ser apagados.
param(
  [Parameter(Mandatory = $true)][string]$Arq,
  [int]$N = 3
)
$base = [System.IO.Path]::GetFileNameWithoutExtension($Arq)
New-Item -ItemType Directory -Force "versoes\aux" | Out-Null
foreach ($v in 1..$N) {
  latexmk -pdf -silent -interaction=nonstopmode -auxdir=versoes/aux -outdir=versoes `
    "-jobname=$base-v$v" "-usepretex=\def\versao{$v}" $Arq | Out-Null
  if ($LASTEXITCODE -ne 0) { Write-Error "Erro na versão $v (veja versoes\aux\$base-v$v.log)"; exit 1 }
  latexmk -pdf -silent -interaction=nonstopmode -auxdir=versoes/aux -outdir=versoes `
    "-jobname=$base-gabarito-v$v" "-usepretex=\def\versao{$v}\def\gabarito{1}" $Arq | Out-Null
  if ($LASTEXITCODE -ne 0) { Write-Error "Erro no gabarito $v (veja versoes\aux\$base-gabarito-v$v.log)"; exit 1 }
  Write-Host "versão ${v}: versoes\$base-v$v.pdf e versoes\$base-gabarito-v$v.pdf"
}
