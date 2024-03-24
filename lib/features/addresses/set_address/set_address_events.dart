part of 'set_address_bloc.dart';

class SetUpdateAddressEvents {}

class SetAddressEvent extends SetUpdateAddressEvents {
  final String descripion;
  final String phone;

  final String type;
  final String isDefault;

  SetAddressEvent({
    required this.isDefault,
    required this.descripion,
    required this.phone,

    required this.type,
  });
}

class UpdateAddressEvent extends SetUpdateAddressEvents {
  final String descripion;
  final String phone;
  final String type;
  final String isDefault;
  final int id;
  UpdateAddressEvent({
    required this.isDefault,
    required this.id,
    required this.descripion,
    required this.phone,
    required this.type,
  });
}
