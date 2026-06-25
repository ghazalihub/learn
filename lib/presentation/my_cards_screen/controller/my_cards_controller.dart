
/// A controller class for the MyCardsScreen.
import 'package:flutter_elearning_app/core/app_export.dart';
import 'package:flutter_elearning_app/presentation/my_cards_screen/models/my_cards_model.dart';

import '../models/my_cards_data.dart';

///
/// This class manages the state of the MyCardsScreen, including the
/// current myCardsModelObj
class MyCardsController extends GetxController {
 List<MyCardsModel> cardData = MyCardsData.getCardData();
 int currentCardId = 1;
}
