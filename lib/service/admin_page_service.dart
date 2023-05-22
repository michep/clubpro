import 'package:rxdart/rxdart.dart';

enum AdminPages {
  catalog,
  profile,
}

class AdminPageService {
  final BehaviorSubject<AdminPages?> _adminPagesController = BehaviorSubject();

  AdminPageService() {
    _adminPagesController.add(null);
  }

  AdminPages? get currentPage => _adminPagesController.value;
  Stream<AdminPages?> get adminPagesStream => _adminPagesController.stream;

  void setAdminPage(AdminPages page) {
    _adminPagesController.add(page);
  }
}
