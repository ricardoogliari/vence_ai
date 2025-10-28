import 'package:geolocator/geolocator.dart';
import 'package:vence_ai/utils/result.dart';

class LocationRepositoryImpl implements LocationRepository {
  LocationRepositoryImpl();

  @override
  Future<Result<Position>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Result.error(Exception('Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Result.error(Exception('Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Result.error(
        Exception(
          'Location permissions are permanently denied, we cannot request permissions.',
        ),
      );
    }

    Position position = await Geolocator.getCurrentPosition();
    return Result.ok(position);
  }
}

abstract class LocationRepository {
  Future<Result<Position>> determinePosition();
}
