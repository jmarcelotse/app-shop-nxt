#!/bin/bash

# Define o arquivo principal do Flask
export FLASK_APP=index.py

# Função para verificar a disponibilidade do banco de dados
function wait_for_db() {
  echo "Aguardando a conexão com o banco de dados..."
  while ! nc -z db 5432; do
    sleep 1
  done
  echo "Banco de dados conectado com sucesso!"
}

# Chama a função de verificação de conexão com o banco
wait_for_db

# Realiza as migrações do banco de dados
python -m flask db upgrade

# Inicia o aplicativo com o gunicorn
exec gunicorn --bind 0.0.0.0:5000 index:app
