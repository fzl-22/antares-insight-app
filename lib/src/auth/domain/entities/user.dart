import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.createdAt,
    required this.updatedAt,
  });
  
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [id, email];
}
