TrabalhoFormaisREGEX
====================




====================
Requerimentos:
====================
- O trabalho foi desenvolvido no Linux Ubuntu
- Para instalar o FLEX basta executar sudo apt-get install flex

====================
Para Executar:
====================

- Os arquivos de entrada de exemplo sao input.in, input2.in ate o arquivo input8.in 
- As informacoes extraidas destes arquivos estao contidas nos arquivos output, cada output tem seu input de numero correspondente

- Para compilar e executar basta executar o arquivo script.sh
- O script apos compilar e executar o extrator para cada entrada input e ira gerar um arquivo output.saida para cada um.
- O resultado da extracao estara no final desses arquivos de saida no seguinte formato:
	=================================
	Resultado:
	=================================
	Local: 
	Numero de mortos: 
	Numero de feridos: 
	Numero de bombas: 
- No inicio do arquivo de saida estara tudo que o flex nao conseguiu dar matching, pois toda entrada que nao possui regra o flex simplesmente imprime a entrada na saida.

=====================
=====================
- Caso deseje executar seus proprios arquivos de teste utilize os seguintes comandos:
- Caso queira recompilar o projeto:
	flex trab.l
	gcc lex.yy.c -lfl

- Para executar:
	./a.out < 'arquivo_entrada' > 'arquivo_saida'
