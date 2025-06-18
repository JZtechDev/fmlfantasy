String formatCompetitionName(String? name) {
  if (name == null || name.trim().isEmpty) return '';
  final words = name.split(' ').where((w) => w.isNotEmpty).toList();
  if (words.length == 1) {
    return words.first;
  } else {
    return words.map((word) => word[0].toUpperCase()).join();
  }
}
