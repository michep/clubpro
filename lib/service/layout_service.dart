import 'package:rxdart/rxdart.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutService {
  final BehaviorSubject<DeviceScreenType?> _sizingUpdateController = BehaviorSubject();

  LayoutService() {
    _sizingUpdateController.add(null);
  }

  DeviceScreenType? get currentSizing => _sizingUpdateController.value;
  Stream<DeviceScreenType?> get sizingStream => _sizingUpdateController.stream;

  void setSizing(DeviceScreenType? sizing) {
    if (currentSizing != sizing) {
      _sizingUpdateController.add(sizing);
    }
  }
}
