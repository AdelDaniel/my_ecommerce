import 'package:intl/intl.dart';

class DateConverter {
  const DateConverter();
  String getTime(DateTime dateTime) {
    return DateFormat('hh:mm aaa').format(dateTime);
  }

  String getDay(DateTime dateTime) {
    return DateFormat('EEE').format(dateTime);
  }

  String _getDateHistory(DateTime dateTime) {
    return DateFormat('dd/ MMM/ yyyy').format(dateTime);
  }

  String timeAgoSinceDate(DateTime dateTime, {bool numericDates = true}) {
    final nowDateTime = DateTime.now();
    final difference = nowDateTime.difference(dateTime);

    if (difference.inDays > 8) {
      return _getDateHistory(dateTime);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
