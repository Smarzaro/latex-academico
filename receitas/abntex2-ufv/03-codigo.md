# 03 – Código-fonte como ilustração

**Problema.** Numerar uma listagem de código como "Código 1", com título, fonte e uma entrada na
"Lista de códigos", em vez de tratá-la como figura.

**Solução.** O float `codigo` da `abntex2-ufv`, com o ambiente `ilustracao` dentro dele e o
`lstlisting` (pacote `listings`) no corpo. Exemplo completo:
[`codigo-ufv.tex`](../../exemplos/abntex2-ufv/codigo-ufv.tex). O estilo das listagens vem de
[`estilo-codigo.tex`](../../exemplos/codigo/estilo-codigo.tex), incluído no preâmbulo com
`\input{../codigo/estilo-codigo}` (veja a
[receita 01 de código](../codigo/01-listings-configuracao.md)).

```latex
\begin{codigo}[htbp]
\begin{ilustracao}[\linewidth]{\caption{Função em Python}\label{lst:ufv}}%
                  {\elaboracaopropria}
\begin{lstlisting}[language=Python]
def media(valores):
    """Calcula a média aritmética de uma lista."""
    if not valores:
        return 0.0
    return sum(valores) / len(valores)
\end{lstlisting}
\end{ilustracao}
\end{codigo}
```

No texto, `\autoref{lst:ufv}` imprime "Código 1". A "Lista de códigos" sai com
`\listofcodigos`, junto das demais listas pré-textuais.

## Por que `[\linewidth]`

O `ilustracao` mede o conteúdo para dar ao título e ao rodapé a mesma largura. Em uma listagem
com moldura (e em outros conteúdos cuja largura medida é menor que a ocupada na página), essa
medida não corresponde ao que se vê. `[\linewidth]` fixa a largura mínima do bloco na largura do
texto: no resultado, a moldura ocupa a linha toda, o título fica centralizado sobre ela e a fonte
fica alinhada à esquerda da moldura.

## Na classe abntex2

A `abntex2` não tem o float `codigo`. As alternativas são usar o próprio `lstlisting` com
`caption` (numeração "Listing", que precisa ser traduzida) ou criar um float com
`\newfloat` do `memoir`. As [receitas de código-fonte](../codigo/) mostram a configuração do
`listings` que vale nas duas classes.

## Ajustes comuns e armadilhas

- `codigo` é o float (numera, posiciona e entra na lista); `ilustracao` só monta título, conteúdo
  e rodapé. Os dois são necessários.
- Os floats `quadro` e `grafico` funcionam da mesma forma, com `\listofquadros` e
  `\listofgraficos`.
- Uma listagem longa não quebra de página dentro de um float. Para códigos com mais de meia
  página, prefira um apêndice ou um trecho menor no texto.
- Rótulos com o prefixo `lst:` (o mesmo das listagens do `listings`) deixam claro, no
  texto-fonte, o tipo do objeto citado.
