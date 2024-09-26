import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/counter/counter_bloc.dart';
import 'package:learning_flutter/bloc/counter/counter_event.dart';
import 'package:learning_flutter/bloc/counter/counter_state.dart';
import 'package:learning_flutter/bloc/visibility/counter_bloc.dart';
import 'package:learning_flutter/bloc/visibility/counter_event.dart';
import 'package:learning_flutter/bloc/visibility/counter_state.dart';
import 'package:learning_flutter/cubit/counter/counter_cubit.dart';

class CubitIncrementEg extends StatefulWidget {
  const CubitIncrementEg({super.key});

  @override
  State<CubitIncrementEg> createState() => _CubitIncrementEgState();
}

class _CubitIncrementEgState extends State<CubitIncrementEg> {
  // final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cubit App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BlocBuilder eg
          BlocBuilder<CounterCubit, CounterCubitState>(
            builder: (context, state) {
              return Text(
                state.count.toString(),
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              );
            },
          ),

          //UI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                backgroundColor: Colors.redAccent,
                child: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
