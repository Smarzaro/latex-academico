# 02 – Espaços, parágrafos e comentários

**Problema.** Entender por que espaços e quebras de linha do arquivo não aparecem no PDF, como
criar parágrafos, deixar notas no código e controlar espaçamentos, recuo e entrelinhas.

**Solução.** O LaTeX trata o texto pela estrutura (palavras e parágrafos), não pela aparência do
arquivo. Espaços extras são ignorados, a linha em branco separa parágrafos, `%` comenta e os
espaçamentos explícitos são feitos por comandos.

## Espaços e parágrafos

Exemplo completo: [`espacos-comentarios.tex`](../../exemplos/basico/espacos-comentarios.tex).

```latex
Esses   espaços   em    branco  extras    serão ignorados.

Quebras de
linha são tratadas como
espaço.


Uma linha em branco (ou várias) cria um novo parágrafo.
```

O resultado tem três parágrafos, com um espaço normal entre as palavras.

## Comentários

```latex
Este é um parágrafo em \LaTeX. % daqui até o fim da linha é comentário
O parágrafo continua nesta linha.

% Um comentário
% espalhado por
% várias linhas.

Os comentários não aparecem no documento final.
```

- Para imprimir o símbolo de porcentagem, escreva `\%`.
- Um `%` no fim da linha também elimina o espaço que a quebra de linha produziria; é por isso que
  ele aparece no fim das linhas de definições de comandos e de argumentos longos.
- Os editores comentam e descomentam um bloco selecionado com um atalho (em geral `Ctrl+T` e
  `Ctrl+U` no TeXstudio, `Ctrl+/` no Overleaf e no VS Code).

## Espaçamentos, recuo e entrelinhas

Exemplo completo: [`espacamentos.tex`](../../exemplos/basico/espacamentos.tex).

```latex
\usepackage{setspace}             % \onehalfspacing, \doublespacing, ambiente spacing
\setlength{\parindent}{1.25cm}    % recuo da primeira linha dos parágrafos
```

```latex
Palavra\hspace{2cm}separada por 2\,cm. Esquerda\hfill direita.

\vspace{1cm}
Este parágrafo começa 1\,cm abaixo do anterior.

\noindent Este parágrafo não tem recuo na primeira linha.\\
Esta linha foi quebrada com \verb|\\|, sem começar um novo parágrafo.

\begin{onehalfspace}
Este parágrafo usa espaçamento de 1,5 entre as linhas, comum em trabalhos acadêmicos.
O comando \verb|\onehalfspacing| no preâmbulo aplica o mesmo espaçamento ao documento todo.
\end{onehalfspace}
```

| Comando | Efeito |
|---|---|
| `\hspace{2cm}` / `\vspace{1cm}` | Espaço horizontal / vertical de tamanho fixo |
| `\hfill` | Espaço horizontal elástico: empurra o que vem depois para a direita |
| `\,` | Espaço fino (entre número e unidade: `2\,cm`) |
| `\noindent` | Parágrafo sem recuo na primeira linha |
| `\\` | Quebra a linha sem começar um parágrafo |
| `\onehalfspacing`, `\doublespacing` | Entrelinhas 1,5 ou dupla no documento todo (no preâmbulo) |
| `onehalfspace`, `doublespace`, `spacing` | As mesmas entrelinhas só em um trecho |

## Armadilhas

- **Não separe parágrafos com `\\`** nem com `\vspace`: use a linha em branco. Para mudar a
  distância entre todos os parágrafos, ajuste `\parskip` no preâmbulo (ou use o pacote
  `parskip`), em vez de espaços manuais.
- **`\\` fora de lugar.** No começo de um parágrafo (logo depois de uma linha em branco), `\\`
  gera o erro *There's no line here to end*; no fim de um parágrafo, gera o aviso
  *Underfull \hbox*. Em ambos os casos, apague o `\\`.
- **`\vspace` no topo de uma página é descartado.** Para manter o espaço, use `\vspace*`.
- **O primeiro parágrafo depois de um título sem recuo.** É o padrão de várias classes; se a norma
  exige recuo em todos os parágrafos, carregue o pacote `indentfirst`.
- **Espaçamento em trabalhos acadêmicos.** As classes acadêmicas (como a `abntex2`) já configuram
  entrelinhas e recuo; consulte a documentação da classe antes de redefini-los.
