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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                // bloc: counterBloc,
                  builder: (context, counterState) {
                    return BlocBuilder<VisibilityBloc, VisibilityState>(
                      builder: (context, visibilityState) {
                        return Visibility(
                          visible: visibilityState.show,
                          child: Text(
                            counterState.count.toString(),
                            style:
                            TextStyle(fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
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
                  // counterBloc.add(CounterIncrementEvent());
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
              FloatingActionButton(
                onPressed: () {
                  // counterBloc.add(CounterDecrementEvent());
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                },
                child: Icon(Icons.remove),
                backgroundColor: Colors.redAccent,
              ),

              FloatingActionButton(
                onPressed: () {
                  // counterBloc.add(CounterDecrementEvent());
                  context.read<VisibilityBloc>().add(ShowEvent());
                },
                child: Text('Show', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.black,
              ),
              FloatingActionButton(
                onPressed: () {
                  // counterBloc.add(CounterDecrementEvent());
                  context.read<VisibilityBloc>().add(HideEvent());
                },
                child: Text('Hide', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
