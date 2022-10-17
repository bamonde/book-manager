# Book Manager Test Project

## Goal

Construir um aplicação com login e criação de contas funcional,
a aplicação deve gerenciar livros, então é imprescindível ter um crud completo para os livros,
e assim que logado a pagina que devo ser encaminhado é uma pagina de listagem de livros, está pagina deve ser escrita em haml e deve ter uma apresentação em carrosel dos livros

- - - -

## Instructions to access the platform

Follow the instructions above to have access the plataform.

### 1. Install
```
docker-compose build
docker-compose run --rm web bundle exec rails db:setup
```

### 2. Up development environment server
```
docker-compose up web
```

### 3. Access

Access on your browser **localhost:3000**

Use the credential below to access the platform

* Email: *tony.stark@avengers.com*
* Password: *123123123*

- - - -

## Running tests
```
docker-compose run --rm web sh -c 'RAILS_ENV=test bundle exec rails db:create db:migrate'
docker-compose run --rm web bundle exec rspec
```

- - - -

## Icons

Icons used into plataform extracted from Google Fonts as linked below.

https://fonts.google.com/icons

Font: Materials Symbols

- - - -

*Oct, 2022 - Herbertt Bamonde*
