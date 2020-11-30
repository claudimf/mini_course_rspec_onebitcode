# Mini curso de testes com Rspec.

👋 Olá, Seja Bem-vindo(a) ao [mini curso de testes com Rspec.](https://onebitcode.com/course/minicurso-de-testes/)

# Aulas

Capítulos:  

- 1° Introdução ao mundo dos Testes
  - 1° Seja bem vindo(a) ao curso de testes  
  - 2° O que são testes automatizados  
  - 3° O que é o RSPEC  
  - 4° Criando seu primeiro teste  
  - 5° 'Desafio do herói' #1  
- 2° Dominando o básico
  - 6° Principais elementos do Rspec
  - 7° O que são os matchers
- 3° Rspec e Ruby On Rails
  - 8° Instalando o Rspec no Rails
  - 9° Usando Generators
- 4° Testando Models
  - 10° Porque e quando testar models
  - 11° Preparando nosso projeto para o teste
  - 12° Testando o Model
  - 13° Melhorando nosso teste com a Gem FFAKER
  - 14° Melhorando nosso teste com a Gem Factory Bot
  - 15° Desafio do herói #2
- 5° Testes de Request
  - 16° O que são testes de request
  - 17° Preparando nosso projeto para o teste
  - 18° Testando nosso Controller
  - 19° Desafio do herói #3
- 6° Testando uma API
  - 20° Porque e quando testar APIs
  - 21° Preparando nosso projeto para o teste
  - 22° Testando o update enemies da API
  - 23° Testando o destroy enemies da API
  - 24° Melhorando nosso teste com um Helper Rspec
  - 25° Melhorando nosso teste com before e let
  - 26° Desafio do herói #4
- 7° Conclusão
  - 27° Vitória
- 8° Extras (links importantes)
  - 28° Links importantes
  - 29° Leituras recomendadas

# Exercícios solucionados

- 1° Introdução ao mundo dos Testes
  - 5° 'Desafio do herói' #1( a pasta 'lib' foi nomeada como 'hero_challenge', pois era uma pasta reservada do framework)  
    - Rodar ['desafio do herói'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/hero_challenge/hero_spec.rb):  
    ```sh
    rspec ./spec/hero_challenge/hero_spec.rb
    ```
- 4° ['Testando Models'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/models/user_spec.rb):
  ```sh
  rspec spec/models/user_spec.rb
  ```
  - 15° ['Desafio do herói #2'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/models/weapon_spec.rb)
  ```sh
  rspec spec/models/weapon_spec.rb
  ```
- 5° ['Testes de Request'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/requests/users_spec.rb):
  ```sh
  rspec spec/requests/users_spec.rb
  ```
  - 19° ['Desafio do herói #3'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/requests/weapons_spec.rb)
  ```sh
  rspec spec/requests/weapons_spec.rb
  ```
- 6° ['Testando uma API'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/requests/enemies_spec.rb):
  ```sh
  rspec spec/requests/enemies_spec.rb
  ```
  - 19° ['Desafio do herói #4'](https://github.com/claudimf/mini_course_rspec_onebitcode/blob/main/spec/requests/enemies_spec.rb)
  ```sh
  rspec spec/requests/enemies_spec.rb
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
# Criar o banco
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
