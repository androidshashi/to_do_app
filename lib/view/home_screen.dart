import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/core/constants/app_strings.dart';
import 'package:to_do_app/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title:  Text(AppStrings.homeScreen), actions: [
        IconButton(onPressed: () {
          context.read<HomeViewModel>().logout(context);
        }, icon: const Icon(Icons.logout))
      ],),
      body: const Center(child: Text('home screen'),),
    );
  }
}
