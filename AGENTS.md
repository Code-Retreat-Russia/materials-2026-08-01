# Repository Guidelines

## Project Structure & Module Organization

This repository contains Typst source files for Code Retreat materials. Top-level `*.typ` files are build entry points: `slides.typ`, `flyer.typ`, and `ai.typ`. Shared Typst helpers live in `lib/components.typ`; update this file when content or diagrams are reused across outputs. Images and logos are kept in `img/` and referenced from Typst with relative paths such as `image("img/code-retreat-logo.svg")`. Generated `*.pdf`, `*.html`, and converted `*.md` files are build artifacts and should not be edited by hand.

## Build, Test, and Development Commands

Use the Makefile targets from the repository root:

- `make` or `make build`: compile all `*.typ` sources to PDF and HTML, then convert HTML to GitHub-flavored Markdown.
- `make pdfs`: generate only PDF files with `typst compile --format pdf`.
- `make htmls`: generate only HTML files with Typst HTML support.
- `make md`: convert generated HTML files to Markdown with `pandoc`.
- `make clean`: remove generated `*.pdf`, `*.html`, and source-derived `*.md` artifacts.

Required local tools are `typst` and `pandoc`.

## Coding Style & Naming Conventions

Keep Typst files readable with one top-level declaration per line and two-space indentation inside function bodies, grids, and nested calls. Prefer shared helpers in `lib/components.typ` for repeated content instead of duplicating text across `slides.typ` and `flyer.typ`. Name reusable helpers in lowercase kebab style, for example `pair-programming-text()` or `task-hex-qr()`. Keep asset filenames descriptive and lowercase where possible.

## Testing Guidelines

There is no separate automated test suite. Treat `make build` as the primary verification step. For layout changes, inspect the resulting PDFs and HTML files, especially slides with diagrams, QR codes, footnotes, and image-heavy sections. Run `make clean` before a fresh build when checking generated output from scratch.

## Commit & Pull Request Guidelines

Git history uses short Conventional Commit prefixes, for example `feat: Добавить материалы для Code Retreat` and `fix: заменить deepseek на qwen-chat`. Follow `feat:`, `fix:`, `docs:`, or `chore:` with a concise Russian or English description. Pull requests should explain the changed materials, note verification commands such as `make build`, and include screenshots or exported PDFs when visual layout changes.

## Agent-Specific Instructions

Do not create commits unless explicitly requested. Before changing generated artifacts, prefer updating the Typst source and rebuilding.
