
import 'package:intl/intl.dart';

final df = DateFormat('dd MMM');
extension ToDateFormat on String {
  
  String toFormatDate() => df.format(DateTime.parse(this));

}