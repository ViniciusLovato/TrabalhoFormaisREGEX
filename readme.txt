TrabalhoFormaisREGEX
====================
Vinicius Alvarenga Lovato 7696455
Paulo Henrique de Oliveira Moreno 7704943
Ricardo Cardoso Cunha 7696330

====================
Requerimentos:
====================
- O trabalho foi desenvolvido no Linux Ubuntu
- Para instalar o FLEX basta executar sudo apt-get install flex

=======================
 Descricao dos arquivos
=======================
- Arquivos de input foram chamados de input[numero].in
- Arquivos gerados de saida foram chamados de output[numero].saida
- O arquivo de especificacao do extrator de informacoes foi chamado de trab.l
- O arquivo lex.yy.c foi gerado pelo flex (que teve como entrada o trab.l)
- O arquivo executal foi gerado como a.out


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
