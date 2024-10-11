import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_state.dart';

class ScreenCubit extends Cubit<ScreenState> {
  ScreenCubit() : super(ScreenStateInit());

  final TextEditingController massController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();
  bool isAgreed = false;

  void toggleAgreement(bool value) {
    isAgreed = value;
    emit(AgreementChanged(isAgreed));
  }

  void calculate() {
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

    emit(CalculationResult(v1));
  }

  void resetState() {
    emit(ScreenStateInit());
  }
}
