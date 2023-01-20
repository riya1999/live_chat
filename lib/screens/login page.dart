import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../allConstants/app_constants.dart';
import '../allConstants/color_constants.dart';
import '../allConstants/size_contents.dart';
import '../allWidgets/loading_view.dart';
import '../providers/auth_provider.dart';
import 'home page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppConstants.loginTitle,
            style: TextStyle(color: ColorConstants.primaryColor),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.dimen_30,
                horizontal: Sizes.dimen_20,
              ),
              children: [
                vertical50,
                const Text(
                  'Welcome to Chat App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Sizes.dimen_26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                vertical30,
                const Text(
                  'Login to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Sizes.dimen_22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                vertical50,
                Center(child: Image.asset('assets/images/back.png')),
                vertical50,
                GestureDetector(
                  onTap: () async {
                  authProvider.handleSignIn().then((isSuccess) {
                  if (isSuccess) {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage(),),
                   );
                  }
                  },
                  ).catchError((error, stackTrace) {
                  Fluttertoast.showToast(msg: error.toString());
                  authProvider.handleException();
                  });
                },
                  child: Image.asset('assets/images/google_login.jpeg'),
                ),
              ],
            ),
            Positioned(
              child: authProvider.status == Status.authenticating
                  ? LoadingView()
                  : SizedBox.shrink(),
            ),
          ],
        ));
  }
}
