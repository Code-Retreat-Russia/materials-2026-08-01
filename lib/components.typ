#let terms-highlight(doc) = {
  show "Telegram": [*Telegram*]

  show "opencode": [*opencode*]
  show "qwen": [*qwen*]
  show "qwen-code": [*qwen-code*]
  show "Tab": [*Tab*]
  show "AI": [*AI*]

  show "TDD": [*TDD*]
  show "Pair-Programming": [*Pair-Programming*]

  show "Java": [*Java*]
  show "Go": [*Go*]
  show "JS": [*JS*]
  show "PHP": [*PHP*]
  show "Python": [*Python*]
  show "Kotlin": [*Kotlin*]
  show ".NET": [*.NET*]
  show "Todoist": [*Todoist*]
  show "Markdown": [*Markdown*]

  show "Code Retreat": [*Code Retreat*]

  doc
}

#let ai-modes() = {
  [
    У агентов есть несколько режимов работы. Они управляют тем, что доступно для выполнения агенту:

    - *opencode* переключается между режимами _plan_, _edit_ по Tab.
    - *qwen-code* переключается по команде `/approval-mode`

    Это важно для работы, чтобы не бросаться к разработке сразу, а сначала составить план.

  ]
}

#let goals() = {
  [
    В порядке важности:

    1. Весело провести время!
    2. Научиться писать классный код используя TDD, совместную разработку и другие техники разработки ПО.
    2. Взять на себя риск и поэкспериментировать.
    3. Поработать с AI.
    4. Делиться опытом!
  ]
}

#let plan() = {
  [
    - *11:00*: Мы тут.
    - *11:30*: Первая сессия в группах.
    - *12:30*: Демонстрация и обсуждение.
    - *12:45*: Перерыв.
    - *13:00*: Вторая сессия в новых группах с ограничениями .
    - *14:00*: Демонстрация и обсуждение.
    - *14:15*: Перерыв.
    - *14:30*: Работа с AI.
    - *15:00*: Третья сессия в новых группах с AI.
    - *16:00*: Демонстрация и обсуждение.
    - *16:15*: Закрытие. #footnote[
        Желающие смогут продолжить на фудкорте
        #link("https://dreamisland.ru/objects/park/restaurants")[Острова мечты].
      ]
  ]
}


#let task() = {
  [

    #link("https://matejker.github.io/game-of-life/#orthogonal---the-original-live-demo")[Игра жизни:]

    - *Живая клетка*:
      - с _одним_ или _без_ соседей *умирает* от одиночества.
      - с _четырьмя_ или _более_ соседями *умирает* от перенаселения.
      - с _двумя_ или _тремя_ соседями *выживает*.
    - *Мертвая клетка*:
      - с _тремя_ соседями *оживает*.
  ]
}

#let task-hex(enable-footnote: true) = {
  [
    #link("https://matejker.github.io/game-of-life/#hexagonal-live-demo")[
      Гексагональная игра жизни:
    ]#if enable-footnote {
      footnote[
        Есть другая ссылка, может
        #link("https://arunarjunakani.github.io/HexagonalGameOfLife/")[она]
        вам будет удобнее.
      ]
    }

    - *Живая клетка*:
      - с _одним_ или _без_ соседей *умирает* от одиночества.
      - с _тремя_ или _более_ соседями *умирает* от перенаселения.
      - с _двумя_ соседями *выживает*.
    - *Мертвая клетка*:
      - с _двумя_ соседями *оживает*.
  ]
}

#let task-hex-qr(size: 3cm) = {
  import "@preview/cades:0.3.1": qr-code

  qr-code("https://matejker.github.io/game-of-life/#hexagonal-live-demo", width: size)
}

#let task-qr(size: 3cm) = {
  import "@preview/cades:0.3.1": qr-code

  qr-code("https://matejker.github.io/game-of-life/#orthogonal---the-original-live-demo", width: size)
}

#let feedback-qr(size: 3cm) = {
  import "@preview/cades:0.3.1": qr-code

  qr-code("https://forms.gle/7ifnuU9rVhfxxQk4A", width: size)
}


#let tdd-text() = {
  [
    Разработка через тестирование - это просто!

    0. *Составить список задач!*
    1. #text(weight: "bold", fill: red, "Красный"): написать _минимальный_ тест, который падает;
    2. #text(weight: "bold", fill: green, "Зеленый"): написать _минимальный_ код, чтобы тест прошел;
    3. *Рефакторинг*: улучшить код, не меняя функциональность;
    4. *Повторяем*: вернуться к шагу _1_.
  ]
}

