# 04 – Elementos básicos: expoentes, índices, frações, somas e letras gregas

**Problema.** Escrever as primeiras fórmulas: potências, índices, frações, raízes, somatórios,
integrais e letras gregas.

**Solução.** Dentro do modo matemático, `^` sobe e `_` desce o próximo caractere; chaves agrupam
mais de um. Frações, raízes, somas e integrais são comandos (`\frac`, `\sqrt`, `\sum`, `\int`), e
cada letra grega é um comando com o seu nome. Exemplo completo:
[`elementos.tex`](../../exemplos/matematica/elementos.tex) (preâmbulo com
`\usepackage{amsmath}`). Leia esta receita antes da [01](01-modos-e-equacoes.md), que trata das
fórmulas em destaque e numeradas.

## Expoentes, índices, frações e somas

```latex
Expoente com \verb|^| e índice com \verb|_|: $x^2$, $x_i$ e $x_i^2$. Mais
de um caractere vai entre chaves: $e^{-x}$ e $a_{ij}$, mas $e^-x$ e
$a_ij$ mostram o que acontece sem elas.

Frações e raízes: $\frac{a}{b}$, $\frac{1}{1+x^2}$, $\sqrt{2}$ e
$\sqrt[3]{x}$. Em destaque, a fração fica em tamanho normal:
\[
  \bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i
  \qquad
  \int_{0}^{1} x^2 \, dx = \frac{1}{3}
\]
No somatório e na integral, \verb|_| e \verb|^| dão os limites; no
texto eles vão ao lado: $\sum_{i=1}^{n} x_i$.
```

| Escreva | Para obter |
|---|---|
| `x^2`, `x_i`, `x_i^2` | Expoente, índice e os dois juntos |
| `e^{-x}`, `a_{ij}` | Expoente e índice com mais de um caractere |
| `\frac{a}{b}` | Fração (numerador e denominador) |
| `\sqrt{x}`, `\sqrt[3]{x}` | Raiz quadrada e raiz de índice 3 |
| `\sum_{i=1}^{n}`, `\prod`, `\int_{a}^{b}` | Somatório, produtório e integral com limites |
| `\bar{x}`, `\hat{y}`, `\vec{v}` | Acentos matemáticos (média, estimativa, vetor) |

## Letras gregas

```latex
Letras gregas são comandos com o nome da letra: $\alpha$, $\beta$,
$\gamma$, $\delta$, $\varepsilon$, $\lambda$, $\mu$, $\pi$, $\sigma$ e
$\omega$. A inicial maiúscula dá a letra maiúscula, quando ela difere da
latina: $\Gamma$, $\Delta$, $\Sigma$ e $\Omega$. Assim, a média e o
desvio-padrão de uma população são $\mu$ e $\sigma$, e a variância é
$\sigma^2$.
```

Não há `\Alpha` nem `\Beta`: as maiúsculas iguais às latinas são escritas com a letra latina
(`A`, `B`). `\epsilon` e `\varepsilon`, `\phi` e `\varphi` são duas formas da mesma letra; use
sempre a mesma no trabalho.

## Armadilhas

- **Chaves esquecidas:** `e^-x` sobe só o sinal de menos, e `a_ij` desce só o `i`. O LaTeX não
  avisa: confira no PDF.
- **Dois expoentes seguidos:** `x^2^3` dá o erro *Double superscript*. Agrupe: `{x^2}^3` ou
  `x^{2^3}`, conforme o que se quer dizer.
- **Fora do modo matemático:** `^` e `_` digitados no texto comum dão o erro *Missing $
  inserted*. Para escrever o caractere no texto, use `\^{}` e `\_`.
- **Fração alta no meio da frase:** no texto o `\frac` fica pequeno para não afastar as linhas;
  se a fração tiver de ser lida com atenção, coloque-a em destaque (receita 01).
