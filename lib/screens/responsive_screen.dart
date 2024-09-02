import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../core/responsive.dart';
import 'drawer_screen/drawer_screens.dart';
import 'drawer_screen/drawer_widget/drawer_side_menu.dart';

class ResponsivePage extends StatelessWidget {
  final int? index;
  const ResponsivePage({super.key, this.index });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc()..add(DoSelectDrawerEvent(index??0)),
        ),
      ],
      child: const ResponsiveDrawer(),
    );
  }
}

class ResponsiveDrawer extends StatefulWidget {
  const ResponsiveDrawer({super.key});

  @override
  State<ResponsiveDrawer> createState() => _ResponsiveDrawerState();
}

class _ResponsiveDrawerState extends State<ResponsiveDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Responsive(
              mobile: Container(),
              tablet: Container(),
              desktop: Row(
                children: <Widget>[
                  const DrawerSideMenu(),
                  Expanded(
                    child: DrawerPage(selectedIndex: 3),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
