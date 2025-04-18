String getInitials(String name) {
  if (name.isEmpty) {
    return '';
  } else {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return nameParts[0][0] + nameParts[1][0];
    } else if (nameParts.isNotEmpty) {
      return nameParts.toString().substring(1, 3).toUpperCase();
    } else {
      return '';
    }
  }
}
