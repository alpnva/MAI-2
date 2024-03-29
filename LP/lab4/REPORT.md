#№ Отчет по лабораторной работе №4
## по курсу "Логическое программирование"

## Обработка естественного языка

### студент: Алапанова Э.Х.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|   18.12      |        5      |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*


## Введение

Основные подходы к обработке естественных и искусственных языков:

* Символьный
* Статистический
* Коннективистский
* Гибридный
В данный момент нам более интересен символьный подход. Символьный подход базируется на словарях и правилах, предварительно разработанных людьми. Зачастую представителями символьного подхода являются системы, в основе которых лежат логика и правила. Символьная структура в таких системах представлена в форме логических высказываний. Все преобразования(если они производятся) осуществляются по правилам вывода. Такие системы обычно состоят из набора правил, механизма вывода и рабочей среды. Знания представляются как множество фактов и правил в базе знаний.
Язык логического программирования пролог идеально подходит для обработки естественного языка , если мы знаем структуру предложений . Так как с помощью этого мы можем написать алгоритм парсинга предложений . Задача грамматического разбора и анализа естественных и искусственных языков является одной из самых распространенных задач, решаемых языками логического программирования. Это связано с простотой и естественностью реализации процесса переборов с возвратами, а также с удобством манипулирования символьной информацией. На прологе , думаю , можно легко написать генератор каких-то документов или написать текстовый редактор.

## Задание

Реализовать грамматический разбор фраз на ограниченном естественном языке и преобразовать данные фразы в язык исчисления предикатов первого порядка типа:
``` prolog
?-test([every, man, that, lives, loves, a, woman],Res).
Res=all(X,man(X)&lives(X)=>exists(Y,woman(Y)&loves(X,Y)))
```
## Принцип решения

Грамматика языка - это набор правил, определяющих, какие последовательности слов приемлемы в качестве предложений этого языка. Он определяет, как слова должны группироваться в фразы и какие "порядки" использования этих фраз разрешены. Учитывая грамматику языка, мы можем посмотреть на любую последовательность слов и увидеть, соответствует ли она критериям "приемлемого" предложения.

Если последовательность слов действительно верно составлена, то процесс проверки установит, что в нем есть какие-либо группы слов, установит их взаимосвязь.

Пример "контексто-свободной" грамматики:
sentence --> noun_phrase, verb_phrase.
noun_phrase --> determiner, noun.
verb_phrase --> verb, noun_phrase.
verb_phrase --> verb.
determiner --> [the].
noun --> [apple].
noun --> [man].
verb --> [eats].
verb --> [sings].

Определим инфиксные операторы:
``` Prolog
:- op(900, xfx, =>).
:- op(800, xfy, &).
:- op(300, xfx, :).
```
Разобъем предложение:
``` Prolog
sentence(P) --> noun_phrase(X, P1, P), verb_phrase(X, P1).
``` 
Определим noun_phrase, verb_phrase:
``` Prolog
noun_phrase(X, P1, P) -->
        determiner(X, P2, P1, P), noun(X, P3), rel_clause(X, P3, P2).
noun_phrase(X, P, P) --> name(X).

verb_phrase(X, P) --> trans_verb(X, Y, P1), noun_phrase(Y, P1, P).
verb_phrase(X, P) --> intrans_verb(X, P).
``` 
Условия "отношения":
``` Prolog
rel_clause(X, P1, P1&P2) --> [that], verb_phrase(X, P2).
rel_clause(_, P, P) --> [].
``` 
Определитель "that", "a":
``` Prolog
determiner(X, P1, P2, all(X):(P1=>P2)) --> [every].
determiner(X, P1, P2, exists(X):(P1&P2)) --> [a].
``` 
Наконец определим, чем может являться существительное, имя:
``` Prolog
noun(X, man(X)) --> [man].
noun(X, woman(X)) --> [woman].
name(john) --> [john].
``` 
Перевод в глаголы:
``` Prolog
trans_verb(X, Y, loves(X,Y)) --> [loves].
intrans_verb(X, lives(X)) --> [lives].
``` 
## Результаты

``` prolog
?- phrase(sentence(P), [every,man,that,lives,loves,a,woman]).
P = all(X):(man(X)&lives(X)=>exists(Y):(woman(Y)&loves(X, Y))).

?- phrase(sentence(P), [john,loves,a,woman]).
P = exists(X):(woman(X)&loves(john, X)).
```
## Выводы

Данная лабораторная заставила меня взглянуть на структуру слов в предложениях. Почти никогда не 
задумывалась о том, какие слова стоят друг за другом, тем более в предикатах. 
Благодаря данной лабораторной работе я познакомилась с основными принципами обработки естественных языков, реализовалф грамматический разбор предложения фраз на английском языке, преобразовал их в язык исчисления предикатов первого типа.
Хотя сам по себе процесс обработки языка довольно широкий и наполненный, в нем присутствует множество нюансов и особенных условий, которые бывает очень сложно реализовать с помощью программного кода; но стоит отметить, что даже с этой задачей Prolog справляется очень хорошо (процесс написания программ для обработки текста занимает не так много сил и времени, если говорить о базовой обработке). Это обусловлено тем, что в используемом мной диалекте языка Пролог встроены удобные средства для работы с DCG-грамматиками. С помощью них предложение представляется как упорядоченный набор частей, с помощью которых довольно лаконично можно описать структуру предложений, а большего для выполнения задачи и не требовалось.







