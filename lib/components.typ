#let terms-highlight(doc) = {
  show "Telegram": [*Telegram*]

  show "opencode": [*opencode*]
  show "qwen": [*qwen*]
  show "qwen-code": [*qwen-code*]
  show "kodacode": [*kodacode*]
  show "Tab": [*Tab*]
  show "AI": [*AI*]

  show "TDD": [*TDD*]
  show "ATDD": [*ATDD*]
  show "Acceptance Testing": [*Acceptance Testing*]
  show "Приемочное тестирование": [*Приемочное тестирование*]
  show "Приемочных тестов": [*Приемочное тестирование*]
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

    - opencode переключается между режимами _plan_, _edit_ по Tab.
    - qwen-code переключается по команде `/approval-mode`
    - kodacode работает только в одном режиме, поэтому там надо аккуратнее
      формулировать задачу.

    Это важно для работы, чтобы не бросаться к разработке сразу, а сначала составить план.
  ]
}

#let agent-modes-diagram() = {
  import "@preview/fletcher:0.5.8" as fletcher

  fletcher.diagram(
    spacing: (0.5em, 0.5em),
    cell-size: (2.8em, 1.2em),
    {
      let (request, plan, execute, check, refine) = ((1, 0), (1, 1), (2, 2), (1, 3), (0, 2))

      fletcher.node(request, [*Запрос* \ задача], fill: rgb("#E3F2FD"))
      fletcher.node(plan, [*Plan mode* \ план и вопросы], fill: rgb("#FFFDE7"))
      fletcher.node(execute, [*Execute mode* \ правки и команды], fill: rgb("#E8F5E9"))
      fletcher.node(check, [*Проверка* \ результат], fill: rgb("#E8EAF6"))
      fletcher.node(refine, [*Уточнение* \ следующий шаг], fill: rgb("#F3E5F5"))

      fletcher.edge(request, plan, "->")
      fletcher.edge(plan, execute, "->")
      fletcher.edge(execute, check, "->")
      fletcher.edge(check, refine, "->")
      fletcher.edge(refine, plan, "->")
    },
  )
}

#let goals() = {
  [
    В порядке важности:

    1. Весело провести время!
    2. Научиться писать классный код используя TDD, приемочные тесты,
      совместную разработку и другие техники разработки ПО.
    2. Взять на себя риск и поэкспериментировать.
    3. Поработать с AI.
    4. Делиться опытом!
  ]
}

#let plan() = {
  [
    - *11:30*: Начало.
    - *12:00*: Первая сессия.
    - *13:00*: Демонстрация и обсуждение.
    - *13:15*: Перерыв.
    - *13:45*: Работа с AI.
    - *14:00*: Вторая сессия.
    - *15:00*: Демонстрация и обсуждение.
    - *15:15*: Перерыв.
    - *15:45*: Приемочное тестирование с AI.
    - *16:15*: Третья сессия.
    - *17:15*: Демонстрация и обсуждение.
    - *17:30*: Закрытие. #footnote[ В конце можно организоваться и продолжить вечер в парке. ]
  ]
}


#let task() = {
  [
    #link("https://github.com/brighthr/checkout-kata")[Checkout Kata]

    В магазине есть: *товар*, *цена на товар*, *специальная цена на товар*.

    - *Товар*: Единица продукта, определяемая по идентификатору *SKU* (_Stock Keeping Unit_). В нашем случае *SKU* может быть произвольной строкой.
    - *Цена на товар*: Стоимость *одного товара*. В нашем случае это просто число.
    - *Специальная цена на товар*: Стоимость *нескольких единиц товара*.

    _Пример специальной цены_: Товар "яблоко" стоит 50, но если покупать сразу 3, то они обойдутся в 130.
  ]
}

#let task-harder() = {
  [
    - *Чек*: вывод *правил*, по которым формировалась цена.
    - *Комбо*:#footnote[Задача сложнее, чем кажется, но нам эта сложность не принципиальна] Стоимость *нескольких единиц товаров*.

    _Пример специальной цены на товары_: Товар "яблоко" стоит 50, а "банан" стоит 40, но если покупать сразу "яблоко" и "банан", то цена будет 70.
  ]
}

#let task-qr(size: 3cm) = {
  import "@preview/cades:0.3.1": qr-code

  qr-code("https://github.com/brighthr/checkout-kata", width: size)
}

