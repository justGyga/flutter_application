import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryLoading());

  Future<void> loadHistory() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final mass = prefs.getString('mass') ?? 'Не указано';
      final radius = prefs.getString('radius') ?? 'Не указано';
      final v1 = prefs.getDouble('v1');

      emit(HistoryLoaded(mass: mass, radius: radius, v1: v1));
    } catch (e) {
      emit(HistoryError());
    }
  }
}
