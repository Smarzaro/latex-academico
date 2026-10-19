# 03 – Bancos de dados

**Problema.** Na disciplina de bancos de dados, mostrar as dependências funcionais de uma relação
(para a normalização), escrever expressões de álgebra relacional e listar uma consulta SQL.

**Solução.** O pacote `fddiagram`, que desenha o diagrama de dependências a partir de uma lista de
regras, os símbolos de álgebra relacional em modo matemático e o `listings` para o SQL. Exemplo
completo: [`bancos-de-dados.tex`](../../exemplos/areas/bancos-de-dados.tex).

```latex
\usepackage{amsmath}                  % \text{...}
\usepackage[spacing=2.4]{fddiagram}  % diagramas de dependências funcionais
\input{../codigo/estilo-codigo}       % listings com o estilo dos exemplos
```

## Dependências funcionais

```latex
Dependências funcionais da relação
Inscrição(Matrícula, Nome, Curso, Coordenador, Disciplina, Nota):
\begin{center}
% os nomes saem em modo matemático: \text{} mantém os acentos e a letra reta
\begin{fddiagram}
  \text{Matrícula} -> \text{Nome}, \text{Curso} ;
  \text{Curso} -> \text{Coordenador} ;
  \text{Matrícula}, \text{Disciplina} -> \text{Nota}
\end{fddiagram}
\end{center}
```

- Cada regra tem a forma `determinante -> dependentes`; atributos de um mesmo lado são separados
  por vírgula e as regras, por ponto e vírgula (a última não tem). O pacote põe os atributos em
  uma linha, na ordem em que aparecem pela primeira vez, e desenha uma régua com as setas para
  cada dependência, rotulada df1, df2...
- `spacing` é a distância entre os atributos, em centímetros (o padrão é 1.05); aumente-a para
  nomes longos. As opções valem para o documento todo no `\usepackage` ou para um só diagrama em
  `\begin{fddiagram}[...]`; `attrs={...}` fixa a ordem dos atributos.
- **Versão 0.3** (a do exemplo, ainda distribuída no TeX Live): os nomes dos atributos são
  compostos em modo matemático. Sem `\text{...}` (do `amsmath`), "Matrícula" sairia em itálico de
  fórmula, sem os espaços entre letras corretos e com problema nos acentos.
- **Versão 0.4** (já no CTAN): os nomes são compostos em modo texto, e o `\text` deixa de ser
  necessário. As opções `attrfont` (fonte dos atributos) e `mathattrs` (volta ao modo
  matemático) ajustam a composição. Confira a versão instalada no `.log` (linha
  `Package: fddiagram`) antes de remover os `\text`.

## Álgebra relacional

```latex
Nomes dos alunos do curso de Química:
\[
  \pi_{\text{Nome}}\bigl(\sigma_{\text{Curso} = \text{'Química'}}(\text{Aluno})\bigr)
\]
Alunos e suas notas, com a junção natural:
\(\pi_{\text{Nome},\,\text{Nota}}(\text{Aluno} \bowtie \text{Inscrição})\).
```

- Projeção (`\pi`) e seleção (`\sigma`) levam a condição como índice; nomes de relações e
  atributos ficam em `\text` para não saírem em itálico.
- `\bowtie` é o símbolo da junção natural; `\bigl(` e `\bigr)` aumentam os parênteses externos.

## Consulta SQL

```latex
\begin{lstlisting}[language=SQL, morekeywords={JOIN}]
SELECT a.nome, i.nota
  FROM aluno a
  JOIN inscricao i ON i.matricula = a.matricula
 WHERE i.disciplina = 'BD1'
 ORDER BY i.nota DESC;
\end{lstlisting}
```

- `morekeywords={JOIN}` destaca `JOIN`, que não está na lista de palavras-chave do SQL do
  `listings`.
- O exemplo usa o estilo de [`exemplos/codigo/`](../../exemplos/codigo/) pelo caminho relativo
  `../codigo/estilo-codigo`. No seu documento, copie o arquivo `estilo-codigo.tex` para a pasta do
  projeto e ajuste o `\input` (veja as [receitas de código-fonte](../codigo/)).
