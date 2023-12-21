import 'package:flutter/material.dart';

import 'core/di/dependency_injection.dart';
import 'engas_task.dart';

void main() {
  DependencyInjection.init();
  runApp(const EngazTask());
}


