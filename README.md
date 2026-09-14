# MBQuiz 📱

MBQuiz is an Android-based quiz application designed to help **trainers (Ausbilder)** and **team leaders** create and manage tests for apprentices (Azubis).

The main goal is to digitalize the testing process, reduce paper usage, save time, and provide immediate test results through automatic evaluation.

---

## 🎯 Project Goal

In a traditional testing process, trainers often have to:

- Prepare and print tests
- Distribute paper-based tests
- Collect completed tests
- Correct the answers manually
- Calculate the final results

MBQuiz aims to simplify this process by moving the testing workflow to a digital platform.

With the application:

- Trainers can manage quiz content.
- Apprentices can complete tests using an Android device.
- Answers can be processed automatically.
- Results can be calculated immediately.
- The need for printed tests and manual correction is reduced.

---

## 🏗️ Architecture

The project consists of two main components:

```text
┌─────────────────────────┐
│      Android App        │
│                         │
│        Kotlin           │
│   Activities / UI       │
│       ViewModel         │
└────────────┬────────────┘
             │
             │ REST API
             │ JSON
             ▼
┌─────────────────────────┐
│      Django Backend     │
│                         │
│       REST API          │
│      Business Logic     │
│      Data Management    │
└────────────┬────────────┘
             │
             ▼
        Database
