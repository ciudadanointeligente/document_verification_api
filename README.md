# README
With docker and docker-compose installed,

Use command `docker-compose up --build` to orchestrate containers start.

And if seed data is present `curl -H "Content-Type: application/json" -X POST -d '{"email":"email@example.com","password":"12345678"}' localhost:3000/authenticate` to test.

To access rails console run `docker-compose run app bundle install && rails c`.
