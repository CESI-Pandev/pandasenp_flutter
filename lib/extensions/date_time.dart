extension ToEuropeanDateTime on DateTime {
  String toEuropeanDateTime() {
    return "$day/$month/$year $hour:$minute";
  }
}