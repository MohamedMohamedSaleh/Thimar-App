import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegetable_orders_project/core/logic/dio_helper.dart';
import 'package:vegetable_orders_project/views/home/pages/my_account/bloc/questions/model.dart';

part 'questions_event.dart';
part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvents, QuestionsStates> {
  QuestionsBloc() : super(QuestionsInitial()) {
    on<GetQuestionsEvent>(_getQuestions);
  }
  List<QuestionModel> list = [];

  Future<void> _getQuestions(
      GetQuestionsEvent event, Emitter<QuestionsStates> emit) async {
    emit(GetQuestionsLoading());
    final response = await DioHelper().getData(endPoint: '/faqs');
    if (response.isSuccess) {
      list = QuestionsData.fromJson(response.response!.data).data;
      emit(GetQuestionsSuccess());
    } else {
      emit(GetQuestionsFailed());
    }
  }
}
