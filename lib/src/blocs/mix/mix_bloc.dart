import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/mix_model.dart';
import '../../core/utils.dart';

part 'mix_event.dart';
part 'mix_state.dart';

class MixBloc extends Bloc<MixEvent, MixState> {
  MixBloc() : super(MixInitial()) {
    on<MixEvent>(
      (event, emit) => switch (event) {
        GetMixEvent() => _getMix(event, emit),
        AddMixEvent() => _addMix(event, emit),
        DelMixEvent() => _delMix(event, emit),
      },
    );
  }

  void _getMix(
    GetMixEvent event,
    Emitter<MixState> emit,
  ) async {
    logger('GET');
    await getMixes();
    emit(MixLoadedState(mixes: mixesList));
  }

  void _addMix(
    AddMixEvent event,
    Emitter<MixState> emit,
  ) async {
    mixesList.insert(0, event.mix);
    await updateMixes();
    emit(MixLoadedState(mixes: mixesList));
  }

  void _delMix(
    DelMixEvent event,
    Emitter<MixState> emit,
  ) async {
    mixesList.removeWhere((mix) => identical(mix, event.mix));
    await updateMixes();
    emit(MixLoadedState(mixes: mixesList));
  }
}
