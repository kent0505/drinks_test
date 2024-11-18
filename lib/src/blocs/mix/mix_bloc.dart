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
        EditMixEvent() => _editMix(event, emit),
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
    // modelsList.insert(0, event.model);
    // modelsList.add(event.model);
    await updateModels();
    emit(MixLoadedState(mixes: mixesList));
  }

  void _editMix(
    EditMixEvent event,
    Emitter<MixState> emit,
  ) async {
    // for (MixModel model in mixesList) {
    // if (identical(model, event.model)) {
    //   model.title = event.model.title;
    // }
    // }
    await updateModels();
    emit(MixLoadedState(mixes: mixesList));
  }

  void _deleteMix(
    DeleteMixEvent event,
    Emitter<MixState> emit,
  ) async {
    // modelsList.removeWhere((model) => identical(model, event.model));
    await updateModels();
    emit(MixLoadedState(mixes: mixesList));
  }
}
