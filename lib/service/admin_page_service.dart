import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:rxdart/rxdart.dart';

enum AdminPages {
  catalog,
  profile,
  addcatalog,
}

class AdminPageService {
  final BehaviorSubject<AdminPages?> _adminPagesController = BehaviorSubject();

  AdminPageService() {
    _adminPagesController.add(null);
  }

  AdminPages? get currentPage => _adminPagesController.value;
  Stream<AdminPages?> get adminPagesStream => _adminPagesController.stream;
  CatalogFolder? _folder;
  CatalogFolder? get parentFolder => _folder;


  void setAdminPage(AdminPages page) {
    _adminPagesController.add(page);
  }

  void setParentFolder(CatalogFolder? newfolder) {
    _folder = newfolder;
  }
}
