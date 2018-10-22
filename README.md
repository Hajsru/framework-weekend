# framework-weekend
Постановка задачи и исходные данные для фреймворк-посиделок 

## Идея

Есть идея взять какую-то задачу. Например, это будет приложение оценок спикеров haJS.  Описать общие интерфейсы, дизайн-макеты и правила разработки бэкенда и фронтенда и на данной задаче тестировать фреймворки. Формат - подготовка ко встерече и раз в две недели посиделка с кодингом, обсуждением и код-ревью.

## Постановка задачи
Реализовать систему рейтингов и комментариев для спикеров haJS. Комментарий может быть оставлен непосредственно о спикере, о докладе, о мероприятии. Рейтинг может быть поставлен тоже для любой из этих сущностей.

Приложение должно поддерживать регистрацию пользователя, верификацию электронного адреса, прохождение каптчи. 

Если оставлен отзыв в другой сессии, то он должден обновиться в текущей у активного пользователя.

Должно быть уведомление на электронный адрес о отзыве, прохождении модерации.

Должна быть реализована админка с премодерацией отзывов, CRUD для спикеров, докладов, мероприятий.

База данных - PostgreSQL.


## Фреймворки

Идеи, какие фреймворки или чисто языки программирования можно использовать для решения задачи. 

Если есть желание использовать какой-то фреймворк/язык, то PR только приветсвуются

### Бэкенд
Node.JS / Express.JS
Node.JS / Sails.JS

Python / Django
Python / Flask
Python / Eve
Python

PHP / Laravel
PHP

### Фронтенд
Angular 7
React.JS
Vue.JS

