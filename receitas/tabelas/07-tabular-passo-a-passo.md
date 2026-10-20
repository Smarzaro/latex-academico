# 07 – O ambiente tabular passo a passo

**Problema.** Montar uma tabela do zero: colunas, linhas, células com texto longo, largura total,
linhas horizontais e cores.

**Solução.** O ambiente `tabular` e os pacotes que o completam, um recurso de cada vez. Cada
trecho do exemplo fica em uma página, para comparar os resultados.
Exemplo completo: [`tabular-basico.tex`](../../exemplos/tabelas/tabular-basico.tex). Para a
tabela no padrão ABNT/IBGE, com título, fonte e nota, veja a [receita 03](03-tabela-simples.md).

```latex
\usepackage{array}             % colunas m{} e b{}
\usepackage{tabularx}          % colunas X (largura total fixa)
\usepackage{tabulary}          % colunas L, C, R, J (largura máxima)
\usepackage{booktabs}          % \toprule, \midrule, \bottomrule
\usepackage{multirow}          % \multirow
\usepackage[table]{xcolor}     % cores em tabelas
```

## 1. Colunas e células

```latex
\begin{tabular}{ccl}
  \textbf{Qtd} & \textbf{Medida}  & \textbf{Ingrediente} \\
  500          & g                & polvilho azedo \\
  1            & copo americano   & água \\
\end{tabular}
```

O argumento `{ccl}` define uma letra por coluna: `l` (esquerda), `c` (centro) ou `r` (direita).
O `&` separa as células e `\\` termina a linha. Os espaços dentro das células são ignorados:
alinhar o código-fonte, como acima, só facilita a leitura.

## 2. Linhas

`|` entre as letras do argumento desenha uma linha vertical; `\hline` desenha uma linha
horizontal em toda a largura e `\cline{2-3}`, só sob as colunas 2 a 3. Em tabelas acadêmicas,
prefira as linhas do `booktabs` (seção 5), sem linhas verticais.

## 3. Texto longo numa célula

Uma coluna `l`, `c` ou `r` nunca quebra a linha: o texto longo alarga a coluna até sair da
margem. Para quebrar, use uma coluna de parágrafo com largura fixa:

```latex
\begin{tabular}{|l|c|p{4cm}|}
```

`p{4cm}` alinha o texto pelo topo da célula; com o pacote `array`, `m{4cm}` o centraliza na
vertical e `b{4cm}` o alinha pela base.

## 4. Largura total da tabela

| Ambiente | Como funciona |
|---|---|
| `tabularx` | Largura total fixa (`{\linewidth}`); as colunas `X` dividem o espaço que sobra |
| `tabulary` | Largura *máxima*; as colunas `L`, `C`, `R` e `J` crescem conforme o conteúdo |

```latex
\begin{tabularx}{.6\linewidth}{|l|c|X|}
```

Com várias colunas `X`, todas ficam com a mesma largura (`{X|X|X}`), tenham pouco ou muito texto.
O `tabulary` dá mais espaço à coluna com mais texto.

## 5. Linhas do `booktabs`

```latex
\begin{tabular}{ccl}
  \toprule
  \textbf{Qtd} & \textbf{Medida} & \textbf{Ingrediente} \\
  \midrule
  500 & g & polvilho azedo \\
  \bottomrule
\end{tabular}
```

`\toprule` e `\bottomrule` são mais grossas que `\midrule`, e as três têm espaço acima e abaixo
do texto. É o desenho da apresentação tabular do IBGE.

## 6. Células mescladas

`\multicolumn{3}{c}{texto}` junta três colunas em uma célula, com o alinhamento indicado (com
bordas, inclua as barras: `{|c|}`). `\multirow{3}{*}{texto}`, do pacote `multirow`, junta três
linhas; as células de baixo ficam vazias. Veja a [receita 04](04-celulas-mescladas.md) para
cabeçalhos agrupados.

## 7. Cores

Com `\usepackage[table]{xcolor}`:

- `\rowcolors{2}{gray!15}{white}` antes da tabela: linhas alternadas a partir da segunda;
  `\hiderowcolors` e `\showrowcolors` desligam e religam as cores no meio da tabela;
- `\rowcolor{gray!30}` no início de uma linha: cor de fundo da linha;
- `\cellcolor{red!20}` dentro de uma célula: cor de uma célula só.

Use as cores com moderação: na impressão em preto e branco, elas viram tons de cinza.

## Erros comuns

- **`Extra alignment tab has been changed to \cr`.** A linha tem mais `&` do que colunas no
  argumento.
- **`Misplaced \noalign`.** `\hline` ou `\midrule` sem o `\\` na linha anterior.
- **A tabela passa da margem.** Troque a coluna de texto por `p{...}` ou use `tabularx`; veja os
  ajustes de largura na [receita 03](03-tabela-simples.md).
