# 10 – Dicas do arquivo `.bib`

- **Chaves.** Use chaves curtas e padronizadas (`silva2024`, sem acentos nem espaços). Cada chave
  é única.
- **Codificação.** O arquivo deve estar em UTF-8; acentos são digitados normalmente.
- **Maiúsculas.** O estilo decide a caixa dos títulos; para preservar uma sigla ou nome próprio,
  use chaves: `title = {Uso de {Python} em {SGBD}}`.
- **Gerenciadores.** Zotero e JabRef exportam `.bib`; confira os campos exportados com estas
  receitas, pois nem sempre seguem as convenções do estilo `abnt`.
- **Compilação.** Após incluir ou alterar citações, rode `pdflatex`, `biber`, `pdflatex`,
  `pdflatex` (ou simplesmente `latexmk -pdf`). "Citation … undefined" ou "(?)" indica que o
  `biber` ainda não foi executado ou que a chave está errada.
- **Biber, não BibTeX.** O `biblatex` com `backend=biber` exige o `biber`. Em editores como o
  TeXstudio, escolha `biber` como ferramenta de bibliografia (ou use o comentário
  `% !BIB program = biber` no topo do arquivo).
- **Entradas separadas por projeto.** Mantenha um `.bib` por trabalho, ou um `.bib` geral e use
  `\addbibresource` para os dois.
