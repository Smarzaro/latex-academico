# 06 – Normas, legislação e documentos institucionais

## Norma técnica

```bibtex
@book{ex-norma,
  author       = {{Associação Brasileira de Normas Técnicas}},
  title        = {ABNT NBR 14724},
  subtitle     = {informação e documentação: trabalhos acadêmicos: apresentação},
  location     = {Rio de Janeiro},
  publisher    = {ABNT},
  year         = {2024},
}
```

> ASSOCIAÇÃO BRASILEIRA DE NORMAS TÉCNICAS. **ABNT NBR 14724**: informação e documentação:
> trabalhos acadêmicos: apresentação. Rio de Janeiro: ABNT, 2024.

## Legislação disponível *online*

O autor é a jurisdição (Brasil, estado ou município); o nome e a data da lei ficam fora do negrito
(`\textmd{...}`) e só a ementa é destacada.

```bibtex
@misc{ex-legislacao,
  author       = {Brasil},
  title        = {\textmd{Lei nº 13.709, de 14 de agosto de 2018.} Lei Geral de Proteção de Dados Pessoais (LGPD)},
  location     = {Brasília, DF},
  publisher    = {Presidência da República},
  year         = {2018},
  url          = {https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm},
  urldate      = {2025-01-28},
}
```

> BRASIL. Lei nº 13.709, de 14 de agosto de 2018. **Lei Geral de Proteção de Dados Pessoais
> (LGPD)**. Brasília, DF: Presidência da República, 2018. Disponível em:
> https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm. Acesso em: 28 jan. 2025.

Estas receitas cobrem a legislação. A jurisprudência (acórdãos, súmulas) e os atos
administrativos normativos (portarias, resoluções) têm elementos próprios, como tribunal, número
do processo e relator, que o estilo `abnt` não cobre por completo; para eles, siga a norma e o
manual da sua instituição. Pode ser necessário usar `@misc` e montar parte do texto nos campos
`title` e `note`; confira sempre o resultado impresso contra os exemplos oficiais.

## Autor institucional (a entidade é o autor)

```bibtex
@book{ex-entidade,
  author    = {{Universidade Federal de Viçosa}},
  title     = {Estatuto da Universidade Federal de Viçosa, 1999},
  location  = {Viçosa, MG},
  publisher = {UFV},
  year      = {1999},
  pagetotal = {27},
}
```

> UNIVERSIDADE FEDERAL DE VIÇOSA. **Estatuto da Universidade Federal de Viçosa, 1999**. Viçosa,
> MG: UFV, 1999. 27 p.

## Relatório de organização (meio eletrônico, com data completa)

```bibtex
@book{ex-relatorio,
  author       = {{World Health Organization}},
  title        = {New WHO recommendations to accelerate progress on TB},
  location     = {Geneva},
  publisher    = {World Health Organization},
  date         = {2019-03-20},
  url          = {http://www.who.int},
  urldate      = {2019-03-21},
}
```

> WORLD HEALTH ORGANIZATION. **New WHO recommendations to accelerate progress on TB**. Geneva:
> World Health Organization, 20 mar. 2019. Disponível em: http://www.who.int. Acesso em: 21 mar. 2019.
