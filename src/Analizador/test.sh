#!/bin/bash

# Cria os diretórios de saída se não existirem
mkdir -p Test/Saidas

# Loop de 1 a 9 para processar os arquivos de entrada
for i in {1..9}; do
  input_file="Test/Entradas/Entrada${i}.txt"
  output_file="Test/Saidas/Saida${i}.txt"
  
  # Verifica se o arquivo de entrada existe
  if [ ! -f "$input_file" ]; then
    echo "Erro: Arquivo de entrada não encontrado: $input_file"
    exit 1
  fi

  # Compila o código Java
  javac Yylex.java

  # Executa o programa Java com o arquivo de entrada correspondente e redireciona a saída
  java Yylex "$input_file" > "$output_file"

  # Limpa os arquivos .class gerados durante a compilação
  rm *.class
done
