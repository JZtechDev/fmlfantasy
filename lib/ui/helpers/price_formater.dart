import 'package:intl/intl.dart';

String formatPrice(String price) {
  final formatter = NumberFormat('#,###');
  return formatter.format(num.parse(price));
}
