part of 'policy_bloc.dart';

abstract class PolicyStates {}

final class PolicyInitial extends PolicyStates {}

final class GetPolicySuccess extends PolicyStates {
  final PolicyModel model;

  GetPolicySuccess({required this.model});
}

final class GetPolicyLoading extends PolicyStates {}

final class GetPolicyFailed extends PolicyStates {}

final class AboutSuccessState extends PolicyStates {
  final AboutModel model;

  AboutSuccessState({required this.model});
}

final class AboutLoadingState extends PolicyStates {}

final class AboutFailedState extends PolicyStates {}
