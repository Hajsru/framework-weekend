# Описание схемы REST взаимодействия

## События
`GET /events` 
выводит список событий 
```json
[
  {
    "event_id": 1,
    "name": "Наименование мероприятия",
    "description": "Описание мероприятия",
    "eventDate": 2018-09-23,
    "placeName": "Наименование места проведения",
    "placePicture": "http://static.hajs.ru/picture_of_the_palce.jpg"
  }
]
```
