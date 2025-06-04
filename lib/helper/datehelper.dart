class DateHelper {
  static String getRelativeDate(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime inputDate = DateTime(date.year, date.month, date.day);

      if (inputDate == today) {
        return 'Today';
      } else if (inputDate == today.subtract(Duration(days: 1))) {
        return 'Yesterday';
      } else {
        return '${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}';
      }
    } catch (e) {
      return 'Invalid date';
    }
  }
}
