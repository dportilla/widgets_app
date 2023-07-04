import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'ThemeChanger';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
            IconButton(
              icon: isDarkMode
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              },
            )
          ],
      ),
      body: const _ThemeChangerView()
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colorList = ref.watch(colorListProvider);
    final int currentColor = ref.watch(currentColorProvider);

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final color = colorList[index];
      
      return RadioListTile(
        title: Text('Color', style: TextStyle(color: color)),
        subtitle: Text('${ color.value }'),
        activeColor: color,
        value: index, 
        groupValue: currentColor, 
        onChanged: (value) {
          ref.read(currentColorProvider.notifier).state = index;
        },
      );
    },);
  }
}