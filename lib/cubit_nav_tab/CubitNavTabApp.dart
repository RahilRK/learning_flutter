import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/cubit_nav_tab/NavCubit.dart';
import 'package:learning_flutter/cubit_nav_tab/route_generator_for_nav_drawer_cubit.dart';
import 'package:learning_flutter/firebase_notification/notification_cubit.dart';
import 'package:learning_flutter/main.dart';
import 'package:learning_flutter/theme/color.dart';

class CubitNavTabApp extends StatelessWidget {
  const CubitNavTabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (_) => NotificationCubit()),
        BlocProvider(create: (_) => NavCubit()),
        // later: BlocProvider(create: (_) => NotificationCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.color_247EAD),
          useMaterial3: false,
        ),
        navigatorKey: navigatorKey,
        initialRoute: '/',
        onGenerateRoute: RouteGeneratorForNavDrawerCubit.generateRoute,
      ),
    );
  }
}
