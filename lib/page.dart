import 'package:flutter/material.dart';
import 'package:flutter_application/cubit/page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScreenCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ScreenCubit, ScreenState>(
            builder: (context, state) {
              final cubit = context.read<ScreenCubit>();

              if (state is CalculationResult) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Результат: ${state.result}'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        cubit.resetState();
                      },
                      child: const Text('Назад'),
                    ),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: cubit.massController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Масса небесного тела (кг)',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: cubit.radiusController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Радиус небесного тела (км)',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: cubit.isAgreed,
                        onChanged: (bool? value) {
                          cubit.toggleAgreement(value ?? false);
                        },
                      ),
                      const Text('Согласие на обработку данных'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: cubit.isAgreed ? () => cubit.calculate() : null,
                    child: const Text('Рассчитать'),
                  ),
                  if (state is ErrorInputIsEmpty)
                    const Text(
                      'Ошибка: Введите массу и радиус',
                      style: TextStyle(color: Colors.red),
                    ),
                  if (state is ErrorInvalidInput)
                    const Text(
                      'Ошибка: Некорректный ввод данных',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
