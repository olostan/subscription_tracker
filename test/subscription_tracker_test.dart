import 'dart:async';

import 'package:subscription_tracker/subscription_tracker.dart';
import 'package:test/test.dart';

void main() {
  group('SubscriptionTracker', () {
    var tracker;

    setUp(() {
      tracker = SubscriptionTracker();
    });

    test('Should be fine without subscriptions', () async {
      final cancelled = await tracker.cancelAll();
      expect(cancelled, 0);
    });

    test('Should cancel all subscriptions', () async {
      final controller = StreamController<int>();
      callback(int i) {}
      controller.stream.listenTracked(tracker, callback);
      controller.add(1);
      await tracker.cancelAll();
      controller.add(2);
      expectAsync1(callback, count: 1);
    });
  });
}
