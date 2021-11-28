import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/full_widget_component.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeState state = HomeState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: state.loadingListenable,
      builder: (context, bool loading, child) {
        if (loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return FullWidgetComponent(data: state.data!);
      },
    );
  }
}
