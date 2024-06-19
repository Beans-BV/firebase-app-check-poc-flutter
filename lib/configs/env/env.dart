// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  String get baseApiUrl => dotenv.env['BASE_API_URL'] ?? '';
}
