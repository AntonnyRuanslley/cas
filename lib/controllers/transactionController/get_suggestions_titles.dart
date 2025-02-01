part of 'transaction_controller.dart';

List<String> implementGetSuggestionsTitles({
  required String text,
}) {
  if (text.isEmpty) {
    return [];
  }

  final suggestions = <String>[];

  Get.find<SuggestionService>().suggestionsTitle.forEach((suggestion) {
    if (suggestions.length > 2) {
      return;
    }
    if (suggestion.toLowerCase().contains(text.toLowerCase())) {
      suggestions.add(suggestion);
    }
  });
  return suggestions;
}
