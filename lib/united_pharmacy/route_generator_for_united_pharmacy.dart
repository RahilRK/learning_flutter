import 'package:flutter/material.dart';
import 'package:learning_flutter/main.dart';
import 'package:learning_flutter/united_pharmacy/model/request/RegistrationRequest.dart';
import 'package:learning_flutter/united_pharmacy/verification/verification.dart';
import 'package:learning_flutter/united_pharmacy/login/login_tab.dart';
import 'package:learning_flutter/united_pharmacy/registration/registration.dart';
import 'package:learning_flutter/united_pharmacy/splash_screen/SplashScreen.dart';
import 'package:learning_flutter/united_pharmacy/dashboard/DashboardTab.dart';

class RouteGeneratorForUnitedPharmacy {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (_) => SplashScreen());
      return MaterialPageRoute(builder: (_) => DashboardTab());
      case '/LoginTab':
        return MaterialPageRoute(builder: (_) => LoginTab());
      case '/Registration':
        return MaterialPageRoute(builder: (_) => Registration());
      case '/Verification':
        if (args is RegistrationRequest) {
          return MaterialPageRoute(
            builder: (_) => Verification(
              registrationRequest: args,
            ),
          );
        }
        return _errorRoute();
      case '/DashboardTab':
        return MaterialPageRoute(builder: (_) => DashboardTab());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
