# 03 – Referencial teórico

O referencial teórico apresenta os conceitos e os resultados anteriores de que o trabalho depende.
Não é um resumo de livros: organize por **temas** (e não por autor), explique só o que o leitor
precisa para acompanhar o restante do texto e faça **síntese crítica** (compare, aponte
concordâncias, divergências e lacunas).

## Fontes e busca

- Prefira fontes primárias e revisadas por pares: periódicos, anais de eventos (SBC OpenLib, ACM
  Digital Library, IEEE Xplore), teses e dissertações (BDTD), livros-texto e normas. Use sites e
  blogs com critério.
- Registre a **busca**: bases consultadas, cadeias de busca, período e critérios de inclusão e
  exclusão. Isso dá transparência e permite repetir a pesquisa.
- Parafrasear exige citar a fonte; copiar trecho exige aspas ou recuo e citação. Texto de terceiros
  sem indicação é plágio.

## Como citar no LaTeX

- **Citação indireta** (paráfrase): `texto \cite{autor2020}` → (Autor, 2020).
- **No fluxo da frase:** `\textcite{autor2020}` → Autor (2020).
- **Citação direta curta** (até três linhas): entre aspas, com a página:
  `\enquote{texto} \cite[p.~12]{autor2020}`.
- **Citação direta longa** (mais de três linhas): ambiente `citacao` da `abntex2`, com recuo de 4 cm,
  fonte menor e sem aspas.
- **Citação de citação:** `\textapud{original}{consultado}`; só a obra consultada entra na lista.
- **Várias fontes** na mesma chamada: `\cite{a,b,c}`.

O resultado de cada forma está nas [receitas de citações](../referencias/09-citacoes-no-texto.md).

## Trabalhos relacionados

Compare os estudos com os **mesmos critérios**, de preferência em um quadro (colunas como
"Trabalho", "Contribuição" e "Limitação"; veja a [receita de quadros](../tabelas/06-quadro.md)), e
termine explicitando **o que o seu trabalho acrescenta**.
