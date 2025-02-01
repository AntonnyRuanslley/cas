import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SuggestionService extends GetxService {
  List<String> _suggestionsTitle = [];

  List<String> get suggestionsTitle => _suggestionsTitle;

  Future<SuggestionService> init() async {
    getSuggestionsTitle();
    return this;
  }

  void getSuggestionsTitle() {
    final categoriesBox = Hive.box('transactions');
    categoriesBox.keys.map((key) {
      final value = categoriesBox.get(key);
      _suggestionsTitle.add(value["description"]);
    }).toList();
  }
}
