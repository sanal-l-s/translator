part of 'homepage_bloc.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class LanguageListLoading extends HomepageState {}

class LanguageListLoaded extends HomepageState {}

class LanguageListSuccess extends HomepageState {
  final Languages languageList;

  LanguageListSuccess(this.languageList);
}

class LanguageListError extends HomepageState {
  final String errorMessage;

  LanguageListError(this.errorMessage);
}
