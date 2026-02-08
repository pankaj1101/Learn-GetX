# 🚀 GetX State Management – Beginner Learning Repository

This repository is created **to learn and practice GetX state management in Flutter**, starting from the basics and gradually moving to real-world use cases.

If you are new to GetX or confused between `Obx`, `GetBuilder`, and `GetX`, this repo is for you 👋

---

## 📌 What You’ll Learn

- ✅ What is GetX and why it’s useful
- ✅ How to use **GetxController**
- ✅ Reactive state using `.obs`
- ✅ UI updates using **Obx**
- ✅ Manual state updates using **GetBuilder**
- ✅ Calling controller methods from UI
- ❌ No `setState()`

---

## 🧠 Core Concept

> **Logic lives in the controller, UI only listens.**

GetX separates **business logic** from **UI**, making your Flutter apps:
- Cleaner
- Faster
- Easier to maintain

---

## 🛠 Topics Covered

- Counter App using GetX
- Obx vs GetBuilder vs GetX
- Controller injection (`Get.put`, `Get.find`)
- Reactive variables (`Rx`, `.obs`)
- Button actions with GetX
- Beginner-friendly project structure

---

## 🌿 Branches

### 🔹 `main` branch
- Covers **GetX basics**
- Counter examples
- Obx, GetBuilder, GetX usage
- Focused on **beginner-friendly learning**

### 🔹 `Api-integration` branch
- Real-world **API integration using GetX**
- Loading state handling
- Error handling
- API response binding with UI
- Best practices for network calls

👉 Switch branch using:
```bash
git checkout Api-Integration
````

---

## 🧪 Example (Simple Counter)

```dart
class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}
```

```dart
Obx(() => Text(
  'Count: ${controller.count}',
));
```

---

## 📂 Project Structure (Simple)

```
lib/
 ├── controllers/
 │    └── counter_controller.dart
 ├── data/
 │    └── product_data.dart
 ├── model/
 │    └── product_model.dart
 ├── views/
 │    └── counter_view.dart
 └── main.dart
```

---

## 🚦 Who Is This For?

* Flutter beginners
* Developers new to GetX
* Anyone confused about state management
* Developers preparing for interviews

---

## 🧑‍💻 How to Run

1. Clone the repo

   ```bash
   git clone <repo-url>
   ```
2. Install dependencies

   ```bash
   flutter pub get
   ```
3. Run the app

   ```bash
   flutter run
   ```

---

## ⚠️ Important Rules Followed

* ❌ No `setState()`
* ❌ No business logic inside UI
* ✅ Controllers handle logic
* ✅ UI reacts using Obx/GetBuilder

---

## 🤝 Contributing

Feel free to:

* Fork this repo
* Improve examples
* Add beginner-friendly explanations
* Raise issues or PRs

---

## ⭐ Support

If this repo helps you understand GetX:

* Give it a ⭐
* Share it with other Flutter beginners

Happy coding 🚀
