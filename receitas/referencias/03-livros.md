# 03 – Livros e partes de livros

Exemplos no [`catalogo.bib`](../../exemplos/referencias/catalogo.bib). Em cada caso: a entrada e o
resultado na lista de referências (os títulos saem em negrito no PDF).

## Livro com um autor

```bibtex
@book{ex-livro,
  author    = {Huberman, Leo},
  title     = {História da riqueza do homem},
  edition   = {21},
  location  = {Rio de Janeiro},
  publisher = {LTC},
  year      = {1986},
}
```

> HUBERMAN, L. **História da riqueza do homem**. 21. ed. Rio de Janeiro: LTC, 1986.

## Livro com três autores (todos são indicados)

```bibtex
@book{ex-livro-3,
  author    = {Passos, L. M. M. and Fonseca, A. and Chaves, M.},
  title     = {Alegria de saber},
  subtitle  = {matemática, segunda série, 2, primeiro grau: livro do professor},
  location  = {São Paulo},
  publisher = {Scipione},
  year      = {1995},
  pagetotal = {136},
}
```

> PASSOS, L. M. M.; FONSECA, A.; CHAVES, M. **Alegria de saber**: matemática, segunda série, 2,
> primeiro grau: livro do professor. São Paulo: Scipione, 1995. 136 p.

## Livro com quatro ou mais autores (primeiro autor e *et al.*)

```bibtex
@book{ex-livro-4,
  author    = {Gamma, Erich and Helm, Richard and Johnson, Ralph and Vlissides, John},
  title     = {Padrões de projeto},
  subtitle  = {soluções reutilizáveis de software orientado a objetos},
  location  = {Porto Alegre},
  publisher = {Bookman},
  year      = {2000},
}
```

> GAMMA, E. *et al.* **Padrões de projeto**: soluções reutilizáveis de software orientado a
> objetos. Porto Alegre: Bookman, 2000.

## Livro com organizador

```bibtex
@book{ex-livro-org,
  editor    = {Ferreira, Léslie Piccolotto},
  editortype = {organizer},
  title     = {O fonoaudiólogo e a escola},
  location  = {São Paulo},
  publisher = {Summus},
  year      = {1991},
}
```

> FERREIRA, L. P. (org.). **O fonoaudiólogo e a escola**. São Paulo: Summus, 1991.

## Livro com tradutor, número de páginas e ISBN (elementos complementares)

```bibtex
@book{ex-livro-trad,
  author     = {Huberman, Leo},
  title      = {História da riqueza do homem},
  translator = {Dutra, Waltensir},
  edition    = {21},
  location   = {Rio de Janeiro},
  publisher  = {LTC},
  year       = {1986},
  pagetotal  = {286},
  isbn       = {85-216-1306-7},
}
```

> HUBERMAN, L. **História da riqueza do homem**. Tradução: Waltensir Dutra. 21. ed. Rio de
> Janeiro: LTC, 1986. 286 p. ISBN 85-216-1306-7.

## Capítulo de livro do mesmo autor

```bibtex
@inbook{ex-capitulo,
  author     = {Santos, F. R.},
  bookauthor = {Santos, F. R.},
  title      = {A colonização da terra do Tucujús},
  booktitle  = {História do Amapá, 1º grau},
  edition    = {2},
  location   = {Macapá},
  publisher  = {Valcan},
  year       = {1994},
  pages      = {15--24},
}
```

> SANTOS, F. R. A colonização da terra do Tucujús. In: SANTOS, F. R. **História do Amapá, 1º
> grau**. 2. ed. Macapá: Valcan, 1994. p. 15-24.

## Capítulo de livro organizado por outros autores

```bibtex
@incollection{ex-capitulo-org,
  author     = {Lobo, A. M.},
  title      = {Moléculas da vida},
  booktitle  = {Química e sociedade},
  booksubtitle = {a presença da química na actividade humana},
  editor     = {Dias, A. R. and Ramos, J. J. M.},
  editortype = {editor},
  location   = {Lisboa},
  publisher  = {Escobar},
  year       = {1990},
  pages      = {49--62},
}
```

> LOBO, A. M. Moléculas da vida. In: DIAS, A. R.; RAMOS, J. J. M. (ed.). **Química e sociedade**: a
> presença da química na actividade humana. Lisboa: Escobar, 1990. p. 49-62.
