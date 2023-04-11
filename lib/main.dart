import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mode.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'My App',
            theme: theme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        
          child: Container(
            
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          )
        ),
      

/////////////////////////////calling of the dark mode function



      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThemeCubit>().toggleTheme();
        },
        child: Icon(Icons.brightness_6),
      ),
    );
  }
}
