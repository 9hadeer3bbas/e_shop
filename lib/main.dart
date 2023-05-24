import 'package:flutter/material.dart';

import 'core/services/services.dart';
import 'main_app.dart';

//main
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialService();
  return runApp(const MainApp());
}
