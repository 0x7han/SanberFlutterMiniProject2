import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanber_flutter_mini_project_2/bloc/cart/cart_bloc.dart';
import 'package:sanber_flutter_mini_project_2/bloc/product/product_bloc.dart';
import 'package:sanber_flutter_mini_project_2/bloc/user/user_bloc.dart';
import 'package:sanber_flutter_mini_project_2/helper/notification_helper.dart';
import 'package:sanber_flutter_mini_project_2/view/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationHelper().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (_) => ProductBloc()..add(LoadProducts()),
          
        ),
        BlocProvider<UserBloc>(
          create: (_) => UserBloc()..add(const LoadUserById(1)),
          
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc()..add(const LoadCartRecent(1)),
          
        ),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Project 2 - Raihan Rabbani',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}