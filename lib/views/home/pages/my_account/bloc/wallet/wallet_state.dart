part of 'wallet_bloc.dart';

sealed class WalletState {}

final class WalletInitial extends WalletState {}

/////////////////////////////////
final class GetWalletLoading extends WalletState {}

final class GetWalletFailed extends WalletState {}

final class GetWalletSuccess extends WalletState {}

////////////////////////////////
final class GetWalletPaginatedLoading extends WalletState {}

final class GetWalletPaginatedFailed extends WalletState {}

final class GetWalletPaginatedSuccess extends WalletState {}
///////////////////////////////
final class WalletChargeLoading extends WalletState {}

final class WalletChargeFailed extends WalletState {}

final class WalletChargeSuccess extends WalletState {}
///////////////////////////////

final class GetWalletFromPaginationLoadingState extends WalletState{}
final class GetWalletFromPaginationFailedState extends WalletState{}
