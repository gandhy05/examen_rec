import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/providers/drivers_provider.dart';
import 'package:movil_wrc_app/responseTypes/drivers_response.dart';
import 'package:movil_wrc_app/widgets/tile_driver.dart';

class DriversPage extends ConsumerWidget {
  const DriversPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DriversResponse> driversProvider = ref.watch(getDrivers);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Drivers"),
      ),
      child: driversProvider.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (driversResponse) {
          final drivers = driversResponse.content;

          return SingleChildScrollView(
            child: Column(
              children: drivers
                  .map((driver) => TileDriver(
                        imgUrlDriver: driver.images[0].url,
                        nameDriver: driver.title,
                        imgUrlFlagCountry: driver.country.flag[0].url,
                        roleDriver: driver.type,
                        team: driver.team,
                        car: driver.car,
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
