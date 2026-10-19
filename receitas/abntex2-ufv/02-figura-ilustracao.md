# 02 – Figura com o ambiente `ilustracao`

**Problema.** Uma figura com título, fonte, legenda e nota, em que o título e o rodapé acompanham
a largura da imagem (e não a da página).

**Solução.** Na `abntex2-ufv`, o ambiente `ilustracao` dentro do float `figure`: o primeiro
argumento é o título, o segundo é o rodapé, e o conteúdo vai no corpo do ambiente. Compare com a
mesma figura feita só com a `abntex2`:
[`figura-ufv.tex`](../../exemplos/abntex2-ufv/figura-ufv.tex) e
[`figura-abntex2.tex`](../../exemplos/abntex2-ufv/figura-abntex2.tex). A imagem `example-image-a`
vem do pacote `mwe`.

## Classe abntex2-ufv: ambiente `ilustracao`

```latex
\begin{figure}[htbp]
\begin{ilustracao}{\caption{Imagem de exemplo com fonte, legenda e nota}\label{fig:ufv}}%
                  {\elaboracaopropria
                   \legenda{A letra A ocupa o centro da imagem.}%
                   \nota{O título e o rodapé têm a largura da imagem.}}
  \includegraphics[width=.5\linewidth]{example-image-a}
\end{ilustracao}
\end{figure}
```

## Classe abntex2: `\caption`, `\fonte` e `\nota` soltos

```latex
\begin{figure}[htbp]
  \centering
  \caption{Imagem de exemplo com fonte e nota}\label{fig:abntex2}
  \includegraphics[width=.5\linewidth]{example-image-a}
  \fonte{Elaborado pelo próprio autor.}
  \nota{A fonte e a nota ficam centralizadas e separadas por espaços.}
\end{figure}
```

## O que muda no resultado

- Com `ilustracao`, o título fica centralizado sobre a imagem e quebra linha na largura dela; o
  rodapé (fonte, legenda e nota) fica alinhado à esquerda da imagem, em linhas seguidas, em espaço
  simples e letra menor.
- Com a `abntex2`, o título só quebra linha na largura do texto (fica mais largo que a imagem), e
  a fonte e a nota ficam centralizadas sob a imagem, separadas por um espaço.
- `\legenda` (que explica símbolos, cores ou partes da ilustração) só existe na `abntex2-ufv`. A
  ordem do rodapé é fonte, legenda e nota.

## Ajustes comuns e armadilhas

- O mesmo ambiente serve para quadros, gráficos e códigos: troque o float `figure` por `quadro`,
  `grafico` ou `codigo` (cada um com numeração e lista próprias). Para o código, veja a
  [receita 03](03-codigo.md).
- Os dois argumentos vêm **antes** do conteúdo, mesmo que o rodapé seja impresso depois dele.
  Termine com `%` as linhas que acabam em `}` dentro dos argumentos, como no exemplo, para não
  acrescentar espaços.
- Não é preciso `\centering`: o ambiente já centraliza o bloco (título, conteúdo e rodapé).
- Uma imagem estreita deixa o título em várias linhas. Para dar ao título e ao rodapé uma largura
  mínima, use o argumento opcional: `\begin{ilustracao}[.7\linewidth]{...}{...}`.

## Lista de conferência

- [ ] `figure` por fora, `ilustracao` por dentro.
- [ ] `\label` depois do `\caption`, no primeiro argumento.
- [ ] Fonte sempre presente; legenda só quando a imagem tem símbolos ou cores a explicar.

Para as figuras em geral (inserir imagem, subfiguras, TikZ), veja as receitas de
[figuras e gráficos](../figuras/).
