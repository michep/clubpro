import 'package:clubpro/models/catalog/catalog_folder.dart';
import 'package:rxdart/rxdart.dart';

class CatalogFolderService {
  final BehaviorSubject<CatalogFolder?> _catalogFolderController = BehaviorSubject();
  final List<CatalogFolder?> _stack = [null];

  CatalogFolderService() {
    _catalogFolderController.add(null);
  }

  CatalogFolder? get currentFolder => _catalogFolderController.value;
  Stream<CatalogFolder?> get currentFolderStream => _catalogFolderController.stream;

  void setCatalogFolder(CatalogFolder? folder) {
    _stack.add(folder);
    _catalogFolderController.add(folder);
  }

  void back() {
    if (_stack.length > 1) {
      _stack.removeLast();
      _catalogFolderController.add(_stack.last);
    }
  }
}
