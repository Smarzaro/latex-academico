# 01 – Regras e campos

## Regras gerais da lista

- As referências ficam em **uma única lista**, em ordem alfabética, em espaço simples, alinhadas
  à margem esquerda e separadas por uma linha em branco. O estilo `abnt` do `biblatex` faz tudo
  isso automaticamente.
- Entram na lista **somente as obras citadas** no texto. (Obras apenas lidas, sem citação,
  formariam uma *bibliografia*, outro elemento.)
- O **destaque tipográfico do título** (aqui, negrito) deve ser o mesmo em todas as referências;
  ele não se aplica às obras sem autoria, cuja entrada é o título, já destacado pelas maiúsculas
  na primeira palavra.
- O autor é indicado pelo último sobrenome em maiúsculas, seguido do prenome (por extenso ou
  abreviado, **de forma uniforme**). Até três autores, todos; com quatro ou mais, indicam-se
  todos ou só o primeiro seguido de *et al.* (estas receitas usam *et al.*).
- Documentos *online* levam, ao final, **Disponível em:** (endereço) e **Acesso em:** (data de
  acesso).
- Quando um elemento não aparece na obra, mas pode ser identificado, vai entre colchetes:
  `[Cupertino]`. Se não puder ser identificado, o elemento é omitido: a NBR 6023:2018 deixou de
  exigir as expressões `[S. l.]` (*sine loco*, sem local) e `[s. n.]` (*sine nomine*, sem
  editora), obrigatórias nas versões anteriores. No `biblatex-abnt`, elas são uma opção: o estilo
  as imprime quando faltam o local ou a editora, e a opção `noslsn` (usada nestes exemplos) as
  omite. Não as escreva no arquivo `.bib`.

## Campos mais usados

Escreva os nomes como *Sobrenome, Prenome* e separe os autores com `and`. Para entidades (autor
institucional), use chaves duplas, que impedem a inversão do nome:
`author = {{Universidade Federal de Viçosa}}`. O campo `doi` recebe apenas o número do DOI, sem o
prefixo de endereço.

| Campo | Uso |
|---|---|
| `author`, `editor` | Autores (`Sobrenome, Prenome and ...`) e organizadores/editores |
| `title`, `subtitle` | Título e subtítulo; o subtítulo é impresso após dois-pontos |
| `edition` | Número da edição (`2` gera "2. ed."); texto livre vira o próprio texto |
| `location`, `publisher` | Local (cidade) e editora, sem natureza jurídica ("Editora Atlas" → "Atlas") |
| `year`, `date` | Ano ou data completa (`2003-11/2003-12` gera "nov./dez. 2003") |
| `pages`, `pagetotal` | Páginas inicial e final (`15--24`) e número total de páginas |
| `journaltitle`, `volume`, `number` | Periódico, volume e fascículo (artigos) |
| `doi`, `url`, `urldate` | DOI, endereço eletrônico e data de acesso (`AAAA-MM-DD`) |
| `type`, `institution`, `eventdate` | Trabalhos acadêmicos: tipo (grau e curso), instituição e data da defesa |
| `eventtitle`, `venue` | Eventos: nome do evento e cidade de realização |
| `shorttitle` | Título curto, usado na citação de obras sem autoria |

## Convenções do estilo `abnt`

O `biblatex-abnt` segue a NBR 6023, mas algumas formas só saem certas com estas convenções
(já adotadas nos exemplos):

- **Trabalhos acadêmicos:** use `@thesis` e informe a data da defesa em `eventdate`, que é
  impressa ao final ("… Universidade, Local, ano").
- **Documentos online com local e editora:** use `@book` (ou `@misc`) com `url` e `urldate`;
  `@online` não imprime local nem editora.
- **Obras sem autoria:** omita `author`; se o título começar por artigo ou monossílabo, preencha
  `shorttitle` ([receita 08](08-sem-autoria.md)).
- **Local ou editora desconhecidos:** omita o campo `location` ou `publisher`. Com a opção
  `noslsn`, nada é impresso no lugar; sem ela, o estilo imprime `[S. l.]` ou `[s. n.]`.
- **Autor institucional:** use chaves duplas, `author = {{Universidade Federal de Viçosa}}`. Com
  chaves simples, o `biblatex` trata "Viçosa" como sobrenome e imprime *VIÇOSA, U. F. de.* na
  lista e "(Viçosa, 1999)" na citação, o que está errado.
