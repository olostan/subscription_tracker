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

    test('Should cancel a subscription', () async {
      var tracker = SubscriptionTracker();
      final results = StreamController<int>();
      Stream.fromIterable([1, 2, 3, 4, 5]).listenTracked(tracker, (i) async {
        results.add(i);
        if (i > 1) {
          await tracker.cancelAll();
          results.close();
        }
      });
      expect(results.stream, emitsInOrder([1, 2, emitsDone]));
    });
    test('Should cancel multiple subscriptions', () async {
      var tracker = SubscriptionTracker();
      final results = StreamController<int>();
      Stream.fromIterable([1, 2, 3, 4, 5]).listenTracked(tracker, (i) async {
        results.add(i);
        if (i > 2) {
          await tracker.cancelAll();
          results.close();
        }
      });
      Stream.fromIterable([10, 11, 12, 13]).listenTracked(tracker, (i) async {
        results.add(i);
      });
      expect(results.stream, emitsInOrder([1, 10, 2, 11, 3, emitsDone]));
    });
  });
}