#let tdd-diagram() = {
  import "@preview/fletcher:0.5.8" as fletcher

  fletcher.diagram(
    spacing: (0.5em, 0.5em),
    cell-size: (2.5em, 1.2em),
    {
      let (tasks, red, green, refactor) = ((1, 0), (1, 1), (2, 2), (0, 2))

      fletcher.node(tasks, [*Список задач*], fill: rgb("#E3F2FD"))

      fletcher.node(red, [*Красный* \ написать тест], fill: rgb("#FFEBEE"))
      fletcher.node(green, [*Зеленый* \ тест проходит], fill: rgb("#E8F5E9"))
      fletcher.node(refactor, [*Рефакторинг* \ улучшить], fill: rgb("#FFFDE7"))

      fletcher.edge(tasks, red, "->")
      fletcher.edge(red, green, "->")
      fletcher.edge(green, refactor, "->")
      fletcher.edge(refactor, red, "->")
    },
  )
}

#let pair-programming-text() = {
  [
    Сегодня писать код будем в парах#footnote[
      Писать код можно в тройках, четверках и так далее:
      суть не изменится, процесс легко адаптировать, см.
      #link("https://agilealliance.org/glossary/mob-programming/")[Mob-Programming]
    ].

    Организовать это можно двумя подходами:

    - *Таймер*: роли меняются интервалами,
    - *Пинг-Понг*: роли меняются тестами.

    В обоих случаях будет две роли:

    - *Водитель*: руки команды,
    - *Навигатор*: мозг операции.
  ]
}

#let pair-programming-timer-text() = {
  [
    Делимся на роли и меняем их каждые 5-10 минут.#footnote[Конечно, можно и не точно 5-10 минут, главное меняться _достаточно_ часто.]
  ]
}

#let pair-programming-pingpong-text() = {
  [
    Делимся на роли. Используем цикл TDD для смены роли:

    1. #text(weight: "bold", fill: red, "Красный"): начало работы; #footnote[Первую итерацию можно не меняться, чтобы она не была супер-быстрой.]
    2. *Меняемся*: ключевой момент смены роли;
    3. #text(weight: "bold", fill: green, "Зеленый"): продолжается уже другим участником;
    4. *Рефакторинг*;
    5. *Повторяем*: вернуться к шагу _1_.
  ]
}

#let pair-programming-timer-diagram() = {
  import "@preview/fletcher:0.5.8" as fletcher

  fletcher.diagram(
    spacing: (0.5em, 0.5em),
    cell-size: (2.5em, 1.5em),
    {
      let driver = (0, 0)
      let navigator = (0, 2)

      fletcher.node(
        driver,
        align(center)[#emoji.keyboard *Водитель*],
        shape: "rect",
        width: 6em,
        fill: rgb("#E8EAF6"),
      )
      fletcher.node(
        navigator,
        align(center)[#emoji.brain *Навигатор*],
        shape: "rect",
        width: 6em,
        fill: rgb("#F3E5F5"),
      )

      fletcher.edge(driver, navigator, "->", bend: 45deg, label: [*5-10 минут*])
      fletcher.edge(navigator, driver, "->", bend: 45deg, label: [*5-10 минут*])
    },
  )
}

#let pair-programming-pingpong-diagram() = {
  import "@preview/fletcher:0.5.8" as fletcher

  fletcher.diagram(
    spacing: (0.5em, 0.5em),
    cell-size: (2.5em, 1.2em),
    {
      let (tasks, red, green, refactor, change) = ((1, 0), (1, 1), (2, 2), (1, 3), (0, 2))

      fletcher.node(tasks, [*Список задач*], fill: rgb("#E3F2FD"))

      fletcher.node(red, [*Красный* \ написать тест], fill: rgb("#FFEBEE"))
      fletcher.node(green, [*Зеленый* \ тест проходит], fill: rgb("#E8F5E9"))
      fletcher.node(refactor, [*Рефакторинг* \ улучшить], fill: rgb("#FFFDE7"))
      fletcher.node(change, [*Смена* \ Роли передаются], fill: rgb("#F3E5F5"))

      fletcher.edge(tasks, red, "->")
      fletcher.edge(red, green, "->")
      fletcher.edge(green, refactor, "->")
      fletcher.edge(refactor, change, "->")
      fletcher.edge(change, red, "->")
    },
  )
}


#let review-questions() = {
  [
    = Демонстрация результата
    = Подвести итоги упражнения в парах
  ]
}
