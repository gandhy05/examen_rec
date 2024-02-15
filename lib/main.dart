import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerProvider = ref.watch(routerProv);

    return CupertinoApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerProvider,
      title: 'CupertinoApp',
    );
  }
}
