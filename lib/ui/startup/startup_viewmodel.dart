import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../address_selection/address_selection_view.dart';

//"BUSINESS LOGIC" AND VIEW STATE

class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String title = '';
  // void doSomething(){
  //   _navigationService.navigateTo(Routes.AddressSelectionView);
  // }
}