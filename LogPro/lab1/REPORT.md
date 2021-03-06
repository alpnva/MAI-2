# Отчет по лабораторной работе №1
## Работа со списками и реляционным представлением данных
## по курсу "Логическое программирование"

### студент: Иванопуло А.Б.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|              |               |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*


## Введение

Опишите своими словами, чем списки в языке Пролог отличаются от принятых в императивных языках подходов к хранению данных. На какие структуры
данных в традиционных языках похожи списки в Прологе?

## Задание 1.1: Предикат обработки списка

`mypred(X,Y)` - что делает предикат

Примеры использования:
```prolog
?- mypred([1,2,3],X).
X=4.
?- mypred(X,[4]).
X=[1,2,3].
```

Реализация:
```prolog
mypred([],[]).
...
```

Опишите своими словами принцип работы предиката обработки списка.

## Задание 1.2: Предикат обработки числового списка

*Опишите предикат по образцу выше*

## Задание 2: Реляционное представление данных

Опишите, в чем преимущества и недостатки реляционного представления в целом, и конкретного представления, которое вы использовали.

Опишите принцип реализации всех предикатов, осуществляющих запросы к данным.

## Выводы

Сформулируйте *содержательные* выводы по лабораторной работе. Чему она вас научила? Над чем заставила задуматься? Помните, что несодержательные выводы -
самая частая причина снижения оценки за лабораторную.


