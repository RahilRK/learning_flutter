import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/cubit_nav_tab/NavCubit.dart';
import 'package:learning_flutter/main.dart';

class NavDrawerCubit extends StatelessWidget {
  const NavDrawerCubit({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<NavCubit>();

    return BlocBuilder<NavCubit, int>(
      builder: (context, screenIndex) {
        return Scaffold(
          appBar: AppBar(
            title: Text(destinations[screenIndex].label),
          ),
          drawer: NavigationDrawer(
            onDestinationSelected: (index) {
              navCubit.selectTab(index); // update cubit state
              Navigator.pop(context); // close drawer
            },
            selectedIndex: screenIndex,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
                child: Text(
                  'Header',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              ...destinations.map(
                (ExampleDestination destination) {
                  return NavigationDrawerDestination(
                    label: Text(destination.label),
                    icon: destination.icon,
                    selectedIcon: destination.selectedIcon,
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
                child: Divider(),
              ),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            onDestinationSelected: navCubit.selectTab,
            indicatorColor: Colors.amber,
            selectedIndex: screenIndex,
            destinations: destinations.map(
              (ExampleDestination destination) {
                return NavigationDestination(
                  label: destination.label,
                  icon: destination.icon,
                  selectedIcon: destination.selectedIcon,
                  tooltip: destination.label,
                );
              },
            ).toList(),
          ),
          body: destinations.elementAt(screenIndex).selectedScreen,
        );
      },
    );
  }
}
