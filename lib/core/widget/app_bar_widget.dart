import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme.dart';
import '../theme/theme_provider.dart';
import 'big_text.dart';

class AppBarWidget extends StatelessWidget {
  final Color? bgColor;

  final String title;

  const AppBarWidget({
    super.key,
    this.bgColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BigText(
        text: title,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        IconButton(
          onPressed: () {
            final themeProvider =
                Provider.of<ThemeProvider>(context, listen: false);
            themeProvider.toggleTheme(true);
          },
          icon: Consumer<ThemeProvider>(
            builder: (_, value, __) {
              return Icon(
                value.themeData == AppTheme.darkThemeMode
                    ? Icons.brightness_7
                    : Icons.brightness_4,
              );
            },
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
