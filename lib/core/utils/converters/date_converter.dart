class DateToStringConverter {
  static String convert(DateTime date) {
    var dateSplitted = date.toString().split(' ');
    print(dateSplitted.first);
    return dateSplitted.first;
  }
}
