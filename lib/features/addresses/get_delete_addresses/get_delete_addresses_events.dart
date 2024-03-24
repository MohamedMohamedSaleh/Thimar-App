part of 'get_delete_addresses_bloc.dart';

class GetDeleteAddressesEvents {}

class GetAddressesEvent extends GetDeleteAddressesEvents {
  final bool isLoading;

  GetAddressesEvent({required this.isLoading});
}

class DeleteAddressesEvent extends GetDeleteAddressesEvents {
  final int id;

  DeleteAddressesEvent({required this.id});
}
