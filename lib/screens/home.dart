import 'package:bloc_practice/bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter_event.dart';
import 'package:bloc_practice/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern basic"),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is CounterInit) {
            return _view(context, 0);
          } else if (state is CounterUpdate) {
            return _view(context, state.counter);
          } else {
            return const Offstage();
          }
        },
      ),
    );
  }

  Widget _view(BuildContext context, int value) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrese());
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrese());
                },
                child: const Icon(Icons.minimize),
              )
            ],
          )
        ],
      ),
    );
  }
}
