import 'dart:ffi';

class Pass{
  String name;
  String  description;
  String ingredients;
  String size1;
  String price1;
  String size2;
  String price2;
  String image;
  String collection;
  List items;
  String name_ar;
  String description_ar;
  List ingredients_ar;
  Pass({required this.name,
    required this.description,required this.ingredients,
    required this.size1,required this.price1,required this.size2,required this.price2,required this.image,
   required this.collection,required this.items,required this.name_ar,required this.description_ar,required this.ingredients_ar
  });
}