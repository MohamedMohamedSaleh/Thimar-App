class UpdateAmountStates {}

class AddOneSuccessState extends UpdateAmountStates {
  final int id;

  AddOneSuccessState({required this.id});
}

class MinusOneSuccessState extends UpdateAmountStates {
  final int id;

  MinusOneSuccessState({required this.id});

}

class UpdateAmountSuccessState extends UpdateAmountStates {}

class UpdateAmountFailedState extends UpdateAmountStates {}

class UpdateAmountLoadingState extends UpdateAmountStates {}
