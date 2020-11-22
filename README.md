# Mini curso de testes com Rspec.

👋 Olá, Seja Bem-vindo(a) ao mini curso de testes com Rspec.

# Aulas

Capítulos:  

- 1° Introdução ao mundo dos Testes
  - 1° Seja bem vindo(a) ao curso de testes  
  - 2° O que são testes automatizados  
  - 3° O que é o RSPEC  
  - 4° Criando seu primeiro teste  
  - 5° 'Desafio do herói' #1  

# Exercícios solucionados

- 1° Introdução ao mundo dos Testes
  - 5° 'Desafio do herói' #1( a pasta 'lib' foi nomeada como 'hero_challenge', pois era uma pasta reservada do framework)  
    - Rodar ['desafio do herói'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/hero_challenge/hero_spec.rb):  
    ```sh
    rspec ./spec/hero_challenge/hero_spec.rb
    ```

# Exigências

**:warning: Atenção:** É necessário que os desenvolvedores usem o Docker no seu ambiente de desenvolvimento.

- **🛠 Modo Desenvolvimento Docker**
    - :computer: [Linux Ubuntu LTS](https://ubuntu.com/download/desktop)
    - 🐳 [Docker](https://docs.docker.com/engine/installation/) Deve estar instalado.
    - 🐳 [Docker Compose](https://docs.docker.com/compose/) Deve estar instalado.
    - **💡 Dica:** [Documentação do Docker](https://docs.docker.com/)

# Instalando

## 🐳 Modo Desenvolvimento com Docker

Após instalar o docker e docker-compose, estando na pasta raiz do projeto, execute:

```sh
docker-compose up
```

Para se certificar que os seus containers subiram corretamente, todos os containers deve estar com o status `UP`, execute:

```sh
docker-compose ps -a
```

Para acessar o container da aplicação, execute:

```sh
docker-compose run --rm web bash
```

Para acessar a instância do banco de dados, execute:

```sh
docker exec -it [nome do db] bash
```

Para derrubar e subir a instância do docker novamente, execute:

```sh
docker-compose down && docker-compose up
```
# Popular o banco
Acesse o container da aplicação, execute:

```sh
docker-compose run --rm web bash
```
## Apagar banco existente, criar, rodar migrações e popular o banco

Dentro do container da aplicação, execute:

```sh
rails db:reset
```
## Criar, rodar migrações e popular o banco

Dentro do container da aplicação, execute:

```sh
rails db:setup
```
## Em um banco recém criado

Dentro do container da aplicação, execute:

```sh
rails db:seed
```

🚀 :clap: Para visualizar o sistema basta acessar no navegador no endereço: [localhost:3000](localhost:3000)

# Como executar a Suíte de Teste

### Testes Unitários com Rspec, em um novo terminal execute:
```sh
docker-compose run --rm web bash
```

```sh
RAILS_ENV=test rails db:create
```

```sh
RAILS_ENV=test rails db:migrate
```

```sh
rspec
```
