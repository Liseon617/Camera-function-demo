import 'package:demo_app_v4/ui/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

//UI CODE ONLY
class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(model.title)
        )
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
