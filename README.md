Using LESS
Para facilitar nossa vida ao usar LESS em projetos

Autor - Henrique Deodato <h3nrk1e@gmail.com>

--------------------------------------
Objetivo
--------------------------------------
Compilar os arquivos .less em uma pasta determinada pastas, criando os arquivos .css

--------------------------------------
Dependências
--------------------------------------
É necessário que antes de executar o script você tenha
1 - node.js -> https://nodejs.org/
2 - instalar o less compiler -> http://lesscss.org/

--------------------------------------
Uso
--------------------------------------
Uma vez com tudo instalado, edite o arquivo csscompiler.vbs e mofique as variaveis lessFolder e cssFolder para indicar de onde e para onde os arquivos devem processados

Execute o csscompiler.bat para executar tudo na janela de comando.

Os arquvios serão gerados de forma compacta (minified)

--------------------------------------
Estrutura básica do projeto
--------------------------------------
  MAIN
  -- js
  -- css (arquvios serão gerados aqui)
  -- scripts
  ---- less (arquivos fontes estarão aqui)

--------------------------------------
Integração com Sublime Text
--------------------------------------
Para faciltiar durante o desenvolvimento, é possível linkar o .bat no Sublime Text, para isso

1 - Acesse Tools -> Build System -> New Build System

2 - um novo arquivo será exibido e o conteúdo será

{
  "cmd": ["make"]
}

3 - alterar onde estiver make e coloque o caminho para o arquivo, lembre de "escapar" as barras, por exemplo

{
  "cmd": ["C:\\Users\\SEU_USER\\SEU_PROJETO\\html\\scripts\\csscompiler.bat"]
}

4 - Salve o arquivo na pasta padrão (C:\Users\SEUS_USER\AppData\Roaming\Sublime Text 2\Packages\User)

5 - O nome que vc der ao arquivo ficará disponível no menu Acesse Tools -> Build System

6 - para executar pressione F7 ou vá pelo menu




