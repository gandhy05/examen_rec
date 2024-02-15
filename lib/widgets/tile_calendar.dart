import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TileCalendar extends ConsumerWidget {
  const TileCalendar({
    Key? key,
    required this.imgUrlLocation,
    required this.imgUrlFlagCountry,
    required this.nameRally,
    required this.nameCountry,
    required this.startDate,
    required this.endDate,
    required this.id,
  }) : super(key: key);

  final String imgUrlLocation;
  final String imgUrlFlagCountry;
  final String nameRally;
  final String nameCountry;
  final int startDate;
  final int endDate;
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const textStyle = TextStyle(color: Color.fromARGB(255, 1, 1, 1));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 250, 250, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            if (imgUrlLocation.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imgUrlLocation,
                  height: 165,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (imgUrlFlagCountry.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imgUrlFlagCountry,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameRally,
                        style: textStyle,
                      ),
                      Text(
                        nameCountry,
                        style: textStyle,
                      ),
                      Text(
                        DateTime.fromMillisecondsSinceEpoch(startDate)
                            .toString(),
                        style: textStyle,
                      ),
                      Text(
                        DateTime.fromMillisecondsSinceEpoch(endDate).toString(),
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
