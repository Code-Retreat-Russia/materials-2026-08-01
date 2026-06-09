#set document(title: "Flyer @ Code Retreat")
#set page(paper: "a4", flipped: true, margin: 1cm, columns: 3)
#set text(font: "Arial", size: 10pt)

#import "lib/components.typ": *

#show: terms-highlight.with()

= Code Retreat

*Telegram*:

- _\@technicalexcellenceru_,
- _\@ozon_tech_.

== Расписание

#plan()

== Цели

#goals()

#colbreak()

= TDD

#tdd-text()

#tdd-diagram()

= Pair-Programming

#pair-programming-text()

#colbreak()

== Таймер

#pair-programming-timer-text()

#pair-programming-timer-diagram()

== Пинг-Понг

#pair-programming-pingpong-text()

#pair-programming-pingpong-diagram()

#colbreak()

= AI

#ai-modes()

= Задача

#task()

#place(center + bottom, figure(feedback-qr(size: 3cm), numbering: none, caption: [Форма обратной связи]))

#colbreak()

#grid(
  columns: 1,
  rows: (1cm, auto),
  [= Заметки],
  rect(width: 100%, height: 90%, stroke: 1pt),
)

#colbreak()

#grid(
  columns: 1,
  rows: (1cm, auto),
  [= Чему я научился?],
  rect(width: 100%, height: 90%, stroke: 1pt),
)
