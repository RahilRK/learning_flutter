import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/counter/counter_bloc.dart';
import 'package:learning_flutter/bloc/counter/counter_event.dart';
import 'package:learning_flutter/bloc/counter/counter_state.dart';
import 'package:learning_flutter/bloc/visibility/counter_bloc.dart';
import 'package:learning_flutter/bloc/visibility/counter_event.dart';
import 'package:learning_flutter/bloc/visibility/counter_state.dart';

class IncrementEg extends StatefulWidget {
  const IncrementEg({super.key});

  @override
  State<IncrementEg> createState() => _IncrementEgState();
}

class _IncrementEgState extends State<IncrementEg> {
  // final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bloc App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BlocBuilder eg
          BlocBuilder<CounterBloc, CounterState>(
              // bloc: counterBloc,
              builder: (context, counterState) {
            return BlocBuilder<VisibilityBloc, VisibilityState>(
              builder: (context, visibilityState) {
                return Visibility(
                  visible: visibilityState.show,
                  child: Text(
                    counterState.count.toString(),
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                );
              },
            );
          }),

          // BlocListener eg
          BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              if (state.count == 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Counter is: ${state.count}')),
                );
              }
            },
            child: const Text('Bloc Listener'),
          ),
          const SizedBox(
            height: 8,
          ),

          // BlocConsumer eg
          BlocConsumer<CounterBloc, CounterState>(
            // bloc: counterBloc,
            builder: (context, counterState) {
              return Text(
                counterState.count.toString(),
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              );
            },
            listener: (BuildContext context, CounterState state) {
              if (state.count == 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Counter is: ${state.count}')),
                );
              }
            },
          ),
          const SizedBox(
            height: 8,
          ),

          // BlocSelector eg
          BlocSelector<CounterBloc, CounterState, bool>(selector: (state) {
            return state.count % 2 == 0;
          }, builder: (context, isEven) {
            return isEven ? const Text('Even', style: TextStyle(color: Colors.blue),) : const Text('Odd', style: TextStyle(color: Colors.grey),);
          }),
          const SizedBox(
            height: 8,
          ),

          //UI
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // counterBloc.add(CounterIncrementEvent());
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  // counterBloc.add(CounterDecrementEvent());
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                },
                backgroundColor: Colors.redAccent,
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  // counterBloc.add(CounterDecrementEvent());
                  context.read<VisibilityBloc>().add(ShowEvent());
                },
                backgroundColor: Colors.black,
                child: const Text(
                  'Show',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  // counterBloc.add(CounterDecrementEvent());
                  context.read<VisibilityBloc>().add(HideEvent());
                },
                backgroundColor: Colors.black,
                child: const Text(
                  'Hide',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
