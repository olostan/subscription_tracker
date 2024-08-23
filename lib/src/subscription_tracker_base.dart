import 'dart:async';

extension ListenTracker<T> on Stream<T> {
  StreamSubscription<T> listenTracked(
      SubscriptionTracker tracker, void Function(T event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    final subscription = listen(onData);
    tracker._subscriptions.add(subscription);
    return subscription;
  }
}

final class SubscriptionTracker {
  final List<StreamSubscription> _subscriptions = [];

  cancelAll() async {
    var cancelled = 0;
    for (var subscription in _subscriptions) {
      await subscription.cancel();
      cancelled++;
    }
    _subscriptions.clear();
    return cancelled;
  }
}
