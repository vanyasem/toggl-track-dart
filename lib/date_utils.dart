({String startDate, String endDate}) getMonthDateRange(int month, [int? year]) {
  year ??= DateTime.now().year;
  if (month < 1 || month > 12) {
    throw ArgumentError('Month must be between 1 and 12, got $month');
  }

  final start = DateTime(year, month);
  final end = DateTime(year, month + 1, 0);

  String fmt(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  return (startDate: fmt(start), endDate: fmt(end));
}
