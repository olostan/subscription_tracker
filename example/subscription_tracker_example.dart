import 'package:subscription_tracker/subscription_tracker.dart';

void main() async {
  final tracker = SubscriptionTracker();
  final stream = Stream.value(123);

  stream.listenTracked(tracker, (event) {
    print(event);
  });

  final cancelled = await tracker.cancelAll();

  print('cancelled $cancelled subscriptions');
}
