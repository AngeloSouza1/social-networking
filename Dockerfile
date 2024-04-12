# Use a imagem oficial do Ruby como base
FROM ruby:latest

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo Gemfile e o Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instale as dependências do Rails
RUN bundle install

# Copie o restante do código-fonte para o contêiner
COPY . .

# Exponha a porta 3000 para que possamos acessar o aplicativo Rails
EXPOSE 3000

# Inicie o servidor Rails quando o contêiner for iniciado
CMD ["rails", "server", "-b", "0.0.0.0"]

