part of 'mix_bloc.dart';

@immutable
sealed class MixEvent {}

class GetMixEvent extends MixEvent {}

class AddMixEvent extends MixEvent {
  AddMixEvent({required this.mix});

  final MixModel mix;
}

class DeleteMixEvent extends MixEvent {
  DeleteMixEvent({required this.mix});

  final MixModel mix;
}
