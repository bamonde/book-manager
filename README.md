# Book Manager Test Project

## Goal

Construir um aplicação com login e criação de contas funcional,
a aplicação deve gerenciar livros, então é imprescindível ter um crud completo para os livros,
e assim que logado a pagina que devo ser encaminhado é uma pagina de listagem de livros, está pagina deve ser escrita em haml e deve ter uma apresentação em carrosel dos livros

## Install
```
docker-compose build
docker-compose run --rm web bundle exec rails db:setup
```

## Development environment
```
docker-compose up web
```

## Test environment
```
docker-compose run --rm web bundle exec rspec
```

## Icons

Icons used into plataform extracted from Google Fonts as linked below.

https://fonts.google.com/icons

Font: Materials Symbols

*Oct, 2022 - Herbertt Bamonde*
