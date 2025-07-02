FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho.
# Isso aproveita o cache de camadas do Docker. As dependências só serão reinstaladas se o requirements.txt mudar.
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos os arquivos do projeto para o diretório de trabalho
COPY . .

# Expõe a porta que a aplicação vai usar
EXPOSE 8000

# Comando para iniciar a aplicação quando o contêiner for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
