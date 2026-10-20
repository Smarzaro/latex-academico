# 07 – Física

**Problema.** Desenhar um circuito elétrico e um diagrama de corpo livre e escrever a notação da
física (vetores, derivadas, integrais de superfície, notação de Dirac, grandezas com unidade) de
forma consistente.

**Solução.** O `circuitikz` para o circuito, o TikZ com as bibliotecas `angles` e `quotes` para o
diagrama de forças, o `derivative` e o `braket` para a notação e o `siunitx` para as grandezas.
Exemplo completo: [`fisica.tex`](../../exemplos/areas/fisica.tex).

```latex
\usepackage{amsmath, esint}  % esint: \oint e outras integrais
\usepackage{circuitikz}      % circuitos elétricos (carrega o TikZ)
\usetikzlibrary{angles, quotes, babel}  % babel: aspas do TikZ em português
\usepackage{derivative}      % \odv e \pdv: derivadas
\usepackage{braket}          % \bra, \ket e \braket: notação de Dirac
\usepackage{siunitx}         % \qty{valor}{unidade}
\sisetup{output-decimal-marker = {,}}
\DeclareMathOperator{\sen}{sen}  % seno em português
```

- A biblioteca `babel` do TikZ é necessária com o `babel` em português: ele torna as aspas `"`
  um caractere especial, e a sintaxe `"$\theta$"` da biblioteca `quotes` deixa de funcionar
  (o erro fala em `\language@active@arg`).
- O LaTeX tem `\sin`, mas não `\sen`; `\DeclareMathOperator` cria o operador com o espaçamento e
  a letra em pé corretos. Escrever `sen` direto na fórmula daria letras em itálico.

## Circuito com `circuitikz`

```latex
Circuito RC: ao fechar a chave $S$, o capacitor carrega e
\[ v_C(t) = \varepsilon \left(1 - e^{-t/RC}\right). \]
\begin{center}
\begin{circuitikz}
  \draw (0,0) to[battery1, l=$\varepsilon$] (0,3)
        to[switch, l=$S$] (3,3)
        to[R, l=$R$, i>^=$i$] (6,3)
        to[C, l_=$C$, v^>=$v_C$] (6,0) -- (0,0);
\end{circuitikz}
\end{center}
```

- O circuito é um único caminho do TikZ: cada `to[componente]` coloca um componente entre dois
  pontos, e `--` liga os pontos com um fio.
- Rótulos: `l=` (nome do componente), `i=` (corrente, com seta no fio) e `v=` (tensão, com seta
  ao lado do componente). Os modificadores escolhem o lado e o sentido: `_` e `^` põem o rótulo
  abaixo ou acima do componente, `>` e `<` escolhem o sentido da seta.
- Outros componentes: `L` (indutor), `D` (diodo), `V` e `I` (fontes), `lamp`, `ammeter`,
  `voltmeter`, e portas lógicas (`and port`, `or port`). O manual do `circuitikz` tem a lista
  completa, com figuras.
- Os resistores saem em ziguezague (padrão americano); para o retângulo do padrão europeu,
  use `\usepackage[european]{circuitikz}`.

## Diagrama de corpo livre

```latex
Bloco no plano inclinado com atrito: forças e decomposição do peso.
\begin{center}
\begin{tikzpicture}[>=stealth, scale=1.2]
  \coordinate (O) at (0,0); \coordinate (X) at (6,0);
  \coordinate (T) at (6,{6*tan(30)});
  \draw[fill=gray!15] (O) -- (X) -- (T) -- cycle;
  \pic[draw, "$\theta$", angle eccentricity=1.4] {angle=X--O--T};
  % eixo x ao longo do plano: o bloco e as componentes giram 30 graus
  \begin{scope}[shift={(3.2,{3.2*tan(30)})}, rotate=30]
    \draw[fill=white] (-0.6,0) rectangle (0.6,0.8);
    \coordinate (G) at (0,0.4);
    \draw[->, thick] (G) -- ++(0,1.4) node[above] {$\vec{N}$};
    \draw[->, thick] (0.6,0.1) -- ++(1,0)
      node[above right] {$\vec{f}_{at}$};
    \draw[->, dashed] (G) -- ++(-0.8,0)
      node[above left] {$P \sen\theta$};
    \draw[->, dashed] (G) -- ++(0,-1.39)
      node[right] {$P \cos\theta$};
  \end{scope}
  \draw[->, thick] (G) -- ++(0,-1.6) node[below left] {$\vec{P}$};
\end{tikzpicture}
\end{center}
```

- O truque é o `scope` com `shift` e `rotate=30`: dentro dele, o eixo $x$ acompanha o plano
  inclinado, e o bloco, a normal, o atrito e as componentes do peso são desenhados com
  coordenadas simples, como se o plano fosse horizontal. Os rótulos não giram.
- O peso fica fora do `scope`, para apontar na vertical. A coordenada `G`, o centro do bloco,
  continua valendo fora dele.
- As componentes são proporcionais: com $P$ = 1,6, $P \sen 30° = 0{,}8$ e $P \cos 30° \approx
  1{,}39$. Se mudar o ângulo, recalcule os comprimentos.
- `\pic {angle=X--O--T}` (biblioteca `angles`) marca o ângulo com vértice em `O`; o rótulo entre
  aspas vem da biblioteca `quotes`.

## Notação física

```latex
\begin{gather*}
  \vec{F} = m\vec{a} = m \odv[order=2]{\vec{r}}{t}, \qquad
  \hat{\imath},\ \hat{\jmath},\ \hat{k} \\
  \oint_S \vec{E} \cdot \mathrm{d}\vec{A} = \frac{Q}{\varepsilon_0},
  \qquad
  \pdv{u}{t} = \alpha \pdv[order=2]{u}{x} \\
  i\hbar \pdv{}{t} \ket{\psi} = \hat{H} \ket{\psi}, \qquad
  \braket{\phi | \psi}, \qquad \bra{\phi} \hat{A} \ket{\psi}
\end{gather*}
Gravidade: $g = \qty{9,81}{\metre\per\second\squared}$.
Velocidade da luz: $c = \qty{2,998e8}{\metre\per\second}$.
```

- `\odv{x}{t}` é a derivada ordinária e `\pdv{u}{x}`, a parcial; `[order=2]` dá a segunda
  derivada. O pacote escreve o "d" em pé, como recomenda a ISO 80000-2; por isso a integral usa
  `\mathrm{d}\vec{A}`, para manter a mesma notação em todo o texto.
- `\hat{\imath}` e `\hat{\jmath}` usam o i e o j sem pingo, para o chapéu não ficar sobre o ponto.
- `\braket{\phi | \psi}` ajusta o tamanho e o espaçamento das barras e dos colchetes angulares.
- Grandezas sempre com `\qty`: o número e a unidade ficam juntos, com espaço fino, vírgula
  decimal e potência de dez (`2,998e8` vira $2{,}998 \times 10^8$). Veja também a
  [receita de química](01-quimica.md).
- Existe o pacote `physics`, que reúne muitos desses comandos, mas ele não é mantido há anos,
  redefine comandos do LaTeX (como `\Re` e `\Im`), produz espaçamentos irregulares e define um
  `\qty` próprio, que entra em conflito com o do `siunitx`. O `derivative` e o `braket` fazem o
  mesmo trabalho sem esses efeitos.
