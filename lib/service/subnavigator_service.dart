import 'package:rxdart/rxdart.dart';

enum AppPages {
  admincatalog,
  adminprofile,
  adminaddcatalogfolder,
  admineditcatalogfolder,
  ;
}

class SubNavigatorValue<T> {
  final AppPages page;
  final T? value;
  final bool forceRefresh;

  SubNavigatorValue({
    required this.page,
    this.value,
    this.forceRefresh = false,
  });
}

class SubNavigatorService {
  final BehaviorSubject<SubNavigatorValue?> _subnavController = BehaviorSubject();

  final List<SubNavigatorValue?> _stack = [];

  SubNavigatorValue? get currentSubnav => _subnavController.value;
  Stream<SubNavigatorValue?> get subnavStream => _subnavController.stream;

  SubNavigatorService();

  void push(SubNavigatorValue value) {
    _stack.add(value);
    _subnavController.add(value);
  }

  void pushFirst(SubNavigatorValue value) {
    _stack.clear();
    _stack.add(value);
    _subnavController.add(value);
  }

  void pop() {
    if (_stack.isNotEmpty) _stack.removeLast();
    _subnavController.add(_stack.isNotEmpty ? _stack.last : null);
  }
}
