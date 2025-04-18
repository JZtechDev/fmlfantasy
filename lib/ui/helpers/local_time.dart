import 'package:intl/intl.dart';

String formatEndDateTime(DateTime endDate) {
  final DateTime now = DateTime.now().toLocal();
  if (endDate.isBefore(now)) {
    return 'Ended';
  }
  return DateFormat('dd MMM yyyy, hh:mm a').format(endDate);
}
