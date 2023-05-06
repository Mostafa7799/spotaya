import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String title, imageUrl;
  const Place({required this.title, required this.imageUrl});

  @override
  List<Object> get props => [title, imageUrl];
}
