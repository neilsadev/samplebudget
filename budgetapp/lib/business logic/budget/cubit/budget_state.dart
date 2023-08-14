part of 'budget_cubit.dart';

@immutable
sealed class BudgetState {}

final class BudgetInitial extends BudgetState {}

final class BudgetFetching extends BudgetState {}

final class BudgetFetchingSuceess extends BudgetState {}

final class BudgetFetchingFailure extends BudgetState {}
