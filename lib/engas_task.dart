import 'package:engas_task/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/routes.dart';

class EngazTask extends StatelessWidget {
  const EngazTask({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade200,
          useMaterial3: true,
        ),
        initialRoute: Routes.loginScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}