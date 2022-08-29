import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:translator/data/api.dart';
import 'package:translator/models/LanguagesModel.dart';

part 'homepage_event.dart';

part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<HomePageListLanguages>((event, emit) async {
      emit(LanguageListLoading());
      Response response = await fetchLanguage();
      emit(LanguageListLoaded());
      if (response.statusCode == 400 || true) {
        final jsonResponse =
            jsonDecode(response.body) as Map<String, dynamic>;
        // final _data = languagesFromJson(_jsonResponse["data"]);
        final data = Languages.fromJson(jsonResponse["data"]);
        emit(LanguageListSuccess(data));
      }
    });

/*
    on<HomepageEvent>((event, emit) {
      // TODO: implement event handler
    });
*/
  }
}
