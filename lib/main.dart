import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marabh/core/configs/theme/app_theme.dart';
import 'package:marabh/core/services/injection_container.dart';
import 'package:marabh/core/services/route/router.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:marabh/src/auth/presentation/bloc/auth/auth_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(AuthCheckStatusEvent()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }
}
