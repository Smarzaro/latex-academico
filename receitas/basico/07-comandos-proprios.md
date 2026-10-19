# 07 – Comandos próprios

**Problema.** Repetir a mesma formatação ou o mesmo nome muitas vezes no texto e querer mudar tudo
de uma vez depois.

**Solução.** Defina um comando com `\newcommand` no preâmbulo e use-o no texto. Se a formatação
mudar, basta alterar a definição.
Exemplo completo: [`comandos-proprios.tex`](../../exemplos/basico/comandos-proprios.tex).

```latex
% sem argumentos: um nome que se repete muito no texto
\newcommand{\sistema}{\textsf{GestaFácil}}
% com um argumento (#1): termos em outro idioma sempre em itálico
\newcommand{\estrangeiro}[1]{\textit{#1}}
% com um argumento opcional (padrão "pendente") e um obrigatório
\newcommand{\revisar}[2][pendente]{\textbf{[#1: #2]}}
```

```latex
O \sistema{} foi desenvolvido com o \estrangeiro{framework} Django. A versão móvel do
\sistema{} ainda está em teste \revisar{conferir a data}. A interface usa
\estrangeiro{layout} responsivo \revisar[ok]{testado em 3 navegadores}.
```

A sintaxe é `\newcommand{\nome}[número de argumentos][valor padrão do 1.º]{definição}`, com
`#1`, `#2`... no lugar dos argumentos. No resultado, `\revisar{conferir a data}` sai como
**[pendente: conferir a data]** e `\revisar[ok]{...}` troca "pendente" por "ok".

## Ajustes comuns

- **Semântica em vez de aparência:** `\estrangeiro{...}` diz *o que* o termo é; se a norma passar
  a pedir outra formatação para termos estrangeiros, muda-se só a definição.
- **Redefinir um comando existente:** `\renewcommand`. `\newcommand` dá erro se o nome já existe,
  o que protege contra sobrescrever um comando do LaTeX sem querer.
- **Comandos com várias opções:** o `\NewDocumentCommand` (do núcleo do LaTeX desde 2020) aceita
  argumentos opcionais em qualquer posição e outros tipos de argumento.

## Armadilhas

- **O espaço depois de um comando sem argumento é engolido:** `O \sistema foi` sai como "O
  GestaFácilfoi". Escreva `\sistema{}` (como no exemplo) ou `\sistema\ `.
- **Nomes só com letras:** `\meu-comando` e `\comando2` não funcionam como nome (o LaTeX lê
  `\meu` seguido de `-comando`).
- **Evite nomes já usados pela classe ou por pacotes** (a `abntex2`, por exemplo, define `\fonte`
  e `\nota`): o erro *Command \... already defined* avisa o conflito.
- **Não exagere:** comandos demais tornam o texto difícil de ler para outra pessoa (ou para você
  meses depois). Defina comandos para o que se repete ou para o que pode mudar.
