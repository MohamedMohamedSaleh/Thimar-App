part of 'suggestions_bloc.dart';

abstract class SuggestionsStates {}

final class SuggestionsInitial extends SuggestionsStates {}

final class SentSuggestionsSuccess extends SuggestionsStates {} 
final class SentSuggestionsLoading extends SuggestionsStates {} 
final class SentSuggestionsFailed extends SuggestionsStates {}
