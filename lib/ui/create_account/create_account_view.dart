import 'package:demo_app_v2/ui/dumb_widgets/authentication_layout.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_account_viewmodel.dart';
import 'create_account_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'fullName'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class CreateAccountView extends StatelessWidget with $CreateAccountView {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateAccountViewModel>.reactive(
        onViewModelReady: (model) => syncFormWithViewModel(model),
        builder: (context, model, child) => Scaffold(
                body: AuthenticationLayout(
              busy: model.isBusy,
              onMainButtonTapped: model.saveData,
              onBackPressed: model.navigateBack,
              validationMessage: model.validationMessage,
              title: 'Create account',
              subtitle: 'Enter your name, email and password to sign up!',
              mainButtonTitle: 'SIGN UP',
              form: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    controller: fullNameController,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    controller: emailController,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    controller: passwordController,
                  ),
                ],
              ),
              showTermsText: true,
            )),
        viewModelBuilder: () => CreateAccountViewModel()
    );
  }
}
