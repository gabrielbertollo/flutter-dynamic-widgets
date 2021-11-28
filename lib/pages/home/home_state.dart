import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class HomeState extends ChangeNotifier {
  Map<String, dynamic> jsonData = {};
  JsonWidgetRegistry? registry;
  JsonWidgetData? data;
  
  final loadingListenable = ValueNotifier<bool>(true);

  HomeState() {
    _loadJsonPage();
  }

  bool get loading => loadingListenable.value;

  Future<void> _loadJsonPage() async {
    var pageStr = await rootBundle.loadString('assets/pages/card_page.json');
    jsonData = json.decode(pageStr);
    _setPageData();
    loadingListenable.value = false;
  }

  void _setPageData() {
    data = JsonWidgetData.fromDynamic(
      jsonData,
      registry: registry,
    );
  }
}
