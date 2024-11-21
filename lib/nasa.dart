import 'package:flutter/material.dart';
import 'package:flutter_application/cubit/nasa/nasa_cubit.dart';
import 'package:flutter_application/cubit/nasa/nasa_state.dart';
import 'package:flutter_application/shared/photoItem.dart';
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
                    return PhotoItem(
                      imgSrc: state.data.photos![index].imgSrc!,
                      cameraName: state.data.photos![index].camera!.name!,
                      earthDate: state.data.photos![index].earthDate!,
                      roverName: state.data.photos![index].rover!.name!,
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
