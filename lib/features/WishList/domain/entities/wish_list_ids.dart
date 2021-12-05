import 'package:equatable/equatable.dart';

class WishListIds extends Equatable {
  const WishListIds(this.ids);

  final List<String> ids;

  @override
  List<Object?> get props => [ids, ids.length];
}
