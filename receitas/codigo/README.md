# Código-fonte em documentos acadêmicos

Receitas para apresentar código-fonte com legibilidade, sintaxe colorida e (se preciso)
impressão em preto e branco. Os exemplos compiláveis estão em
[`exemplos/codigo/`](../../exemplos/codigo/).

| Receita | O que resolve |
|---|---|
| [01 – Configuração do `listings`](01-listings-configuracao.md) | Fonte legível, cores, numeração de linhas e estilo reutilizável |
| [02 – Uso básico](02-uso-basico.md) | `lstlisting`, `lstinputlisting` (parte de um arquivo) e `lstinline` |
| [03 – Opções mais usadas](03-opcoes.md) | Numeração, moldura, intervalos de linhas, quebra de linhas, estilos |
| [04 – Linguagens e acentos](04-linguagens-e-acentos.md) | Linguagens que o `listings` não conhece (JSON) e caracteres acentuados |
| [05 – Preto e branco e `minted`](05-preto-e-branco-e-minted.md) | Estilo sem cores e a alternativa `minted` |
| [06 – Dicas](06-dicas.md) | Onde colocar código longo, o que evitar e como citar |

## Qual pacote usar?

| | `listings` | `minted` |
|---|---|---|
| Instalação | Nenhuma além do LaTeX | Exige Python e o Pygments |
| Compilação | Padrão | Exige `-shell-escape` |
| Overleaf | Funciona | Funciona |
| Máquina local, CI e segurança | Simples | Mais complexo; `-shell-escape` executa programas externos |
| Coloração | Boa para as linguagens conhecidas; define-se o resto à mão | Mais fiel à de editores de código, para muitas linguagens |
| Quando escolher | Padrão para trabalhos acadêmicos | Quando a coloração do Pygments for essencial |

Estas receitas usam o `listings`; a [receita 05](05-preto-e-branco-e-minted.md) mostra o `minted`.
