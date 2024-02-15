import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movil_wrc_app/providers/calendar_provider.dart';
import 'package:movil_wrc_app/responseTypes/calendar_response.dart';
import 'package:movil_wrc_app/widgets/tile_calendar.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<CalendarResponse> calendarProvider =
        ref.watch(getCalendar);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Calendar"),
      ),
      child: calendarProvider.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (calendarResponse) {
          final events = calendarResponse.content;

          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: events
                      .map<Widget>((event) => TileCalendar(
                            imgUrlLocation: event.images.isNotEmpty
                                ? event.images[0].url
                                : '',
                            nameRally: event.rallyId,
                            nameCountry: event.country.name,
                            startDate: event.startDate,
                            endDate: event.endDate,
                            id: '',
                            imgUrlFlagCountry: event.country.flag[0].url,
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
