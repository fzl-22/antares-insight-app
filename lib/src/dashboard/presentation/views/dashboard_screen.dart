import 'package:antares_insight_app/core/extensions/context_extension.dart';
import 'package:antares_insight_app/core/resources/colours.dart';
import 'package:antares_insight_app/core/resources/media.dart';
import 'package:antares_insight_app/core/resources/typographies.dart';
import 'package:antares_insight_app/src/dashboard/presentation/widgets/navigation_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  static const name = 'dashboard';
  static const path = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    _goToBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Colours.neutral300,
        selectedItemColor: context.colorScheme.primary,
        unselectedLabelStyle: Typographies.normal12,
        selectedLabelStyle: Typographies.semiBold12,
        items: const [
          BottomNavigationBarItem(
            activeIcon: NavigationBarIcon(
              Media.homeSolid,
              isActive: true,
            ),
            icon: NavigationBarIcon(
              Media.homeOutline,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            activeIcon: NavigationBarIcon(
              Media.processorSolid,
              isActive: true,
            ),
            icon: NavigationBarIcon(
              Media.processorOutline,
            ),
            label: 'Perangkat',
          ),
          BottomNavigationBarItem(
            activeIcon: NavigationBarIcon(
              Media.chatSolid,
              isActive: true,
            ),
            icon: NavigationBarIcon(
              Media.chatOutline,
            ),
            label: 'Layanan',
          ),
          BottomNavigationBarItem(
            activeIcon: NavigationBarIcon(
              Media.settingSolid,
              isActive: true,
            ),
            icon: NavigationBarIcon(
              Media.settingOutline,
            ),
            label: 'Pengaturann',
          ),
        ],
      ),
    );
  }
}
