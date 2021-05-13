# База данных кинотеатра

## Задание
Выберите тематику и спроектируйте базу данных для системы автоматизации деятельности.

На выходе у вас должны появиться:

* готовая структура БД (таблицы, взаимосвязи, представления)
* набор типовых данных для таблиц
* документация по проекту
	* описание таблиц и связей между ними
типовые операции: создание, правка, удаление объектов, заказ, покупка, выполнение, смена статусов и пр.

## Структура
![](https://gitlab.com/xitowzys-isu-laboratory-work/fourth-semester/databases/cinema-database/-/raw/master/raw/Structure.svg)

> <span style="color:red">База данных расчитана на один кинотеатр. Под сеть кинотеатров она не подойдет.</span>

## Описание таблиц


<section>
   <details>

   <summary>Films</summary>

| Название таблицы | Описание |
| ------ | ------ |
| films | Таблица фильмов |
| film\_formats | Форматы фильмов |
| film\_genres | Жанры фильмов |
| formats | Таблица форматов |
| genres | Таблица жанров |
| mpaa\_ratings | Система рейтингов Американской киноассоциации |
   </details>
   <details>

   <summary>Rooms</summary>

| Название таблицы | Описание |
| ------ | ------ |
| group\_of\_places | Группы мест в залах |
| halls | Таблица залов кинотеатра
| hall\_formats | Форматы залов |
| hall\_types | Категории залов |
| price\_group\_of\_seats | Таблица ценовые группы мест |
| places | Таблица сидений в зале распределенные по ценовым группам |
   </details>
   <details>

   <summary>Cinema</summary>

| Название таблицы | Описание |
| ------ | ------ |
| additional\_session\_price | Таблица повышение смоимости группы мест определенного сеанса |
| films\_period | Период показа фильмов на экранах кинотеатра |
| payment\_types | Таблица видов платежей |
| positions | Таблица должностей сотрудников|
| staff | Таблица сотрудников |
| staff\_statuses | Таблица статусов сотрудников |
| sessions | Таблица сеансов фильмов |
| tickets | Таблица распроданных билетов |
   </details>
   <details>

   <summary>Meal</summary>

| Название таблицы | Описание |
| ------ | ------ |
| deliveries | Таблица поставок продуктов |
| products | Таблица продаваемой продукции |
| purchases | Таблица покупок продукции |
| suppliers | Таблица поставщиков продукции |
   </details>
</section>

<style>

details[open] summary ~ * {
  animation: open 0.3s ease-in-out;
}

details summary::-webkit-details-marker {
  display: none;
}

details summary {
  width: 100%;
  padding: 0.5rem 0;
  border-top: 1px solid black;
  position: relative;
  cursor: pointer;
  font-size: 1.25rem;
  font-weight: 300;
  list-style: none;
}

details summary:after {
  content: "+";
  color: black;
  position: absolute;
  font-size: 1.75rem;
  line-height: 0;
  margin-top: 0.75rem;
  right: 0;
  font-weight: 200;
  transform-origin: center;
  transition: 200ms linear;
}

details[open] summary:after {
  content: "–";
}

</style>