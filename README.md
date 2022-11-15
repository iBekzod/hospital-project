# Hospital project
API for booking hospital services

## Database schema
[Link to view](https://drawsql.app/teams/inha-university-in-tashkent/diagrams/hospital-app/embed)

![Alt text](src/extra%20materials/visual_db_schema.png?raw=true "DB schema")

## Requirements
- PHP 8.0.2
- MySQL server
- Nginx or Apache
- Postman (For request testing)

## You can either install docker or install this project to your own server
 - 1. Installing using docker
    ``` 
    $ docker-compose build 
    $ docker-compose up -d
    $ cd /src
    $ composer install
    $ php artisan migrate 
    ```
    - To register oAuth2.0 
    ``` 
        $ php artisan passport:install 
    ```
    
 - 2. Import sql to your mysql server [SQL](https://github.com/iBekzod/hospital-project/blob/main/src/extra%20materials/hospital%20mysql.sql)

 ## Run sample unit test
 ```
    $ cd /src
    $ ./vendor/bin/phpunit
 ```
 [For more details](https://laravel.com/docs/9.x/testing#running-tests)

 ## You can find ready made Postman collection and import
  [Hospital API.postman_collection](https://github.com/iBekzod/hospital-project/blob/main/src/extra%20materials/Hospital%20API.postman_collection.json)
  

