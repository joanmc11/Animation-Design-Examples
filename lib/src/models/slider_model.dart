


import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {

  double _currentpage = 0;
  

  double get currentPage => _currentpage;

  set currentPage( double currentPage){
    _currentpage = currentPage;
    notifyListeners();
  }

}