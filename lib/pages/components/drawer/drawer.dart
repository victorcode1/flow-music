import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text('Drawer Header')),
          ListTile(
            style: ListTileStyle.drawer,
            leading: const Icon(Icons.radio),
            title: const Text('Rado'),
            onTap: () {
              if (context.canPop()) context.pop();
              context.go('/radio');
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
