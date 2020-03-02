abstract class Action {
  final String executor;
  final DateTime executedOn = DateTime.now();

  Action(this.executor);
}

class SignIn extends Action {
  final String email;
  final String password;

  SignIn(this.email, this.password) : super(null);
}

class SignOut extends Action {
  SignOut(String executor) : super(executor);
}

class ChangeEmployeeFirstName extends Action {
  final String employeeRef;
  final String firstName;

  ChangeEmployeeFirstName(String executor, this.employeeRef, this.firstName)
      : super(executor);
}

class ChangeEmployeeLastName extends Action {
  final String employeeRef;
  final String lastName;

  ChangeEmployeeLastName(String executor, this.employeeRef, this.lastName)
      : super(executor);
}

class ChangeEmployeeEmail extends Action {
  final String employeeRef;
  final String email;

  ChangeEmployeeEmail(String executor, this.employeeRef, this.email)
      : super(executor);
}

class ChangeEmployeePassword extends Action {
  final String employeeRef;
  final String password;

  ChangeEmployeePassword(String executor, this.employeeRef, this.password)
      : super(executor);
}

class ChangeEmployeeRole extends Action {
  final String employeeRef;
  final String role;

  ChangeEmployeeRole(String executor, this.employeeRef, this.role)
      : super(executor);
}

class ChangeEmployeeCommission extends Action {
  final String employeeRef;
  final String commission;

  ChangeEmployeeCommission(String executor, this.employeeRef, this.commission)
      : super(executor);
}

class ChangeEmployeeHourlyRate extends Action {
  final String employeeRef;
  final String hourlyRate;

  ChangeEmployeeHourlyRate(String executor, this.employeeRef, this.hourlyRate)
      : super(executor);
}

class CreateEmployee extends Action {
  final String firstName;
  final String email;
  final String password;

  CreateEmployee(String executor, this.firstName, this.email, this.password)
      : super(executor);
}

class RemoveEmployee extends Action {
  final String employeeRef;

  RemoveEmployee(String executor, this.employeeRef) : super(executor);
}

class AddPos extends Action {
  final String title;

  AddPos(String executor, this.title) : super(executor);
}

class ClosePos extends Action {
  final String posRef;

  ClosePos(String executor, this.posRef) : super(executor);
}

class ChangePosTitle extends Action {
  final String posRef;
  final String title;

  ChangePosTitle(String executor, this.posRef, this.title) : super(executor);
}

class ChangePosAddress extends Action {
  final String posRef;
  final String address;

  ChangePosAddress(String executor, this.posRef, this.address)
      : super(executor);
}

class AddOperation extends Action {
  final String title;
  final String resource;
  final String price;

  AddOperation(String executor, this.title, this.resource, this.price)
      : super(executor);
}

class RemoveOperation extends Action {
  final String operationRef;

  RemoveOperation(String executor, this.operationRef) : super(executor);
}

class ChangeOperationTitle extends Action {
  final String operationRef;
  final String title;

  ChangeOperationTitle(String executor, this.operationRef, this.title)
      : super(executor);
}

class ChangeOperationResource extends Action {
  final String operationRef;
  final String resource;

  ChangeOperationResource(String executor, this.operationRef, this.resource)
      : super(executor);
}

class ChangeOperationPrice extends Action {
  final String operationRef;
  final String price;

  ChangeOperationPrice(String executor, this.operationRef, this.price)
      : super(executor);
}

class ExecuteOperation extends Action {
  final String operationRef;
  final String posRef;

  ExecuteOperation(String executor, this.operationRef, this.posRef)
      : super(executor);
}

class StartShift extends Action {
  final String employee;
  final String pos;

  StartShift(String executor, this.employee, this.pos) : super(executor);
}

class FinishShift extends Action {
  final String shift;
  final int currentPrintedPhotoCount;
  final String currentShiftTips;

  FinishShift(String executor, this.shift, this.currentPrintedPhotoCount,
      this.currentShiftTips)
      : super(executor);
}

class ChangeShiftCorrectnessMark extends Action {
  final String shift;
  final bool isCorrect;

  ChangeShiftCorrectnessMark(String executor, this.shift, this.isCorrect)
      : super(executor);
}

class AddProduct extends Action {
  final String title;
  final int amount;
  final String price;

  AddProduct(String executor, this.title, this.amount, this.price)
      : super(executor);
}

class RemoveProduct extends Action {
  final String product;

  RemoveProduct(String executor, this.product) : super(executor);
}

class ChangeProductFavoriteMark extends Action {
  final String product;
  final bool favoriteMark;

  ChangeProductFavoriteMark(String executor, this.product, this.favoriteMark)
      : super(executor);
}

class ChangeProductTitle extends Action {
  final String product;
  final String title;

  ChangeProductTitle(String executor, this.product, this.title)
      : super(executor);
}

class ChangeProductAmount extends Action {
  final String product;
  final int amount;

  ChangeProductAmount(String executor, this.product, this.amount)
      : super(executor);
}

class ChangeProductPrice extends Action {
  final String product;
  final String price;

  ChangeProductPrice(String executor, this.product, this.price)
      : super(executor);
}

class AddDeal extends Action {
  final String employee;
  final String shift;
  final String title;

  AddDeal(String executor, this.employee, this.shift, this.title)
      : super(executor);
}

class ChangeDealProduct extends Action {
  final String deal;
  final String product;

  ChangeDealProduct(String executor, this.deal, this.product) : super(executor);
}

class ChangeDealPaymentType extends Action {
  final String deal;
  final String paymentType;

  ChangeDealPaymentType(String executor, this.deal, this.paymentType)
      : super(executor);
}

class AdjustDealPrice extends Action {
  final String deal;
  final String newPrice;

  AdjustDealPrice(String executor, this.deal, this.newPrice) : super(executor);
}

class PrepareDeal extends Action {
  final String deal;

  PrepareDeal(String executor, this.deal) : super(executor);
}

class FinishDeal extends Action {
  final String deal;

  FinishDeal(String executor, this.deal) : super(executor);
}
