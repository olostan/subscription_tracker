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
    List<Future<void>> cancellations = [];
    for (final s in _subscriptions) {
      cancellations.add(s.cancel());
    }
    final n = _subscriptions.length;
    _subscriptions.clear();
    await Future.wait(cancellations);
    return n;
  }
}
