part of 'questions_bloc.dart';

abstract class QuestionsStates {}

final class QuestionsInitial extends QuestionsStates {}

final class GetQuestionsLoading extends QuestionsStates {}

final class GetQuestionsSuccess extends QuestionsStates {}

final class GetQuestionsFailed extends QuestionsStates {}
