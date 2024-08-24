# Subscription Tracker

[![pub package](https://img.shields.io/pub/v/subscription_tracker.svg)](https://pub.dev/packages/subscription_tracker)

Effortless subscription management for Dart Streams. Track, cancel, and simplify your asynchronous code.

## Features

* **Centralized Subscription Tracking:** Keep all your `Stream` subscriptions organized within a `SubscriptionTracker` instance.
* **Bulk Cancellation:**  Cleanly unsubscribe from all tracked subscriptions with a single `cancelAll()` call.
* **Stream Extension:**  Leverage the `listenTracked` extension method for seamless integration with existing `Stream` usage.
* **Lightweight:**  Minimal overhead, ensuring your application remains performant.

## Installation

Add `subscription_tracker` to your `pubspec.yaml`:

```yaml
dependencies:
  subscription_tracker: ^latest_version
```

Then, run `dart pub get`.

## Usage

```dart
import 'package:subscription_tracker/subscription_tracker.dart';

void main() {
  final tracker = SubscriptionTracker();

  final subscription1 = someStream.listenTracked(tracker, (data) {
    // Handle stream data
  });

  final subscription2 = anotherStream.listenTracked(tracker, (data) {
    // Handle stream data
  });

  // ... Later in your code, when you want to cancel all subscriptions:
  tracker.cancelAll(); 
}
```

## Why Subscription Tracker?

* **Prevent Memory Leaks**: Avoid unintentional subscriptions lingering in memory.
* **Code Clarity**: Centralize subscription management for cleaner, more maintainable code.
* **Simplified Cleanup**: Ensure resources are released correctly when components are disposed of.

## Contributing
Contributions are welcome! Feel free to open issues or submit pull requests.

## License

[BSD Clause 3](LICENSE)