import 'package:dealsdray/auth/auth_provider/auth_provider.dart';
import 'package:dealsdray/auth/login/login_phone_email.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    Future.microtask(() async {
      await authProvider.registerDeviceInfo(context).then((value) {
        Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPhoneEmail(),
              )),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/spashscreen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: null /* add child content here */,
      ),
    );
  }
}
