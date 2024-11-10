import 'package:canteen/core/provider/drawer_provider.dart';
import 'package:canteen/core/theme/theme_provider.dart';
import 'package:canteen/features/admin-side/pages/dashboard/presentation/provider/product_provider.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/add_edit_component_provider.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/product_provider.dart';
import 'package:canteen/features/auth/provider/auth_provider.dart';
import 'package:canteen/features/splash-screen/presentation/pages/splash_screen_page.dart';
import 'package:canteen/features/user-side/pages/order-product/provider/order_show_provider.dart';
import 'package:canteen/features/user-side/pages/user-home/provider/home_page_provider.dart';
import 'package:canteen/features/user-side/pages/user-product/provider/producr_list_categoory_provider.dart';
import 'package:canteen/features/user-side/pages/user-product/provider/product_details_provider.dart';
import 'package:canteen/features/user-side/provider/cart_provider.dart';
import 'package:canteen/features/user-side/provider/order_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:canteen/core/helper/dependencies.dart' as dep;
import 'package:google_fonts/google_fonts.dart';

import 'features/admin-side/pages/product/presentation/provider/product_list_provider.dart';
import 'features/admin-side/provider/order_product_show_provider_admin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DrawerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductListProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductListCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddAndEditComponentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderShowProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProductShowProviderAdmin(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: value.themeData,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
