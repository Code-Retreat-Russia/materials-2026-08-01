#import "@preview/diatypst:0.9.1": *
#import "@preview/cades:0.3.1": qr-code
#import "lib/components.typ": *
#show: terms-highlight.with()

#show: slides.with(
  title: "Code Retreat",
  subtitle: "TDD & Pair-Programming & AI",
  date: "2026-08-01",
  authors: "Telegram: @technicalexcellenceru, @ozon_tech",

  toc: false,
  count: "number",
  layout: "medium",
  ratio: 4 / 3,

  title-color: rgb("#005bff"),
)

= О нас

== План

#plan()

== Философия

Бесплатный однодневный интенсив, для освоения искусства разработки программного
обеспечения и дизайна кода.

Разработчики практикуют написание кода, вдали от давления по срокам и прочего
достигаторства. Формат код-ретритов зарекомендовал себя по всему миру как
эффективное средство для обучения и прокачки навыков.

#place(
  center + bottom,
  [
    #figure(
      caption: [
        #link("https://www.coderetreat.org/")[Глобальная активность]
      ],
      numbering: none,
      grid(
        columns: 2,
        rows: 1,
        gutter: 2cm,
        image("img/code-retreat-logo.svg", width: 3cm), qr-code("https://www.coderetreat.org/", width: 3cm),
      ),
    )
  ],
)

== Цели

#goals()

== Сделаем Retreat лучше вместе!

*Мы вместе с вами* стараемся, чтобы  было весело и интересно.

Вы видите как сделать лучше -- делайте!
#footnote[
  На раздаточных материалах и в конце презентации будет #link("https://forms.gle/mnVXKhpCPpZ3FCcq9")[форма обратной] связи. Ваши отзывы важны для нас и для площадки, чтобы делать следующие встречи лучше.
]
#footnote[В рамках правил Code Retreat]

== Мы

#let team-member(image-path, name, desc) = {
  figure(
    gap: 0.1em,
    caption: [
      #set text(size: 5pt)
      #set terms(tight: true, hanging-indent: 1mm)
      / #name: #desc
    ],
    numbering: none,
    box(
      image(image-path, width: 1.5cm, height: 1.5cm),
      radius: 50%,
      clip: true,
    ),
  )
}

#grid(
  columns: 5,
  gutter: 15pt,
  team-member(
    "img/sergey_lobin.jpg",
    [Сергей Лобин],
    [ Тренер по Скраму и инженерке, #link("https://scrum.ru/")[scrum.ru]],
  ),
  team-member("img/svetlana_krivenko.jpg", [Светлана Кривенко], [ Тренер по инженерным практикам]),
  team-member("img/andrey_marschantsev.jpg", [Андрей Маршанцев], [ Тех. лид, МТС-Банк]),
  team-member("img/artem_krotov.jpg", [Артем Кротов], [ Developer & Scrum-Master]),
  team-member("img/zlata_zanina.jpg", [Злата Занина], [ Engineering Manager]),

  team-member("img/anna_korotkova.jpg", [Короткова Анна], [ Java/Kotlin Developer]),
  team-member("img/julia_fatkullina.jpg", [Юлия Фаткуллина], [ Senior .NET/Kotlin Developer]),
  team-member("img/ilya_ilynykh.jpg", [Илья Ильиных], [ Go-разработчик (ex-Java) ]),
  team-member("img/nikita_chursin.jpg", [Никита Чурсин], [ Разработчик, тренер по TDD]),
  team-member("img/ekaterina_cherepanova.jpg", [Екатерина Черепанова], [ Senior Java/Kotlin Developer]),
)

= Спасибо "Ozon Tech"!

= Теория

== TDD

#tdd-text()
#pagebreak()
#place(center + horizon, tdd-diagram())

== TDD / Частые ошибки

- *Не ведут список TODO*: бумага, Todoist, Markdown, whatever.
- *Списки ведутся неправильно*: из задач должно быть просто создать тест.
- *Не дорабатывают список задач*: его нужно пополнять, это нормально.
- *Не знают как падает тест*: вы должны знать как упадет тест, так понимаете решаемую проблему.
- *Большие шаги*: реализуем простейшее решение. Сложнее задача - меньше шаги.
- *No refactoring*: доработки в рамках контрактов.
- *Not only refactoring*: доработки в рамках контрактов.
- *no commit*: каждый *Repeat* - фиксируй изменения.

== Тесты / Частые ошибки

- *Несколько assert*: одна проверка - залог понятного теста.
- *if, for и другая логика*: тест должен быть декларативным.
- *Нет логического разделения*: лучше использовать подход _Arrange, Act, Assert_ (*AAA*).
- *Дублирование в именах*: имя теста и его контейнера (класса) не должно дублироваться.


== Pair-Programming

#pair-programming-text()

== Таймер

#pair-programming-timer-text()
#pagebreak()
#place(center + horizon, pair-programming-timer-diagram())

== Таймер / Частые ошибки

- *Диктатура таймера*: переключаться вне таймера - нормально.
- *Кодер/Мыслитель*: важно, чтобы все писали код.
- *Чилловый navigator*: эта роль не отдых.

== Пинг-Понг

#pair-programming-pingpong-text()
#pagebreak()
#place(center + horizon, pair-programming-pingpong-diagram())

== Пинг-Понг / Частые ошибки

- *Темп*: стабилизируется со временем, не переживайте.
- *Не учиться*: все это для обучения другу друга.
- *Роли важны*: не достаточно написать тест и смотреть как коллега его реализует.

