import 'package:demo_app_v2/ui/address_selection/address_selection_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddressSelectionView extends StatelessWidget {
  const AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
