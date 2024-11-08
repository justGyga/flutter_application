part of 'page_cubit.dart';

class ScreenState {}

class ScreenStateInit extends ScreenState {}

class AgreementChanged extends ScreenState {
  final bool isAgreed;
  AgreementChanged(this.isAgreed);
}

class CalculationResult extends ScreenState {
  final double result;
  CalculationResult(this.result);
}

class ErrorInputIsEmpty extends ScreenState {}

class ErrorInvalidInput extends ScreenState {}
