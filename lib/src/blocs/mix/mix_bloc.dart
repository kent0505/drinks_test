import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db/db.dart';
import '../../core/models/mix_model.dart';

part 'mix_event.dart';
part 'mix_state.dart';

class MixBloc extends Bloc<MixEvent, MixState> {
  MixBloc() : super(MixInitial()) {
    on<MixEvent>(
      (event, emit) => switch (event) {
        GetMixEvent() => _getMix(event, emit),
        AddMixEvent() => _addMix(event, emit),
        DeleteMixEvent() => _deleteMix(event, emit),
      },
    );
  }

  void _getMix(
    GetMixEvent event,
    Emitter<MixState> emit,
  ) async {
    await getModels();
    emit(MixLoadedState(mixes: mixesList));
  }

  void _addMix(
    AddMixEvent event,
    Emitter<MixState> emit,
  ) async {
    mixesList.insert(0, event.mix);
    // mixesList.add(event.mix);
    await updateModels();
    emit(MixLoadedState(mixes: mixesList));
  }

  void _deleteMix(
    DeleteMixEvent event,
    Emitter<MixState> emit,
  ) async {
    mixesList.removeWhere((model) => identical(model, event.mix));
    await updateModels();
    emit(MixLoadedState(mixes: mixesList));
  }
}
