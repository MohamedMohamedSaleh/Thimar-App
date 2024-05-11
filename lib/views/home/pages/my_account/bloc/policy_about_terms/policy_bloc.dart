import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/policy_about_terms/model.dart';

import '../../../../../../core/logic/dio_helper.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvents, PolicyStates> {
  PolicyBloc() : super(PolicyInitial()) {
    on<GetPolicyEvent>(_getPolicy);
    on<GetAboutEvent>(_about);
    on<GetTermsEvent>(_terms);
  }

  Future<void> _getPolicy(
      GetPolicyEvent event, Emitter<PolicyStates> emit) async {
    emit(GetPolicyLoading());
    final response = await DioHelper().getData(endPoint: '/policy');
    if (response.isSuccess) {
      final model = PolicyData.fromJson(response.response!.data).data;
      emit(GetPolicySuccess(model: model));
    } else {
      emit(GetPolicyFailed());
    }
  }

  Future<void> _about(GetAboutEvent event, Emitter<PolicyStates> emit) async {
    emit(AboutLoadingState());
    final response = await DioHelper().getData(endPoint: '/about');
    if (response.isSuccess) {
      final model = AboutData.fromJson(response.response!.data).data;
      emit(AboutSuccessState(model: model));
    } else {
      emit(AboutFailedState());
    }
  }

  Future<void> _terms(GetTermsEvent event, Emitter<PolicyStates> emit) async {
    emit(TermsLoadingState());
    final response = await DioHelper().getData(endPoint: '/terms');
    if (response.isSuccess) {
      final model = TermsData.fromJson(response.response!.data).data;
      emit(TermsSuccessState(model: model));
    } else {
      emit(TermsFailedState());
    }
  }
}
