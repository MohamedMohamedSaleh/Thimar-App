part of 'wallet_bloc.dart';

sealed class WalletEvents {}

class GetWalletEvent extends WalletEvents {}

class WalletChargeEvent extends WalletEvents {
  final String amount;

  WalletChargeEvent({required this.amount});
}

class GetWalletEventPaginated extends WalletEvents {
  final bool isLoadingPagination;

  GetWalletEventPaginated({this.isLoadingPagination = false});
}
