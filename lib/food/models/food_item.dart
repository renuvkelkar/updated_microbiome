import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  const FoodItem({
     this.name,
     this.imgUrl,
     this.cal,
  });

  final String name;
  final String imgUrl;
  final int cal;

  @override
  List<Object> get props => [name, imgUrl, cal];
}
