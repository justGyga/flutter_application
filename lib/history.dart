import 'package:flutter/material.dart';
import 'package:flutter_application/cubit/history/history_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HistoryCubit()..loadHistory(),
      child: Scaffold(
        appBar: AppBar(title: const Text('История')),
        body: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            if (state is HistoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HistoryLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Масса: ${state.mass}'),
                    Text('Радиус: ${state.radius}'),
                    Text('Скорость (v1): ${state.v1 ?? 'Не рассчитана'}'),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Ошибка загрузки данных'));
            }
          },
        ),
      ),
    );
  }
}
