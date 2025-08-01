import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internationalization/internationalization.dart';

import 'presentation/bloc/global/global_bloc.dart';
import 'presentation/bloc/global/global_event.dart';
import 'presentation/bloc/global/global_state.dart';
import 'presentation/navigation/easy_task_router.dart';
import 'presentation/utils/app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.execute();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<GlobalBloc>()
        ..add(const LoadTheme())
        ..add(const LoadLocale()),
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: state.themeMode,
          theme: CustomTheme.fromContext(context).light(),
          darkTheme: CustomTheme.fromContext(context).dark(),
          locale: state.locale,
          localizationsDelegates: [
            AppIntl.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppIntl.delegate.supportedLocales,
          routerConfig: EasyTaskRouter.router,
        ),
      ),
    );
  }
}
