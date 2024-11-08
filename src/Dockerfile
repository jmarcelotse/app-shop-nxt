# Usando a imagem base do Python
FROM python:3.11.0

# Instala o Netcat para verificações de conectividade
RUN apt-get update && apt-get install -y netcat && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho
WORKDIR /app

# Expõe a porta para o aplicativo
EXPOSE 5000

# Copia o arquivo de dependências primeiro e instala as dependências
COPY requirements.txt /app/requirements.txt
RUN python -m pip install --no-cache-dir -r /app/requirements.txt

# Define variáveis de ambiente e diretórios
ENV PROMETHEUS_MULTIPROC_DIR=/tmp/metrics
RUN mkdir -p /tmp/metrics

# Copia o restante dos arquivos do projeto
COPY . /app

# Dá permissão ao entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Define o entrypoint para o aplicativo
ENTRYPOINT ["/app/entrypoint.sh"]