#let checkout-example-diagram() = {
  let border = rgb("#B0BEC5")
  let muted = rgb("#455A64")
  let price-fill = rgb("#E3F2FD")
  let special-fill = rgb("#FFFDE7")
  let basket-fill = rgb("#F3E5F5")
  let receipt-fill = rgb("#E8F5E9")

  let panel(title, body, fill: luma(250)) = {
    rect(
      width: 100%,
      fill: fill,
      stroke: 0.6pt + border,
      radius: 4pt,
      inset: 8pt,
    )[
      #set text(size: 9pt)
      #text(weight: "bold", title)
      #v(4pt)
      #body
    ]
  }

  let sku(id) = box(
    fill: luma(255),
    stroke: 0.5pt + border,
    radius: 3pt,
    inset: (x: 5pt, y: 2pt),
    text(weight: "bold", id),
  )

  let price-rules = table(
    columns: (auto, auto, auto),
    column-gutter: 7pt,
    align: (left, right, left),
    stroke: none,
    inset: (x: 3pt, y: 1.5pt),
    table.header([*SKU*], [*Цена*], [*Спеццена*]),
    [🍎], [50], [3 за 130],
    [🍌], [30], [2 за 45],
    [🍊], [20], [-],
  )

  let basket = grid(
    columns: (auto,) * 6,
    gutter: 3pt,
    sku([🍎]), sku([🍎]), sku([🍎]), sku([🍌]), sku([🍌]), sku([🍊]),
  )

  let receipt = [
    #table(
      columns: (auto, auto),
      column-gutter: 9pt,
      align: (left, right),
      stroke: none,
      inset: (x: 4pt, y: 1.5pt),
      [🍎 x3], [130],
      [🍌 x2], [45],
      [🍊 x1], [20],
    )
    #v(2pt)
    #box(
      width: 100%,
      fill: luma(255),
      stroke: 0.5pt + border,
      radius: 3pt,
      inset: (x: 5pt, y: 3pt),
      align(center)[*Итого: 195*],
    )
  ]

  figure(
    grid(
      columns: (1fr, auto, 1fr),
      column-gutter: 10pt,
      align: horizon,
      grid(
        columns: 1,
        row-gutter: 6pt,
        panel([Прайс-лист], price-rules, fill: price-fill),
        panel([Корзина], basket, fill: basket-fill),
        panel([Специальные цены], [3 x 🍎 и 2 x 🍌 считаются группами], fill: special-fill),
      ),
      align(center)[#text(size: 24pt, fill: muted)[#sym.arrow]],
      panel([Чек], receipt, fill: receipt-fill),
    ),
    caption: [Пример применения специальных цен],
    numbering: none,
  )
}

#let feedback-qr(size: 3cm) = {
  import "@preview/cades:0.3.1": qr-code

  qr-code("https://forms.gle/mnVXKhpCPpZ3FCcq9", width: size)
}


#let acceptance-testing() = {
  [
    Приемочное тестирование - это тесты, реализованные для проверки соответствия кода пользовательским сценариям.
  ]
}

#let acceptance-testing-diagram(compact: false) = {
  import "@preview/fletcher:0.5.8" as fletcher

  let node(body) = if compact {
    align(center)[
      #set text(size: 8pt)
      #body
    ]
  } else {
    body
  }
  let cell-size = if compact { (2em, 1em) } else { (2.8em, 1.2em) }
  let implementation-text = if compact {
    [*Реализация* \ через TDD]
  } else {
    [*Реализация* \ тест проходит; пишем код по TDD]
  }

  fletcher.diagram(
    spacing: (0.5em, 0.5em),
    cell-size: cell-size,
    {
      let (customer, accept, implementation, demo, refine) = ((1, 0), (2, 1), (2, 3), (0, 3), (0, 1))

      fletcher.node(customer, node([*Заказчик* \ пример]), fill: rgb("#E3F2FD"))
      fletcher.node(accept, node([*Приемочный тест* \ падает]), fill: rgb("#FFEBEE"))
      fletcher.node(implementation, node(implementation-text), fill: rgb("#E8F5E9"))
      fletcher.node(demo, node([*Демо* \ проверка]), fill: rgb("#F3E5F5"))
      fletcher.node(refine, node([*Уточнение* \ новый пример]), fill: rgb("#FFFDE7"))

      fletcher.edge(customer, accept, "->")
      fletcher.edge(accept, implementation, "->")
      fletcher.edge(implementation, demo, "->")
      fletcher.edge(demo, refine, "->")
      fletcher.edge(refine, customer, "->")
    },
  )
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
    Делимся на роли и меняем их каждые 5-10 минут#footnote[Конечно, можно и не точно 5-10 минут, главное меняться _достаточно_ часто.].
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
