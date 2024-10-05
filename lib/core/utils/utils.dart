import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../network/http.dart';

class Utils {
  static String? requestTypeToString(RequestMethod requestType) {
    String? type = '';
    switch (requestType) {
      case RequestMethod.get:
        {
          type = 'GET';
        }
        break;
      case RequestMethod.post:
        {
          type = 'POST';
        }
        break;
      case RequestMethod.delete:
        {
          type = 'DELETE';
        }
        break;
      case RequestMethod.patch:
        {
          type = 'PATCH';
        }
        break;
      case RequestMethod.put:
        {
          type = 'PUT';
        }
        break;
    }
    return type;
  }

   static Future<File> pickImage() async {
    File file = File('');
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    }
    return file;
  }
}
