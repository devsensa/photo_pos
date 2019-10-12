import 'package:rxdart/rxdart.dart';

import 'model.dart';

abstract class Query {
  Observable<bool> authenticated$();
  Observable<ProfileInfo> profileInfo$();
  Observable<ProfileSalary> profileSalary$();
  Observable<ProfileShifts> profileShifts$();
  Observable<ProfileSchedule> profileSchedule$();
  Observable<Shifts> shifts$();
  Observable<ShiftInfo> shiftInfo$();
  Observable<ShiftActiveDeals> shiftActiveDeals$();
  Observable<ShiftDeals> shiftDeals$();
  Observable<ShiftRefusedDeals> shiftRefusedDeals$();
  Observable<ShiftAcceptedDeals> shiftAcceptedDeals$();
  Observable<Deals> deals$();
  Observable<DealInfo> dealInfo$();
  Observable<Employee> employee$();
  Observable<WorkerInfo> workerInfo$();
  Observable<PointsOfSale> pointsOfSale();
  Observable<PointOfSale> pointOfSale$();
  Observable<Products> products$();
  Observable<Product> product$();
  Observable<Consumables> consumables$();
  Observable<Consumable> consumable$();
}
