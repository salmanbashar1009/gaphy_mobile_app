import 'package:flutter/material.dart';
import 'package:gaphy_mobile_app/my_app.dart';
import 'package:gaphy_mobile_app/presentation/features/login/view_model/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (context) =>  LoginProvider(),
        )
      ],
      child: const MyApp()));
}

