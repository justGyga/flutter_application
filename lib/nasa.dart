import 'package:flutter/material.dart';
import 'package:flutter_application/cubit/nasa/nasa_cubit.dart';
import 'package:flutter_application/cubit/nasa/nasa_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NasaScreen extends StatelessWidget {
  const NasaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NasaCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Mars photos"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<NasaCubit, NasaState>(
            builder: (context, state) {
              if (state is NasaLoadingState) {
                BlocProvider.of<NasaCubit>(context).loadData();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is NasaLoadedState) {
                return ListView.builder(
                  itemCount: state.data.photos!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 241, 219, 255), // Цвет фона для всего виджета
                        borderRadius: BorderRadius.circular(
                            8), // Закругленные углы для контейнера
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: 2000,
                            child: Image.network(
                                state.data.photos![index].imgSrc!),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Camera: ${state.data.photos![index].camera!.name!}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Date: ${state.data.photos![index].earthDate!}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              if (state is NasaErrorState) {
                return const Center(
                  child: Text('Ooops!!! Something went wrong...'),
                );
              }
              return const SizedBox(
                width: 1,
                height: 1,
              );
            },
          ),
        ),
      ),
    );
  }
}
