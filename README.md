## credit_project


#### Переменные окружения

Для запуска базы данных в корневой папке проекта должен находиться файл 
`.env` с переменными для БД (ниже пример содержимого файла):

```
DB_ENGINE=django.db.backends.postgresql
POSTGRES_DB=postgresql          # название БД
POSTGRES_USER=postgresql_user   # пользователь БД
POSTGRES_PASSWORD=postgresql    # пароль БД
DB_HOST=db
DB_PORT=5432

```

## Установка проекта
Для установки на локальной машине потребуется:
* Клонировать репозиторий
* Установить и настроить Docker

## Запуск приложения
Для запуска сборки проекта перейти в папку с проектом и выполнить
команду:

```
docker-compose up -d
```
или

```
docker-compose up -d --build 
```

После выполнения сборки запустить миграцию баз данных:

```
docker-compose run web python manage.py makemigrations

docker-compose run web python manage.py migrate
```

Для создания суперпользователя выполнить команду 

```
docker-compose run web python manage.py createsuperuser
```

Проект будет доступен по адресу http://127.0.0.1:8000/api/v1/

Эндпоинты:
    1. создание займа
            - POST /loans/
    2. получения карточки займа (по id)
            - GET /loans/{id}/