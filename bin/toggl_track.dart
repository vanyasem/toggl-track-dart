import 'dart:io';

import 'package:toggl_track/date_utils.dart';
import 'package:toggl_track/env_loader.dart';
import 'package:toggl_track/toggl_client.dart';

Future<void> main(List<String> arguments) async {
  if (arguments.isEmpty) {
    print('Usage: toggl_track <month> [year]');
    print('Example: toggl_track 4');
    print('Example: toggl_track 4 2025');
    exit(1);
  }

  final month = int.tryParse(arguments.first);
  if (month == null || month < 1 || month > 12) {
    print('Error: month must be a number between 1 and 12');
    exit(1);
  }

  int? year;
  if (arguments.length > 1) {
    year = int.tryParse(arguments[1]);
    if (year == null) {
      print('Error: year must be a valid number');
      exit(1);
    }
  }

  final config = EnvConfig.load();
  final dateRange = getMonthDateRange(month, year);
  final client = TogglClient(
    username: config.username,
    password: config.password,
  );

  print('Fetching data for ${dateRange.startDate} to ${dateRange.endDate}');
  print('');

  try {
    for (final workspaceId in config.workspaceIds) {
      print('--- Workspace: $workspaceId ---');
      final json = await client.fetchProjectSummary(
        workspaceId: workspaceId,
        startDate: dateRange.startDate,
        endDate: dateRange.endDate,
      );
      print(json);
      print('');
    }
  } finally {
    client.close();
  }
}
