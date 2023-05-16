import 'package:bloc_practice/bloc/counter_bloc.dart';
import 'package:bloc_practice/screens/UserList.dart';
import 'package:bloc_practice/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user/user_bloc.dart';

class TabScreens extends StatefulWidget {
  const TabScreens({super.key});

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: const Home(),
    ),
    BlocProvider<UserBloc>(
      create: (context) => UserBloc(),
      child: const UserList(),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Basic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'API',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
