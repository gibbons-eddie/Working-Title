import 'package:flutter/material.dart';
import 'package:senior_project/models/phrase_option.dart';
import 'package:senior_project/theme.dart';

// Constant values
const double _borderWidth = 3.0;
final _borderRadius = BorderRadius.all(Radius.circular(5.0));
final _foregroundColor = MaterialStateProperty.all(CustomColors.white);
final _textStyle = MaterialStateProperty.all(appTheme.textTheme.bodyMedium);
final _fixedSize = MaterialStateProperty.all(const Size(200.0, 50.0));

// Button Styles
ButtonStyle _unansweredButtonStyle = const ButtonStyle().copyWith(
  textStyle: _textStyle,
  fixedSize: _fixedSize,
);

ButtonStyle _greenButtonStyle = const ButtonStyle().copyWith(
  foregroundColor: _foregroundColor,
  textStyle: _textStyle,
  fixedSize: _fixedSize,
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      side: const BorderSide(
        color: CustomColors.darkGreen,
        width: _borderWidth,
      ),
      borderRadius: _borderRadius,
    ),
  ),
  backgroundColor:
      MaterialStateProperty.all(const Color.fromARGB(255, 134, 211, 170)),
);

ButtonStyle _redButtonStyle = const ButtonStyle().copyWith(
  foregroundColor: _foregroundColor,
  textStyle: _textStyle,
  fixedSize: _fixedSize,
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      side: const BorderSide(
        color: Colors.red,
        width: _borderWidth,
      ),
      borderRadius: _borderRadius,
    ),
  ),
  backgroundColor:
      MaterialStateProperty.all(const Color.fromARGB(255, 255, 140, 131)),
);

ButtonStyle _grayButtonStyle = const ButtonStyle().copyWith(
  foregroundColor: _foregroundColor,
  textStyle: _textStyle,
  fixedSize: _fixedSize,
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(
      side: const BorderSide(
        color: CustomColors.darkGray,
        width: _borderWidth,
      ),
      borderRadius: _borderRadius,
    ),
  ),
  backgroundColor:
      MaterialStateProperty.all(const Color.fromARGB(255, 172, 172, 172)),
);

ButtonStyle getButtonStyle(PhraseOption option, PhraseOption correctOption,
    PhraseOption? selectedOption, bool isCorrect) {
  if (selectedOption == null) {
    return _unansweredButtonStyle;
  }
  if (isCorrect && option == correctOption) {
    return _greenButtonStyle;
  }
  if (isCorrect && option != correctOption) {
    return _grayButtonStyle;
  }
  if (!isCorrect && option == correctOption) {
    return _greenButtonStyle;
  }
  if (!isCorrect && option != correctOption && option == selectedOption) {
    return _redButtonStyle;
  }
  if (!isCorrect && option != correctOption && option != selectedOption) {
    return _grayButtonStyle;
  }
  return _unansweredButtonStyle;
}
