# 04 – Linguagens e acentos

## Linguagens

O `listings` reconhece, entre outras, `Python`, `SQL`, `Java`, `C`, `C++`, `HTML`, `XML`, `PHP`,
`bash`, `Matlab` e `TeX`. A lista completa e os dialetos estão no manual do pacote
(`texdoc listings`).

Para uma linguagem que o pacote não conhece, como JSON, defina-a uma vez no preâmbulo com
`\lstdefinelanguage`, listando as palavras-chave, os comentários e as cadeias. Exemplo completo:
[`listings-json.tex`](../../exemplos/codigo/listings-json.tex).

```latex
\lstdefinelanguage{json}{
  morestring=[b]",
  morecomment=[l]{//},
  morekeywords={true, false, null},
  sensitive=true}
```

Use-a como qualquer outra: `\begin{lstlisting}[language=json]`.

## Acentos e caracteres especiais

Com o arquivo em UTF-8 e `pdflatex`, o `listings` não reconhece os caracteres acentuados por si
só: sem tratamento, o PDF mostra caracteres estranhos ou o LaTeX acusa `Invalid UTF-8 byte
sequence`. Resolva com `extendedchars=true` e a opção `literate`, que converte cada letra
acentuada na sua versão correta (é preciso listar as letras que aparecem no código, em
maiúsculas e minúsculas). A lista completa está em
[`estilo-codigo.tex`](../../exemplos/codigo/estilo-codigo.tex).

Se o código tiver símbolos como `<`, `>` ou `|` que saiam errados em algumas fontes, use fonte
`T1`: `\usepackage[T1]{fontenc}`.

> Com `lualatex` ou `xelatex`, o tratamento de acentos é outro (UTF-8 nativo); o `literate`
> acima é para o `pdflatex`.
