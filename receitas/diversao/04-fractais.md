# 04 – Fractais

**Problema.** Desenhar um fractal (o floco de neve de Koch) ou uma planta ramificada sem calcular
coordenadas, a partir de regras simples de substituição.

**Solução.** A biblioteca `lindenmayersystems` do TikZ, que implementa os sistemas de Lindenmayer:
uma palavra inicial (o axioma) é reescrita várias vezes pelas regras, e o resultado é lido como
instruções de desenho. Exemplo completo: [`fractal.tex`](../../exemplos/diversao/fractal.tex).

```latex
\usepackage{tikz}
\usetikzlibrary{lindenmayersystems}
```

## Floco de neve de Koch

```latex
\pgfdeclarelindenmayersystem{Koch}{%
  \rule{F -> F-F++F-F}}              % cada segmento vira quatro
\begin{tikzpicture}
  \draw[blue!70!black, l-system={Koch, axiom=F++F++F, order=4,
        step=0.8mm, angle=60}]
    lindenmayer system -- cycle;
\end{tikzpicture}
```

## Planta

```latex
\pgfdeclarelindenmayersystem{Planta}{%
  \rule{X -> F[+X]F[-X]+X}           % [ e ] guardam e recuperam a posição
  \rule{F -> FF}}
\begin{tikzpicture}
  \draw[green!50!black, rotate=90, l-system={Planta, axiom=X, order=5,
        step=1.1mm, angle=25}]
    lindenmayer system;
\end{tikzpicture}
```

## Como ler as regras

- `F` anda um passo (`step`) desenhando; `+` e `-` giram o lápis pelo ângulo (`angle`) para um
  lado e para o outro.
- `[` guarda a posição e a direção atuais, e `]` volta a elas: é assim que nascem os galhos.
- Símbolos sem significado de desenho, como o `X` da planta, só servem para a reescrita.
- `order` é o número de reescritas. No Koch, o axioma `F++F++F` é um triângulo (giros de
  2 × 60°), e cada reescrita troca todo segmento por quatro menores.
- A planta cresce para a direita; `rotate=90` a põe em pé.

## Ajustes e armadilhas

- O número de segmentos cresce exponencialmente com `order`: no Koch, cada ordem multiplica os
  segmentos por 4. Suba um nível por vez; ordens altas deixam a compilação lenta e podem esgotar a
  memória do TeX.
- O tamanho também cresce com a ordem (o Koch fica 3 vezes maior a cada nível, a planta dobra o
  tronco pela regra `F -> FF`): ao aumentar `order`, diminua `step` na mesma proporção.
- Mudar `angle` muda a forma: experimente 20° ou 30° na planta.
- O `-- cycle` fecha o contorno do floco, o que permite preenchê-lo (`fill=...`).
