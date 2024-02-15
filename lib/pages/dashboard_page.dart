import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/routes/app_router.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Dashboard"),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: CupertinoListSection(
          header: const Text("List of options:"),
          children: [
            CupertinoListTile(
              title: const Text("Drivers"),
              leading: const Icon(CupertinoIcons.person_2_fill),
              trailing: const Icon(CupertinoIcons.right_chevron),
              onTap: () {
                ref.read(routerProv).push(AppRoutes.drivers);
              },
            ),
            CupertinoListTile(
              title: const Text("Calendar"),
              leading: const Icon(CupertinoIcons.calendar),
              trailing: const Icon(CupertinoIcons.right_chevron),
              onTap: () {
                ref.read(routerProv).push(AppRoutes.calendar);
                //
              },
            ),
          ],
        ),
      ),
    );
  }
}
