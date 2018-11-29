# Описание схемы REST взаимодействия

## Общее
Данная схема описывает перву версию API.

Префикс для всех эндпойнтов:
 ```/api/v1```

## События
`GET /events` 
выводит список событий 

```json
{
  "links": {
      "self": "//example.com/api/v1/events",
      "next": "//example.com/api/v1/events?page[offset]=2",
      "last": "//example.com/api/v1/events?page[offset]=10"
  },
  "data":[
      {
        "eventId": 1,
        "name": "Наименование мероприятия",
        "description": "Описание мероприятия",
        "eventDate": 2018-09-23,
        "placeName": "Наименование места проведения",
        "placePicture": "//static.hajs.ru/picture_of_the_palce.jpg"
      }
    ]
}
```

`GET /events/{id}`
Выводит подрбную информацию о событии с идентификатором `{id}`
```json
{
  "links": {
      "self": "//example.com/api/v1/events/1",
      "list": "//example.com/api/v1/events/"
  },
  "data": {
        "eventId": 1,
        "name": "Наименование мероприятия",
        "description": "Описание мероприятия",
        "eventDate": 2018-09-23,
        "placeName": "Наименование места проведения",
        "placePicture": "//static.hajs.ru/picture_of_the_palce.jpg"
      }
}
```

`GET /events/{id}/comments`
Вывод списка комментариев для события с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/events/1",
      "self": "//example.com/api/v1/events/1/comments",
      "next": "//example.com/api/v1/events/comments?page[offset]=2",
      "last": "//example.com/api/v1/events/comments?page[offset]=10"
  },
  "data":[
      {
        "commentId": 1,
        "commentText": "Сумасшедший эвент!",
      }
    ]
}
```

`GET /events/{id}/rating`
Получить рейтинг для события с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/events/1",
      "self": "//example.com/api/v1/events/1/rating",
  "data": {
        "rating": 4,
      }
}
```

## Спикеры
`GET /speakers` 
выводит список спикеров 

```json
{
  "links": {
      "self": "//example.com/api/v1/speakers",
      "next": "//example.com/api/v1/speakers?page[offset]=2",
      "last": "//example.com/api/v1/speakers?page[offset]=10"
  },
  "data":[
      {
        "speakerId": 1,
        "name": "Чел Мордашкин",
        "photo": "//static.hajs.ru/nice_hooman_face.jpg",
        "description": "Хороший человек с приятной внешностью"
      }
    ]
}
```

`GET /speakers/{id}` 
Детальная информация о спикере с идентификатором {id}

```json
  {
  "links": {
      "self": "//example.com/api/v1/speakers/{id}"
  },
  "data": {
        "speakerId": 1,
        "name": "Чел Мордашкин",
        "photo": "//static.hajs.ru/nice_hooman_face.jpg",
        "description": "Хороший человек с приятной внешностью"
      }
}
```

`GET /speakers/{id}/comments`
Вывод списка комментариев для спикера с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/speakers/1",
      "self": "//example.com/api/v1/speakers/1/comments",
      "next": "//example.com/api/v1/speakers/comments?page[offset]=2",
      "last": "//example.com/api/v1/speakers/comments?page[offset]=10"
  },
  "data":[
      {
        "commentId": 1,
        "commentText": "Какой обаяшка!",
      }
    ]
}
```

`GET /speakers/{id}/rating`
Получить рейтинг для спикера с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/speakers/1",
      "self": "//example.com/api/v1/speakers/1/rating",
  "data": {
        "rating": 4,
      }
}
```

`GET /events/{id}/speakers`
Получить список спикеров для события с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/events/1",
      "self": "//example.com/api/v1/events/1/speakers",
  "data":[
      {
        "speakerId": 1,
        "name": "Чел Мордашкин",
        "photo": "//static.hajs.ru/nice_hooman_face.jpg",
        "description": "Хороший человек с приятной внешностью"
      }
    ]
}
```

### Доклады
`GET /presentations` 
выводит список докладов 

```json
{
  "links": {
      "self": "//example.com/api/v1/presentations",
      "next": "//example.com/api/v1/presentations?page[offset]=2",
      "last": "//example.com/api/v1/presentations?page[offset]=10"
  },
  "data":[
      {
        "presentationId": 1,
        "name": "Как написать документацию и не сойти с ума",
        "images": [
            "//static.hajs.ru/amazing_photo.jpg"
          ],
        "description": "Больше никакой темы не приходит на ум"
      }
    ]
}
```

`GET /presentations/{id}` 
Детальная информация о докладе с идентификатором {id}

```json
  {
  "links": {
      "self": "//example.com/api/v1/presentations/{id}"
  },
  "data": {
        "presentationId": 1,
        "name": "Как написать документацию и не сойти с ума",
        "images": [
            "//static.hajs.ru/amazing_photo.jpg"
          ],
        "description": "Больше никакой темы не приходит на ум"
      }
}
```

`GET /presentations/{id}/comments`
Вывод списка комментариев для доклада с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/presentations/1",
      "self": "//example.com/api/v1/presentations/1/comments",
      "next": "//example.com/api/v1/presentations/comments?page[offset]=2",
      "last": "//example.com/api/v1/presentations/comments?page[offset]=10"
  },
  "data":[
      {
        "commentId": 1,
        "commentText": "Вот это темищщще!",
      }
    ]
}
```

`GET /presentations/{id}/rating`
Получить рейтинг для доклада с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/presentations/1",
      "self": "//example.com/api/v1/presentations/1/rating",
  "data": {
        "rating": 4,
      }
}
```

`GET /presentations/{id}/speakers`
Получить список докладчиков для доклада с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/presentations/1",
      "self": "//example.com/api/v1/presentations/1/speakers",
  "data":[
      {
        "speakerId": 1,
        "name": "Чел Мордашкин",
        "photo": "//static.hajs.ru/nice_hooman_face.jpg",
        "description": "Хороший человек с приятной внешностью"
      }
    ]
}
```

`GET /events/{id}/presentations`
Получить список докладов для события с `{id}`
```json
{
  "links": {
      "parent": "//example.com/api/v1/events/1",
      "self": "//example.com/api/v1/events/1/speakers",
  "data":[
      {
        "presentationId": 1,
        "name": "Как написать документацию и не сойти с ума",
        "images": [
            "//static.hajs.ru/amazing_photo.jpg"
          ],
        "description": "Больше никакой темы не приходит на ум"
      }
    ]
}
```
