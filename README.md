# flutter_having_fun

A playground project where I experiment, break things, fix them, and try out new ideas while learning Flutter.  
This repo is intentionally a **trial-and-error sandbox**, but with **real architecture**, **real tooling**, and **required tests**—because even experiments should have good habits.

[![codecov](https://codecov.io/gh/josecollazzi/flutter_having_fun/branch/main/graph/badge.svg)](https://codecov.io/gh/josecollazzi/flutter_having_fun)

---

## Purpose

This repository exists to:

- Try Flutter features, packages, patterns, and architectures
- Learn by experimenting 
- Maintain good engineering practices such as testing, CI, coverage enforcement, and clean structure

Even though this is a sandbox project, **merging to `main` requires passing tests and at least 50% code coverage**.

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

##  Features & Tech Stack

### Core Tools & Libraries
- **GoRouter** — Navigation
- **Freezed** — Immutable models & sealed classes
- **Riverpod** — State management

---

##  Architecture

A simple layered structure:
- **data**
- **model** 
- **view-model**

#### Folders organized by features