= Демонстрация

== Задача-пример <example-task>

Преобразование _duration_ в строку для английского языка: _10 hours 10 minutes 5 seconds_.

Решение поддерживает: дни, часы, минуты, секунды.

#box(
  fill: luma(230),
  inset: 10pt,
  radius: 10pt,
  [ Не допускать переполнения единиц: _5 minutes 76 seconds_. Должно быть _6 minutes 16 seconds_. ],
)

= За работу!

== Разбиваемся по парам

Как лучше разбиться на пары?

- По технологии: Java, .NET, Go, JS, PHP и другие.
- Один опытный в Pair-Programming и/или TDD, второй новичок.
- Если вы не нашли опытных коллег, поднимайте руку.
- Работаем за одним устройством, так удобнее учиться практике.
- Чередуйте пары, чтобы поработать с несколькими людьми.

#place(
  bottom + center,
  box(
    fill: luma(230),
    inset: 10pt,
    radius: 10pt,
    [ Не стесняйтесь учить и учиться! ],
  ),
  float: true,
)

#place(
  auto,
  figure(
    qr-code("https://github.com/Code-Retreat-Russia/", width: 2cm),
    caption: [Шаблоны проектов],
    numbering: none,
  ),
  float: true,
)

== Задача <task>

#grid(
  columns: (1fr, auto),
  column-gutter: 16pt,
  align: horizon,
  task(), task-qr(size: 2.5cm),
)

== Иллюстрация

#place(center + horizon, checkout-example-diagram())

= Первая сессия

#review-questions()

= Перерыв

= AI

== Агенты

Подробнее об этом есть в раздаточных материалах.

Не получилось настроить агента? Воспользуйтесь чатом, суть остается такой же.

#place(center + bottom, figure(
  qr-code("https://chat.qwen.ai/", width: 4cm),
  numbering: none,
  caption: [qwen-чат в браузере],
))

#pagebreak()

#place(center + horizon, agent-modes-diagram())

== AI / Частые ошибки

- *Большие шаги*: каждый шаг должен быть проверяем минимумом усилий.
- *Мухи, котлеты*: одна сессия для планирования, другая для реализации.
- *Я разберусь быстрее сам*: не можете с чем-то разобраться, попросите AI помочь (это касается даже работы с AI, особенно работы с AI).

= Демонстрация

== Задача-пример

Пример работы с AI по TDD будет в #link("https://openai.com/codex/")[codex] на базе прошлой задачи-примера @example-task.

#box(
  fill: gray.lighten(30%),
  inset: 10pt,
  radius: 10pt,
  [
    #set text(size: 11pt)
    - На демонстрации результата мы хотим видеть, что у решение было создано не одним запросом: мы учимся в получении от AI именно того, чего хотим.
    - Можно и даже нужно, все делать с помощью агента: писать тесты, зеленить их, рефакторить код.
    - Не надо сейчас заниматься настройкой агентов и навыков: мы сегодня не об этом.
  ],
)

= Вторая сессия

#review-questions()

= Перерыв

= Приемочное тестирование с AI

== Приемочное тестирование

#acceptance-testing()
#pagebreak()
#place(center + horizon, acceptance-testing-diagram())

== Не пишутся просто так

Для таких тестов нужны инструменты, которые позволят не-разработчику понять
сценарий тестирования. Иначе бы они не отличались от других тестов.

Их можно написать самому под проект, либо использовать существующие.

== ATDD

*Acceptance TDD* - к обычному циклу добавляется цикл шире, устанавливаемый приемочным тестом.

== AI

Мы будем работать с AI для написания приемочных тестов, с последующей
реализацией их через TDD.

== Приемочные тесты / Частые ошибки

- *Понятно только разработке*: это не дает всей ценности тестов, потому что они
  перестают касаться заказчиков и теряется обратная связь для них.
- *Много деталей в тестах*: обвязка сделана так, чтобы нельзя читать сценарии
  без погружения в то, как устроено приложение.
- *Моргают*: это проблема всех тестов высокого уровня, для этого надо
  изолировать систему.
- *Медленно*: ждать результат надоедает, также вызывает другие проблемы.
- *Хрупко*: проверяются детали, что можно было бы удобнее проверить на другом
  уровне.

= Демонстрация

== Задача-пример

Будем развивать задачку @example-task.

Сделаем на ее базе: _таймер до начала события_.

Система должна говорить нам:

- сколько осталось времени до события,
- сколько времени прошло с момента начала события?
- событие начинается сейчас.

== Доп. условия для задачи

#task-harder()

#pagebreak()

_Пример чека_:
- Вход: `🍎 🍎 🍎 🍌 🍌 🍊`
- Чек:

```
- 🍎, 🍌 = 70  (комбо за 70)
- 🍎 x2   = 90  (2 за 90)
- 🍌 x1   = 40
- 🍊 x1   = 20

  Итого   = 220
```

Форматирование примера лучше сохранить, чтобы не придумывать свое: 

- выравнивание по `=`;
- `Итого` с отступом как у товара, но без списка;
- акции после каждого товара в скобках.

= Третья сессия

#review-questions()

= Заключение

== Спасибо за участие!

Пишите тесты, пишите код в парах! Не бойтесь AI.

Заходите в Telegram: _\@technicalexcellenceru_, _\@ozon_tech_.

#place(center + bottom, figure(feedback-qr(size: 5cm), numbering: none, caption: [Форма обратной связи]))
