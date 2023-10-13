import 'package:assignmentluvit/firebase_options.dart';
import 'package:assignmentluvit/presentation/blocs/bloc.dart';
import 'package:assignmentluvit/presentation/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetDataBloc(),
      child: const MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
