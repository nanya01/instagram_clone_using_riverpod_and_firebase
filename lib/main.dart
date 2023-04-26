import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone_with_riverpod/firebase_options.dart';
import 'package:instagram_clone_with_riverpod/state/auth/providers/is_logged_in_provider.dart';
import 'package:instagram_clone_with_riverpod/state/providers/is_loading_provider.dart';
import 'package:instagram_clone_with_riverpod/views/components/animations/data_not_found_animation_view.dart';
import 'package:instagram_clone_with_riverpod/views/components/loading/loading_screen.dart';

import 'views/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            indicatorColor: Colors.blueGrey),
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Consumer(
          builder: (BuildContext context, WidgetRef ref, _) {
            // take care of loading screen
            ref.listen<bool>(isLoadingProvider, (_, isLoading) {
              if (isLoading) {
                LoadingScreen.instance().show(context: context);
              } else {
                LoadingScreen.instance().hide();
              }
            });
            final isLoggedIn = ref.watch(isLoggedInProvider);
            if (isLoggedIn) {
              return const HomePage();
            } else {
              return const LoginView();
            }
          },
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // LoadingScreen.instance().show(context: context, text: "Hello world");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            return DataNotFoundAnimationView();
            // TextButton(
            //   onPressed: () async {
            //     await ref.read(authStateProvider.notifier).logOut();
            //   },
            //   child: const Text("Logout"));
          },
        ));
  }
}
