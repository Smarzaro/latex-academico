# Matemática

Fórmulas no texto e em destaque, equações numeradas e citadas, alinhamento de várias linhas,
matrizes, casos, operadores, teoremas e unidades de medida. Tudo com o `amsmath` e pacotes
afins; os exemplos compiláveis estão em [`exemplos/matematica/`](../../exemplos/matematica/).

| Receita | O que resolve |
|---|---|
| [04 – Elementos básicos](04-elementos-basicos.md) (comece por aqui) | `^`, `_`, chaves, `\frac`, `\sqrt`, `\sum`, `\int` e letras gregas |
| [01 – Fórmulas no texto, em destaque e numeradas](01-modos-e-equacoes.md) | `$...$`, `\[...\]`, `equation`, `\eqref`, `align`, `\notag` e `\tag` |
| [02 – Matrizes e delimitadores](02-matrizes.md) | `array` com `\left`/`\right` e os ambientes `pmatrix`, `bmatrix` e `vmatrix` |
| [03 – Casos, operadores, teoremas e unidades](03-recursos.md) | `cases` e `\text`, `\mathbb`, `\DeclareMathOperator`, `amsthm` e `siunitx` |

## Lista de conferência

- O `amsmath` está carregado (e o `amssymb`, se houver `\mathbb` ou outros símbolos)?
- Só as equações citadas no texto são numeradas, e são citadas com `\eqref`?
- As fórmulas em destaque usam `\[...\]` ou os ambientes do `amsmath`, nunca `$$...$$`?
- Funções como seno, log e lim estão em letra reta (`\sen`, `\log`, `\lim`), e não em itálico?
- Os números usam vírgula decimal e as unidades estão separadas do número (`\qty`)?
- As variáveis citadas no texto também estão em modo matemático (`$x$`, e não "x")?
