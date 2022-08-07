import 'package:fahrenheit/classs/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier{
  List<Items> _items=[];
  double price=0;
  void add(Items items){
    _items.add(items);
    price  +=items.price;
    notifyListeners();
  }
  void remove(Items items){
    _items.remove(items);
    price  -=items.price;
    notifyListeners();
  }
  int get count{
    return _items.length;
  }
  double get totalprice{
    return price;
  }
  List<Items> get basketitems{
    return _items;
  }
}