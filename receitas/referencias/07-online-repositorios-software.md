# 07 – Documentos online, repositórios e software

## Página *web*

Use `[S. l.]` se o local não é identificado.

```bibtex
@misc{ex-site,
  author       = {{Python Software Foundation}},
  title        = {Python 3 documentation},
  location     = {[S. l.]},
  year         = {2025},
  url          = {https://docs.python.org/3/},
  urldate      = {2025-01-28},
}
```

> PYTHON SOFTWARE FOUNDATION. **Python 3 documentation**. [S. l.], 2025. Disponível em:
> https://docs.python.org/3/. Acesso em: 28 jan. 2025.

## Repositório de código

```bibtex
@misc{ex-repositorio,
  author       = {Torvalds, Linus},
  title        = {Linux kernel source tree},
  howpublished = {Repositório GitHub},
  year         = {2025},
  url          = {https://github.com/torvalds/linux},
  urldate      = {2025-01-28},
}
```

> TORVALDS, L. **Linux kernel source tree**. 2025. Repositório GitHub. Disponível em:
> https://github.com/torvalds/linux. Acesso em: 28 jan. 2025.

## Programa de computador

A versão fica no campo `edition`; o local pode vir entre colchetes, quando identificado.

```bibtex
@book{ex-software,
  author       = {{Apple}},
  title        = {OS X El Capitan},
  edition      = {Versão 10.11.6},
  location     = {[Cupertino]},
  publisher    = {Apple},
  year         = {2017},
}
```

> APPLE. **OS X El Capitan**. Versão 10.11.6. [Cupertino]: Apple, 2017.

> **Documento *online* com local e editora:** use `@book` (ou `@misc`) com `url` e `urldate`;
> o tipo `@online` não imprime local nem editora ([receita 01](01-regras-e-campos.md)).
