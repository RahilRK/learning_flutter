import 'package:flutter/material.dart';
import 'package:learning_flutter/united_pharmacy/dashboard_tab/DashboardTab.dart';
import 'package:learning_flutter/united_pharmacy/home/Home.dart';
import 'package:learning_flutter/united_pharmacy/model/request/RegistrationRequest.dart';
import 'package:learning_flutter/united_pharmacy/verification/verification.dart';
import 'package:learning_flutter/united_pharmacy/login/login_tab.dart';
import 'package:learning_flutter/united_pharmacy/registration/registration.dart';

class RouteGeneratorForUnitedPharmacy {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (_) => SplashScreen());
        return MaterialPageRoute(builder: (_) => const DashboardTab());
      case '/LoginTab':
        return MaterialPageRoute(builder: (_) => const LoginTab());
      case '/Registration':
        return MaterialPageRoute(builder: (_) => const Registration());
      case '/Verification':
        if (args is RegistrationRequest) {
          return MaterialPageRoute(
            builder: (_) => Verification(
              registrationRequest: args,
            ),
          );
        }
        return _errorRoute();
      case '/Home':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/DashboardTab':
        return MaterialPageRoute(builder: (_) => const DashboardTab());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
