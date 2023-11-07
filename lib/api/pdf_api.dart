import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

class PDFApi {
  static Future<File> loadNetwork(String url) async {
    Map<String, String> headers = {
      "Content-Type": 'application/json',
      'correlationId': '65b245b8-4732-4b9b-8206-41269d62d6b2',
      'destination': 'MOM',
      'operation': 'firstPaymentReceiptDownload',
      'source': 'Selfcare',
      'srDate': '2023-10-31 11:51:35',
      'x-lang': 'en_us',
      'token':
      'eyJhbGciOiJIUzUxMiJ9.eyJ0ZW5hbnRUeXBlIjoiY2xpZW50IiwidGVuYW5jeUlkIjoiTVZOT19DU01BUlRHQV9CQU4iLCJsb2dpblVzZXJuYW1lIjoiQWRkUGxhbkludjc2MDciLCJsb2dpblR5cGUiOiJ1c2VybmFtZSIsImFwcElkIjoiMzljZGE5MDctNmEzMy0zNmZhLWE1MTEtNmI2Y2M3MTAyYzg4IiwiYWNjb3VudE5vIjoiMDFDMTM3NDQyIiwidG9rZW5UeXBlIjoidXNlclRva2VuIiwiZW1haWwiOiJhQGdtYWlsLmNvbSIsImlhdCI6MTY5ODkyNjM1OSwiZXhwIjoxNjk4OTM3MTU5fQ.T2igiNjzTWhk8dCv_dQIz72qvPJe2FXJA9FiqohJVpvJi8m8fa_NH8nbMCjuQ6KSlJJ62feoO5KQOp8832E2aQ',
    };
    final response = await http.get(Uri.parse(url),headers: headers);
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
