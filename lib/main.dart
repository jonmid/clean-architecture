import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture/injection.dart';
import 'package:clean_architecture/presentation/bloc/product_bloc.dart';
import 'package:clean_architecture/presentation/bloc/product_event.dart';
import 'package:clean_architecture/presentation/pages/product_list_page.dart';

void main() {
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: BlocProvider(
        create: (context) => getIt<ProductBloc>()..add(LoadProducts()),
        child: const ProductListPage(),
      ),
    );
  }
}
