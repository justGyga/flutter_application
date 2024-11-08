import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'page_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenStateInit()) {
    _loadSavedData(); // Загрузка данных при инициализации
  }

  final TextEditingController massController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();
  bool isAgreed = false;

  void toggleAgreement(bool value) {
    isAgreed = value;
    emit(AgreementChanged(isAgreed));
  }

  void calculate() async {
    if (massController.text.isEmpty || radiusController.text.isEmpty) {
      emit(ErrorInputIsEmpty());
      return;
    }

    final double? mass = double.tryParse(massController.text);
    final double? radius = double.tryParse(radiusController.text);
    if (mass == null || radius == null) {
      emit(ErrorInvalidInput());
      return;
    }

    const double G = 6.67430e-11;
    final double radiusInMeters = radius * 1000;
    final double v1 = sqrt((G * mass) / radiusInMeters);

    // Сохранение данных
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('v1', v1);
    await prefs.setString('mass', massController.text);
    await prefs.setString('radius', radiusController.text);

    emit(CalculationResult(v1));
  }

  void resetState() {
    emit(ScreenStateInit());
  }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    final savedMass = prefs.getString('mass') ?? '';
    final savedRadius = prefs.getString('radius') ?? '';
    final savedV1 = prefs.getDouble('v1');

    massController.text = savedMass;
    radiusController.text = savedRadius;

    if (savedV1 != null) {
      emit(CalculationResult(savedV1));
    }
  }
}
