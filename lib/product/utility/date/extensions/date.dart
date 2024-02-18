extension type FiDate(DateTime date) implements DateTime {
  String get formattedDate {
    return '${date.day}/${date.month}/${date.year}';
  }

  String get readableDate {
    return '${date.day} ${date.month} ${date.year}';
  }

  String get readableTime {
    return '${date.hour}:${date.minute}';
  }
}
