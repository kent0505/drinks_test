part of 'mix_bloc.dart';

@immutable
sealed class MixEvent {}

class GetMixEvent extends MixEvent {}

class AddMixEvent extends MixEvent {
  AddMixEvent({required this.mix});
  final MixModel mix;
}

class DelMixEvent extends MixEvent {
  DelMixEvent({required this.mix});
  final MixModel mix;
}
