import 'dart:convert';

import 'package:http/http.dart' as http;

class TogglClient {
  final String _authHeader;
  final http.Client _client;

  TogglClient({required String username, required String password})
      : _authHeader =
            'Basic ${base64Encode(utf8.encode('$username:$password'))}',
        _client = http.Client();

  Future<List<Map<String, dynamic>>> fetchProjectSummary({
    required String workspaceId,
    required String startDate,
    required String endDate,
  }) async {
    final url = Uri.https(
      'api.track.toggl.com',
      '/reports/api/v3/workspace/$workspaceId/projects/summary',
    );

    final response = await _client.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': _authHeader,
      },
      body: jsonEncode({
        'start_date': startDate,
        'end_date': endDate,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception(
        'Toggl API error for workspace $workspaceId: '
        '${response.statusCode} ${response.body}',
      );
    }

    return (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
  }

  void close() => _client.close();
}
