# Eta Calculator

Сервис для получения расчетного времени подьезда машины.

## как запустить?

`RAILS_ENV=production rake tests:prepare:quick`
`rails s`

## пример запроса  curl

`curl -X GET 'http://127.0.0.1:3000/v1/cars/eta.json?lat=55.793837&lon=49.124726'`

Ответ

`{"eta":1159.358325565}`