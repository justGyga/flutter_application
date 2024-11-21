import 'package:flutter_application/cubit/nasa/nasa_state.dart';
import 'package:flutter_application/models/nasa.dart';
import 'package:flutter_application/requests/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaLoadingState());

  Future<void> loadData() async {
    try {
      Map<String, dynamic> apiData = await getNasaData();
      Nasa nasaData = Nasa.fromJson(apiData);
      emit(NasaLoadedState(data: nasaData));
      return;
    } catch (e) {
      emit(NasaErrorState());
      return;
    }
  }
}
