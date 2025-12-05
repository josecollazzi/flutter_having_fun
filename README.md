# flutter_having_fun

A playground project where I experiment, break things, fix them, and try out new ideas while learning Flutter.  
This repo is intentionally a **trial-and-error sandbox**, but with **real architecture**, **real tooling**, and **required tests**.

[![codecov](https://codecov.io/gh/josecollazzi/flutter_having_fun/branch/main/graph/badge.svg)](https://codecov.io/gh/josecollazzi/flutter_having_fun)

---

## Purpose

This repository exists to:

- Try Flutter features, packages, patterns, and architectures
- Learn by experimenting 
- Maintain good engineering practices such as testing, CI, coverage enforcement, and clean structure

---

## Tests & Code Coverage (Required!)

This project uses GitHub Actions to enforce testing quality:

- All pull requests into `main` must:
    - Run unit tests
    - Reach **≥ 50% code coverage**
- Coverage results are uploaded to **Codecov**, which updates the badge above.
- The workflow uses:
    - `flutter test --coverage`
    - `VeryGoodOpenSource/very_good_coverage` to enforce minimum coverage
    - `codecov/codecov-action` to publish results

If tests fail or coverage drops below 50%, merging is blocked.

---

##  Tech Stack

### Core Tools & Libraries
- **GoRouter** — Navigation
- **Freezed** — Immutable models & sealed classes
- **Riverpod** — State management

---

##  Architecture

A simple layered structure:
- **model**
- **view** 
- **view-model**

Folders are organized by features

---

## Features & Tech Stack

- the feature long list has being built with bloc, in this scenario a project built with riverpod is migrated to bloc
- todo: build a long list with items with images that take long to load (only computing when is needed), fetch dynamically using bloc
- basket has being built with riverpod, question_interviews doesn't use any state management.

---