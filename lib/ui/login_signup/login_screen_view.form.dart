// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String LoginEmailValueKey = 'loginEmail';
const String LoginPasswordValueKey = 'loginPassword';
const String RegisterUsernameValueKey = 'registerUsername';
const String RegisterEmailValueKey = 'registerEmail';
const String RegisterPasswordValueKey = 'registerPassword';
const String LoginRegisterPasswordValueKey = 'loginRegisterPassword';
const String AuthTypeValueKey = 'authType';

final Map<String, TextEditingController>
    _LoginScreenViewTextEditingControllers = {};

final Map<String, FocusNode> _LoginScreenViewFocusNodes = {};

final Map<String, String? Function(String?)?> _LoginScreenViewTextValidations =
    {
  LoginEmailValueKey: null,
  LoginPasswordValueKey: null,
  RegisterUsernameValueKey: null,
  RegisterEmailValueKey: null,
  RegisterPasswordValueKey: null,
  LoginRegisterPasswordValueKey: null,
  AuthTypeValueKey: null,
};

mixin $LoginScreenView {
  TextEditingController get loginEmailController =>
      _getFormTextEditingController(LoginEmailValueKey);
  TextEditingController get loginPasswordController =>
      _getFormTextEditingController(LoginPasswordValueKey);
  TextEditingController get registerUsernameController =>
      _getFormTextEditingController(RegisterUsernameValueKey);
  TextEditingController get registerEmailController =>
      _getFormTextEditingController(RegisterEmailValueKey);
  TextEditingController get registerPasswordController =>
      _getFormTextEditingController(RegisterPasswordValueKey);
  TextEditingController get loginRegisterPasswordController =>
      _getFormTextEditingController(LoginRegisterPasswordValueKey);
  TextEditingController get authTypeController =>
      _getFormTextEditingController(AuthTypeValueKey);
  FocusNode get loginEmailFocusNode => _getFormFocusNode(LoginEmailValueKey);
  FocusNode get loginPasswordFocusNode =>
      _getFormFocusNode(LoginPasswordValueKey);
  FocusNode get registerUsernameFocusNode =>
      _getFormFocusNode(RegisterUsernameValueKey);
  FocusNode get registerEmailFocusNode =>
      _getFormFocusNode(RegisterEmailValueKey);
  FocusNode get registerPasswordFocusNode =>
      _getFormFocusNode(RegisterPasswordValueKey);
  FocusNode get loginRegisterPasswordFocusNode =>
      _getFormFocusNode(LoginRegisterPasswordValueKey);
  FocusNode get authTypeFocusNode => _getFormFocusNode(AuthTypeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_LoginScreenViewTextEditingControllers.containsKey(key)) {
      return _LoginScreenViewTextEditingControllers[key]!;
    }

    _LoginScreenViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LoginScreenViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LoginScreenViewFocusNodes.containsKey(key)) {
      return _LoginScreenViewFocusNodes[key]!;
    }
    _LoginScreenViewFocusNodes[key] = FocusNode();
    return _LoginScreenViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    loginEmailController.addListener(() => _updateFormData(model));
    loginPasswordController.addListener(() => _updateFormData(model));
    registerUsernameController.addListener(() => _updateFormData(model));
    registerEmailController.addListener(() => _updateFormData(model));
    registerPasswordController.addListener(() => _updateFormData(model));
    loginRegisterPasswordController.addListener(() => _updateFormData(model));
    authTypeController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    loginEmailController.addListener(() => _updateFormData(model));
    loginPasswordController.addListener(() => _updateFormData(model));
    registerUsernameController.addListener(() => _updateFormData(model));
    registerEmailController.addListener(() => _updateFormData(model));
    registerPasswordController.addListener(() => _updateFormData(model));
    loginRegisterPasswordController.addListener(() => _updateFormData(model));
    authTypeController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          LoginEmailValueKey: loginEmailController.text,
          LoginPasswordValueKey: loginPasswordController.text,
          RegisterUsernameValueKey: registerUsernameController.text,
          RegisterEmailValueKey: registerEmailController.text,
          RegisterPasswordValueKey: registerPasswordController.text,
          LoginRegisterPasswordValueKey: loginRegisterPasswordController.text,
          AuthTypeValueKey: authTypeController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _LoginScreenViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LoginScreenViewFocusNodes.values) {
      focusNode.dispose();
    }

    _LoginScreenViewTextEditingControllers.clear();
    _LoginScreenViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get loginEmailValue =>
      this.formValueMap[LoginEmailValueKey] as String?;
  String? get loginPasswordValue =>
      this.formValueMap[LoginPasswordValueKey] as String?;
  String? get registerUsernameValue =>
      this.formValueMap[RegisterUsernameValueKey] as String?;
  String? get registerEmailValue =>
      this.formValueMap[RegisterEmailValueKey] as String?;
  String? get registerPasswordValue =>
      this.formValueMap[RegisterPasswordValueKey] as String?;
  String? get loginRegisterPasswordValue =>
      this.formValueMap[LoginRegisterPasswordValueKey] as String?;
  String? get authTypeValue => this.formValueMap[AuthTypeValueKey] as String?;

  set loginEmailValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          LoginEmailValueKey: value,
        }),
    );

    if (_LoginScreenViewTextEditingControllers.containsKey(
        LoginEmailValueKey)) {
      _LoginScreenViewTextEditingControllers[LoginEmailValueKey]?.text =
          value ?? '';
    }
  }

  set loginPasswordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          LoginPasswordValueKey: value,
        }),
    );

    if (_LoginScreenViewTextEditingControllers.containsKey(
        LoginPasswordValueKey)) {
      _LoginScreenViewTextEditingControllers[LoginPasswordValueKey]?.text =
          value ?? '';
    }
  }

  set registerUsernameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          RegisterUsernameValueKey: value,
        }),
    );

    if (_LoginScreenViewTextEditingControllers.containsKey(
        RegisterUsernameValueKey)) {
      _LoginScreenViewTextEditingControllers[RegisterUsernameValueKey]?.text =
          value ?? '';
    }
  }

  set registerEmailValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          RegisterEmailValueKey: value,
        }),
    );

    if (_LoginScreenViewTextEditingControllers.containsKey(
        RegisterEmailValueKey)) {
      _LoginScreenViewTextEditingControllers[RegisterEmailValueKey]?.text =
          value ?? '';
    }
  }

  set registerPasswordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          RegisterPasswordValueKey: value,
        }),
    );

    if (_LoginScreenViewTextEditingControllers.containsKey(
        RegisterPasswordValueKey)) {
      _LoginScreenViewTextEditingControllers[RegisterPasswordValueKey]?.text =
          value ?? '';
    }
  }

  set loginRegisterPasswordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          LoginRegisterPasswordValueKey: value,
        }),
    );

    if (_LoginScreenViewTextEditingControllers.containsKey(
        LoginRegisterPasswordValueKey)) {
      _LoginScreenViewTextEditingControllers[LoginRegisterPasswordValueKey]
          ?.text = value ?? '';
    }
  }

  set authTypeValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AuthTypeValueKey: value,
        }),
    );

    if (_LoginScreenViewTextEditingControllers.containsKey(AuthTypeValueKey)) {
      _LoginScreenViewTextEditingControllers[AuthTypeValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasLoginEmail =>
      this.formValueMap.containsKey(LoginEmailValueKey) &&
      (loginEmailValue?.isNotEmpty ?? false);
  bool get hasLoginPassword =>
      this.formValueMap.containsKey(LoginPasswordValueKey) &&
      (loginPasswordValue?.isNotEmpty ?? false);
  bool get hasRegisterUsername =>
      this.formValueMap.containsKey(RegisterUsernameValueKey) &&
      (registerUsernameValue?.isNotEmpty ?? false);
  bool get hasRegisterEmail =>
      this.formValueMap.containsKey(RegisterEmailValueKey) &&
      (registerEmailValue?.isNotEmpty ?? false);
  bool get hasRegisterPassword =>
      this.formValueMap.containsKey(RegisterPasswordValueKey) &&
      (registerPasswordValue?.isNotEmpty ?? false);
  bool get hasLoginRegisterPassword =>
      this.formValueMap.containsKey(LoginRegisterPasswordValueKey) &&
      (loginRegisterPasswordValue?.isNotEmpty ?? false);
  bool get hasAuthType =>
      this.formValueMap.containsKey(AuthTypeValueKey) &&
      (authTypeValue?.isNotEmpty ?? false);

  bool get hasLoginEmailValidationMessage =>
      this.fieldsValidationMessages[LoginEmailValueKey]?.isNotEmpty ?? false;
  bool get hasLoginPasswordValidationMessage =>
      this.fieldsValidationMessages[LoginPasswordValueKey]?.isNotEmpty ?? false;
  bool get hasRegisterUsernameValidationMessage =>
      this.fieldsValidationMessages[RegisterUsernameValueKey]?.isNotEmpty ??
      false;
  bool get hasRegisterEmailValidationMessage =>
      this.fieldsValidationMessages[RegisterEmailValueKey]?.isNotEmpty ?? false;
  bool get hasRegisterPasswordValidationMessage =>
      this.fieldsValidationMessages[RegisterPasswordValueKey]?.isNotEmpty ??
      false;
  bool get hasLoginRegisterPasswordValidationMessage =>
      this
          .fieldsValidationMessages[LoginRegisterPasswordValueKey]
          ?.isNotEmpty ??
      false;
  bool get hasAuthTypeValidationMessage =>
      this.fieldsValidationMessages[AuthTypeValueKey]?.isNotEmpty ?? false;

  String? get loginEmailValidationMessage =>
      this.fieldsValidationMessages[LoginEmailValueKey];
  String? get loginPasswordValidationMessage =>
      this.fieldsValidationMessages[LoginPasswordValueKey];
  String? get registerUsernameValidationMessage =>
      this.fieldsValidationMessages[RegisterUsernameValueKey];
  String? get registerEmailValidationMessage =>
      this.fieldsValidationMessages[RegisterEmailValueKey];
  String? get registerPasswordValidationMessage =>
      this.fieldsValidationMessages[RegisterPasswordValueKey];
  String? get loginRegisterPasswordValidationMessage =>
      this.fieldsValidationMessages[LoginRegisterPasswordValueKey];
  String? get authTypeValidationMessage =>
      this.fieldsValidationMessages[AuthTypeValueKey];
}

extension Methods on FormViewModel {
  setLoginEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LoginEmailValueKey] = validationMessage;
  setLoginPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LoginPasswordValueKey] = validationMessage;
  setRegisterUsernameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterUsernameValueKey] =
          validationMessage;
  setRegisterEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterEmailValueKey] = validationMessage;
  setRegisterPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RegisterPasswordValueKey] =
          validationMessage;
  setLoginRegisterPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LoginRegisterPasswordValueKey] =
          validationMessage;
  setAuthTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AuthTypeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    loginEmailValue = '';
    loginPasswordValue = '';
    registerUsernameValue = '';
    registerEmailValue = '';
    registerPasswordValue = '';
    loginRegisterPasswordValue = '';
    authTypeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      LoginEmailValueKey: getValidationMessage(LoginEmailValueKey),
      LoginPasswordValueKey: getValidationMessage(LoginPasswordValueKey),
      RegisterUsernameValueKey: getValidationMessage(RegisterUsernameValueKey),
      RegisterEmailValueKey: getValidationMessage(RegisterEmailValueKey),
      RegisterPasswordValueKey: getValidationMessage(RegisterPasswordValueKey),
      LoginRegisterPasswordValueKey:
          getValidationMessage(LoginRegisterPasswordValueKey),
      AuthTypeValueKey: getValidationMessage(AuthTypeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _LoginScreenViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _LoginScreenViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      LoginEmailValueKey: getValidationMessage(LoginEmailValueKey),
      LoginPasswordValueKey: getValidationMessage(LoginPasswordValueKey),
      RegisterUsernameValueKey: getValidationMessage(RegisterUsernameValueKey),
      RegisterEmailValueKey: getValidationMessage(RegisterEmailValueKey),
      RegisterPasswordValueKey: getValidationMessage(RegisterPasswordValueKey),
      LoginRegisterPasswordValueKey:
          getValidationMessage(LoginRegisterPasswordValueKey),
      AuthTypeValueKey: getValidationMessage(AuthTypeValueKey),
    });
