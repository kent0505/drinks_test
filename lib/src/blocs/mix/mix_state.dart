part of 'mix_bloc.dart';

@immutable
sealed class MixState {}

final class MixInitial extends MixState {}

final class MixLoadedState extends MixState {
  MixLoadedState({required this.mixes});
  final List<MixModel> mixes;
}
