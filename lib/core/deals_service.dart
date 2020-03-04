import 'package:photo_pos/core/api.dart';

abstract class DealsService {
  void addDeal(AddDeal action) {}

  void changeDealProduct(ChangeDealProduct action) {}

  void changeDealPaymentType(ChangeDealPaymentType action) {}

  void adjustDealPrice(AdjustDealPrice action) {}

  void prepareDeal(PrepareDeal action) {}

  void finishDeal(FinishDeal action) {}
}
