import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:movil_wrc_app/responseTypes/drivers_response.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

final getDrivers = FutureProvider.autoDispose<DriversResponse>((ref) async {
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get(
      'https://api.wrc.com/content/driver?class=WRC',
    );

    final responseData = response.data;
    final drivers = DriversResponse.fromJson(responseData);

    return drivers;
  } catch (error) {
    throw Exception('error del calendar: $error');
  }
});
