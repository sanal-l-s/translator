import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/constants/colors.dart';
import 'package:translator/constants/widgets.dart';
import 'package:translator/view/homepage/homepage_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _sourceLanguageController =
      TextEditingController();
  final String _sourceLanguage = "English";
  final String _targetLanguage = "Spanish";
  final String resultText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas, mauris ultricies pulvinar bibendum, diam lectus tincidunt est, nec vestibulum augue velit at sapien.";

  @override
  Widget build(BuildContext context) {
    // _sourceLanguageController.text = resultText;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                kSpacer16,
                const Text(
                  "Text Translation",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                kSpacer16,
                Divider(
                  color: whiteTwoPercent,
                ),
                kSpacer16,
                Row(
                  children: [
                    _languageSelector(context, _sourceLanguage),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.swap_horiz,
                        color: whiteTwoPercent,
                      ),
                    ),
                    _languageSelector(context, _targetLanguage),
                  ],
                ),
                kSpacer16,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Translate From ",
                          style: TextStyle(color: Colors.white38)),
                      TextSpan(
                          text: "($_sourceLanguage)",
                          style: const TextStyle(color: Colors.white)),
                    ],
                  )),
                ),
                kSpacer8,
                _inputTextBox(),
                kSpacer16,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(
                    children: [
                      const TextSpan(
                          text: "Translate to ",
                          style: TextStyle(color: Colors.white38)),
                      TextSpan(
                          text: "($_targetLanguage)",
                          style: const TextStyle(color: Colors.white)),
                    ],
                  )),
                ),
                kSpacer8,
                _resultTextBox(resultText: resultText)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _languageSelector(context, String language) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            border: Border.all(color: grey1!),
            borderRadius: BorderRadius.circular(16),
            color: grey2),
        child: ListTile(
          title: Text(
            language,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 32),
          onTap: () async {
            // Languages _languagesList = await fetchLanguage();
            // print(_languagesList.languages);

            BlocProvider.of<HomepageBloc>(context).add(HomePageListLanguages());
            showModalBottomSheet(
              context: context,
              builder: (context) => BlocBuilder<HomepageBloc, HomepageState>(
                builder: (context, state) {
                  if (state is LanguageListLoading) {
                    return buildBottomModal(loading: true);
                  }
                  if (state is LanguageListSuccess) {
                    final languagesList = state.languageList.languages;
                    return buildBottomModal(languages: languagesList);
                  }
                  return Container();

                  // return buildBottomModal();
                },
              ),
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              // isDismissible: true
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            );
          },
        ),
      ),
    );
  }

  _inputTextBox({int maxLength = 2300}) {
    return Container(
      // height: 150,
      decoration: BoxDecoration(
          border: Border.all(color: grey1!),
          borderRadius: BorderRadius.circular(16),
          color: grey2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _sourceLanguageController,
              decoration: const InputDecoration(border: InputBorder.none),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 5,
              inputFormatters: [
                LengthLimitingTextInputFormatter(maxLength),
              ],
            ),
            kSpacer8,
            Divider(
              color: grey1,
            ),
            kSpacer8,
            Text(
              "${_sourceLanguageController.text.length}/ $maxLength",
              style: const TextStyle(color: Colors.white38),
            )
          ],
        ),
      ),
    );
  }

  _resultTextBox({int maxLength = 2300, required String resultText}) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: grey1!),
          borderRadius: BorderRadius.circular(16),
          color: grey2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              resultText,
              style: const TextStyle(color: Colors.white),
              maxLines: 5,
              overflow: TextOverflow.visible,
            ),
            kSpacer8,
            Divider(
              color: grey1,
            ),
            kSpacer8,
            Text(
              "${resultText.length}/ $maxLength",
              style: const TextStyle(color: Colors.white38),
            )
          ],
        ),
      ),
    );
  }

  buildBottomModal({languages, loading = false}) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: DraggableScrollableSheet(
        initialChildSize: .75,
        maxChildSize: .75,
        minChildSize: .5,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey1!),
            borderRadius: BorderRadius.circular(16),
            color: grey2,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "From",
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
                kSpacer8,
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    isDense: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                kSpacer8,
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "All Languages",
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
                Expanded(
                  child: loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) =>
                              _buildListItem(context, languages?[index].name!),
                          itemCount: languages?.length),
                ),
                kSpacer8,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      loading
                          ? "Fetching Languages..."
                          : "There are ${languages?.length} languages",
                      style: const TextStyle(color: Colors.white38),
                    ),
                  ),
                ),
                // kSpacer8
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildListItem(context, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 32),
          onTap: () async {
            // await translate();
            // Navigator.of(context).pop();
            // fetchLanguage();
            // translate();
          },
        ),
      ),
    );
  }
}
