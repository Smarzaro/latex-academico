# 01 – Química

**Problema.** Escrever fórmulas e equações químicas com índices, cargas e setas corretos, desenhar
a fórmula estrutural de uma molécula e grafar grandezas com unidades no padrão brasileiro.

**Solução.** `mhchem` (comando `\ce`), `chemfig` (comando `\chemfig`) e `siunitx` (comando
`\qty`). Exemplo completo: [`quimica.tex`](../../exemplos/areas/quimica.tex).

```latex
\usepackage[version=4]{mhchem}   % \ce{...}: fórmulas e equações químicas
\usepackage{chemfig}             % \chemfig{...}: fórmulas estruturais
\usepackage{siunitx}             % \qty{valor}{unidade}: grandezas com unidade
\sisetup{output-decimal-marker = {,}, per-mode = symbol}   % vírgula decimal e mol/L
```

## Fórmulas e equações

```latex
Combustão completa do metano:
\begin{center}
  \ce{CH4 + 2 O2 -> CO2 + 2 H2O}
\end{center}
Equilíbrio químico: \ce{N2 + 3 H2 <=> 2 NH3}.
Íons e hidratos: \ce{SO4^2-}, \ce{Fe^3+} e \ce{CuSO4 * 5 H2O}.
```

- Dentro de `\ce`, os números depois de um elemento viram índices (`H2O`) e o coeficiente vem
  antes, separado por espaço (`2 H2O`).
- `->` é a seta de reação e `<=>`, a de equilíbrio. A carga vem depois de `^` (`^2-`, `^3+`).
- O `*` produz o ponto centrado dos hidratos (`CuSO4 * 5 H2O`).
- `\ce` funciona no texto e dentro de equações; não escreva fórmulas com `$H_2O$`, que põe as
  letras em itálico.
- A opção `version=4` fixa a sintaxe atual do pacote; sem ela, o `mhchem` emite um aviso.

## Fórmula estrutural

```latex
A cafeína, \ce{C8H10N4O2}, substância indispensável à realização deste livro:
\begin{center}
  \chemfig{*6((=O)-N(-CH_3)-*5(-N=-N(-CH_3)-=)--(=O)-N(-H_3C)-)}
\end{center}
```

- `*6(...)` abre um anel de seis lados e `*5(...)`, um de cinco, aqui fundido ao primeiro. Dentro
  do anel, `-` é uma ligação simples e `=`, uma dupla.
- Os parênteses criam ramificações: `(=O)` é o oxigênio da carbonila, `(-CH_3)` o grupo metila.
- Nos átomos, `_3` faz o índice (`CH_3`). Do lado esquerdo do anel, o grupo é escrito ao contrário
  (`H_3C`), como se lê no desenho.
- Moléculas grandes ficam mais fáceis de escrever por partes: comece pelo anel, compile e
  acrescente um grupo por vez.

## Grandezas

```latex
Um café expresso de \qty{30}{\milli\litre} tem cerca de \qty{60}{\milli\gram} de cafeína
(massa molar \qty{194,19}{\gram\per\mole}), ou seja, \qty{2}{\gram\per\litre}, cerca de
\qty{0,01}{\mole\per\litre}.
```

- `\qty{valor}{unidade}` separa o número da unidade com o espaço correto e nunca quebra a linha
  entre eles. O valor pode ser escrito com vírgula ou ponto; a saída usa vírgula, pelo
  `output-decimal-marker`.
- `per-mode = symbol` escreve as unidades compostas com barra (g/mol, mol/L) em vez de expoente
  negativo.
- `\qty` é da versão 3 do `siunitx`; em textos antigos aparece `\SI`, que ainda funciona.
