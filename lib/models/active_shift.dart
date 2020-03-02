import "package:property_change_notifier/property_change_notifier.dart";
import "package:optional/optional.dart";

class ActiveShift extends PropertyChangeNotifier {
  Optional<Shift> _shift = Optional.empty();
  ActiveShiftStatus _status = ActiveShiftStatus.uninitialized;
  ActiveShiftStatus get status => _status;

  void start() {
//    _shift = Optional.of(Shift.create());
    _status = ActiveShiftStatus.started;
  }

  void finish() {
    _status = ActiveShiftStatus.finished;
  }

  void close() {
    _shift = Optional.empty();
    _status = ActiveShiftStatus.uninitialized;
  }
}

enum ActiveShiftStatus {
  uninitialized,
  started,
  finished,
}

class Shift {
  final DateTime startedOn;
  final Optional<DateTime> closedOn;
  final String posRef;
  final int initialPhotosCount;
  final Optional<int> currentPhotosCount;

  Shift(this.startedOn, this.closedOn, this.posRef, this.initialPhotosCount,
      this.currentPhotosCount);

  Shift.create(String posRef, int initialPhotosCount)
      : this(DateTime.now(), Optional.empty(), posRef, initialPhotosCount,
            Optional.empty());

  Shift copyWith({DateTime closedOn, int currentPhotosCount}) {
    return Shift(this.startedOn, Optional.ofNullable(closedOn), posRef,
        initialPhotosCount, Optional.ofNullable(currentPhotosCount));
  }
}

extension ShiftMutations on Shift {
  Shift finish(int currentPhotosCount) {
    return copyWith(
        closedOn: DateTime.now(), currentPhotosCount: currentPhotosCount);
  }
}
