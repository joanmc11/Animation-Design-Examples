


import 'package:flutter/material.dart';

import '../pages/slide_show_page.dart';

class LayoutModel with ChangeNotifier{
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentpage(Widget page){
    _currentPage = page;
    notifyListeners();
  }

}