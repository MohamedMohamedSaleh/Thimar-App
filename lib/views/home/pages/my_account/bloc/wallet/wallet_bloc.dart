import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/core/logic/helper_methods.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/wallet/wallet_model.dart';

import 'wallet_paginated_model.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvents, WalletState> {
  WalletBloc() : super(WalletInitial()) {
    on<GetWalletEvent>(_getWallet);
    on<GetWalletEventPaginated>(_getWalletPaginater);
    on<WalletChargeEvent>(_walletCharge);
  }

  bool isLoading = true;
  List<Data> list = [];
  String wallet = "";
  List<Model> listPaginated = [];
  int pageNumber = 1;
  Future<void> _getWallet(
      GetWalletEvent event, Emitter<WalletState> emit) async {
    if (isLoading) {
      emit(GetWalletLoading());
    }
    final response = await DioHelper().getData(endPoint: "wallet");

    if (response.isSuccess) {
      final model = WalletData.fromJson(response.response!.data);
      list = model.data;
      wallet = model.wallet.toStringAsFixed(2);
      isLoading = false;
      emit(GetWalletSuccess());
    } else {
      emit(GetWalletFailed());
      showMessage(message: response.message);
    }
  }

  Future<void> _getWalletPaginater(
      GetWalletEventPaginated event, Emitter<WalletState> emit) async {
    if (event.isLoadingPagination) {
      emit(GetWalletFromPaginationLoadingState());
    } else {
      emit(GetWalletPaginatedLoading());
    }
    final response = await DioHelper()
        .getData(endPoint: "wallet/get_wallet_transactions?page=$pageNumber");

    if (response.isSuccess) {
      final model = WalletPaginatedData.fromJson(response.response!.data);
      if (model.list.isNotEmpty) {
        listPaginated.addAll(model.list);
        pageNumber++;
      } else {
        showMessage(
            message: "Not Found Transactions", type: MessageType.success);
      }
      emit(GetWalletPaginatedSuccess());
    } else {
      emit(GetWalletPaginatedFailed());
      showMessage(message: response.message);
    }
  }

  Future<void> _walletCharge(
      WalletChargeEvent event, Emitter<WalletState> emit) async {
    emit(WalletChargeLoading());
    final response =
        await DioHelper().sendData(endPoint: 'wallet/charge', data: {
      "amount": event.amount,
      "transaction_id": '1111',
    });

    if (response.isSuccess) {
      emit(WalletChargeSuccess());
      add(GetWalletEvent());
      Navigator.pop(navigatorKey.currentContext!);
      showMessage(message: response.message, type: MessageType.success);
    } else {
      emit(WalletChargeFailed());
      showMessage(message: response.message);
    }
  }
}
