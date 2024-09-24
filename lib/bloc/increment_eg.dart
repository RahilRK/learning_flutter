import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/bloc/counter_bloc.dart';
import 'package:learning_flutter/bloc/counter_event.dart';
import 'package:learning_flutter/bloc/counter_state.dart';

class IncrementEg extends StatefulWidget {
  const IncrementEg({super.key});

  @override
  State<IncrementEg> createState() => _IncrementEgState();
}

class _IncrementEgState extends State<IncrementEg> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                  bloc: counterBloc,
                  builder: (context, state) {
                    return Text(
                      state.count.toString(),
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    );
                  })),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterIncrementEvent());
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterDecrementEvent());
                },
                child: Icon(Icons.remove),
                backgroundColor: Colors.redAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
