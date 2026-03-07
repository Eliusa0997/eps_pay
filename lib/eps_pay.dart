// class EpsPay extends StatelessWidget {
//   final AppRouter appRouter;
//   const EpsPay({super.key, required this.appRouter});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),

//       onGenerateRoute: appRouter.generateRoute,
//       // home:  Navigator.pushNamed(context, Routes.homeDashboard),
//     );
//   }
// }

import 'package:eps_pay/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpsPay extends StatelessWidget {
  final AppRouter appRouter;
  const EpsPay({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'EpsPay',
          // You can use the library anywhere in the app even in theme
          onGenerateRoute: appRouter.generateRoute,
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
        );
      },
    );
  }
}
