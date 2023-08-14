part of 'budget_cubit.dart';

@immutable
sealed class BudgetState {}

final class BudgetInitial extends BudgetState {}

final class BudgetFetching extends BudgetState {}

final class BudgetFetchingSuceess extends BudgetState {}

final class BudgetFetchingFailure extends BudgetState {}

final class BudgetCreationRequest extends BudgetState {}

final class BudgetCreationRequestSuccess extends BudgetState {}

final class BudgetCreationRequestFailure extends BudgetState {}

final class BudgetUpdateRequest extends BudgetState {}

final class BudgetUpdateRequestSuccess extends BudgetState {}

final class BudgetUpdateRequestFailure extends BudgetState {}

final class BudgetDeleteRequest extends BudgetState {}

final class BudgetDeleteRequestSuccess extends BudgetState {}

final class BudgetDeleteRequestFailure extends BudgetState {}
