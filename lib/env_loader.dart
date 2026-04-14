import 'dart:io';

class EnvConfig {
  final String username;
  final String password;
  final List<String> workspaceIds;
  final String userId;

  EnvConfig._({
    required this.username,
    required this.password,
    required this.workspaceIds,
    required this.userId,
  });

  static EnvConfig load([String path = '.env']) {
    final file = File(path);
    if (!file.existsSync()) {
      throw Exception('.env file not found at $path');
    }

    final map = <String, String>{};
    for (final line in file.readAsLinesSync()) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) continue;
      final idx = trimmed.indexOf('=');
      if (idx == -1) continue;
      map[trimmed.substring(0, idx)] = trimmed.substring(idx + 1);
    }

    return EnvConfig._(
      username: map['TOGGLUSERNAME'] ??
          (throw Exception('TOGGLUSERNAME not set in .env')),
      password: map['TOGGLPASSWORD'] ??
          (throw Exception('TOGGLPASSWORD not set in .env')),
      workspaceIds: (map['WORKSPACES'] ??
              (throw Exception('WORKSPACES not set in .env')))
          .split(',')
          .map((s) => s.trim())
          .toList(),
      userId:
          map['USER_ID'] ?? (throw Exception('USER_ID not set in .env')),
    );
  }
}
