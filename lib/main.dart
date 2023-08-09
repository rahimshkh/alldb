import 'controller/blocs/hive_bloc/hive_bloc.dart';
import 'controller/cubits/bottom_navigation_cubit.dart';
import 'helper/utils/hive_utils.dart';
import 'views/screens/chooser_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/blocs/firebase_bloc/firebase_bloc.dart';
import 'controller/blocs/network_bloc/network_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStorageManager.openHiveBox();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationCubit()),
        BlocProvider(create: (context) => HiveBloc()),
        BlocProvider(create: (context) => FirebaseBloc()),
        BlocProvider(create: (context) => NetworkBloc()),
      ],
      child: const MaterialApp(
        home: ChooserScreen(),
      ),
    );
  }
}
