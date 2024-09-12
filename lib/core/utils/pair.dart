import 'package:equatable/equatable.dart';

/// Create a Pair
///
/// [F] is type of [first]
///
/// [S] is type of [second]
///
/// [first] and [second] with same pair can create a list
class Pair<F, S> extends Equatable {
  const Pair(
    this.first,
    this.second,
  );
  final F first;
  final S second;

  /// deserialized pair
  (F, S) call() {
    return (first, second);
  }

  /// Pair to Map
  Map<F, S> get toMap {
    return <F, S>{
      first: second,
    };
  }

  /// Pair to MapEntry
  MapEntry<F, S> get toMapEntry {
    return MapEntry(
      first,
      second,
    );
  }

  /// reverse pair
  ///
  /// [first] will be the [second] and vice versa
  Pair<S, F> get reverse {
    return Pair<S, F>(
      second,
      first,
    );
  }

  /// copy with function
  ///
  /// [first] and [second] are optional
  ///
  /// if no second are supplied will take the instance second
  Pair<F, S> copyWith({
    F? first,
    S? second,
  }) {
    return Pair(
      first ?? this.first,
      second ?? this.second,
    );
  }

  /// mutate this pair into another pair with difference type
  ///
  /// [f] is your mutation function
  Pair<A, B> mutate<A, B>(Pair<A, B> Function(F first, S second) f) {
    return f(
      first,
      second,
    );
  }

  /// transform pair to new second with [A] type
  ///
  /// [f] is your function to transform into new second
  A transform<A>(A Function(F first, S second) f) {
    return f(
      first,
      second,
    );
  }

  @override
  List<Object?> get props => [first, second];

  @override
  String toString() {
    return 'Pair($first, $second)';
  }
}

extension PairExtension<T> on Pair<T, T> {
  List<T> get toList {
    assert(
      first.runtimeType == second.runtimeType,
      'first and second do not have same type',
    );
    return [
      first,
      second,
    ];
  }
}
