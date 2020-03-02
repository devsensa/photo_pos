import 'package:property_change_notifier/property_change_notifier.dart';

import 'api.dart';
import 'employee_service.dart';
import 'pos_service.dart';
import 'operations_service.dart';
import 'shifts_service.dart';
import 'products_service.dart';
import 'deals_service.dart';

class Executor extends PropertyChangeNotifier {
  final EmployeeService _employeeService;
  final PosService _posService;
  final OperationsService _operationsService;
  final ShiftsService _shiftsService;
  final ProductsService _productsService;
  final DealsService _dealsService;

  Executor(this._employeeService, this._posService, this._operationsService,
      this._shiftsService, this._productsService, this._dealsService);

  Future<void> signIn(SignIn action) async {
    await _employeeService.signIn(action);
  }

  Future<void> signOut(SignOut action) async {
    await _employeeService.signOut(action);
  }

  Future<void> changeEmployeeFirstName(ChangeEmployeeFirstName action) async {
    await _employeeService.changeEmployeeFirstName(action);
  }

  Future<void> changeEmployeeLastName(ChangeEmployeeLastName action) async {
    await _employeeService.changeEmployeeLastName(action);
  }

  Future<void> changeEmployeeEmail(ChangeEmployeeEmail action) async {
    await _employeeService.changeEmployeeEmail(action);
  }

  Future<void> changeEmployeePassword(ChangeEmployeePassword action) async {
    await _employeeService.changeEmployeePassword(action);
  }

  Future<void> changeEmployeeRole(ChangeEmployeeRole action) async {
    await _employeeService.changeEmployeeRole(action);
  }

  Future<void> changeEmployeeCommission(ChangeEmployeeCommission action) async {
    await _employeeService.changeEmployeeCommission(action);
  }

  Future<void> changeEmployeeHourlyRate(ChangeEmployeeHourlyRate action) async {
    await _employeeService.changeEmployeeHourlyRate(action);
  }

  Future<void> createEmployee(CreateEmployee action) async {
    await _employeeService.createEmployee(action);
  }

  Future<void> removeEmployee(RemoveEmployee action) async {
    await _employeeService.removeEmployee(action);
  }

  Future<void> addPos(AddPos action) async {
    await _posService.addPos(action);
  }

  Future<void> closePos(ClosePos action) async {
    await _posService.closePos(action);
  }

  Future<void> changePosTitle(ChangePosTitle action) async {
    await _posService.changePosTitle(action);
  }

  Future<void> changePosAddress(ChangePosAddress action) async {
    await _posService.changePosAddress(action);
  }

  Future<void> addOperation(AddOperation action) async {
    await _operationsService.addOperation(action);
  }

  Future<void> removeOperation(RemoveOperation action) async {
    await _operationsService.removeOperation(action);
  }

  Future<void> changeOperationTitle(ChangeOperationTitle action) async {
    await _operationsService.changeOperationTitle(action);
  }

  Future<void> changeOperationResource(ChangeOperationResource action) async {
    await _operationsService.changeOperationResource(action);
  }

  Future<void> changeOperationPrice(ChangeOperationPrice action) async {
    await _operationsService.changeOperationPrice(action);
  }

  Future<void> executeOperation(ExecuteOperation action) async {
    await _operationsService.executeOperation(action);
  }

  Future<void> startShift(StartShift action) async {
    _shiftsService.startShift(action);
  }

  Future<void> finishShift(FinishShift action) async {
    _shiftsService.finishShift(action);
  }

  Future<void> changeShiftCorrectnessMark(
      ChangeShiftCorrectnessMark action) async {
    _shiftsService.changeShiftCorrectnessMark(action);
  }

  Future<void> addProduct(AddProduct action) async {
  _productsService.addProduct(action);
  }
  
  Future<void> removeProduct(RemoveProduct action) async {
  
    _productsService.removeProduct(action);
  }
  
  
  Future<void> changeProductFavoriteMark(
      ChangeProductFavoriteMark action) async {
      _productsService.changeProductFavoriteMark(action);
      }
      
  Future<void> changeProductTitle(ChangeProductTitle action) async {
  _productsService.changeProductTitle(action);
  }
  
  Future<void> changeProductAmount(ChangeProductAmount action) async {
  _productsService.changeProductAmount(action);
  }
  
  Future<void> changeProductPrice(ChangeProductPrice action) async {
  _productsService.changeProductPrice(action);
  }
  
  Future<void> addDeal(AddDeal action) async {
    _dealsService.addDeal(action);
  }
  
  
  Future<void> changeDealProduct(ChangeDealProduct action) async {
  _dealsService.changeDealProduct(action);
  }
  
  
  Future<void> changeDealPaymentType(ChangeDealPaymentType action) async {
  _dealsService.changeDealPaymentType(action);
  }
  
  
  Future<void> adjustDealPrice(AdjustDealPrice action) async {
    _dealsService.adjustDealPrice(action);
  }
  
  
  Future<void> prepareDeal(PrepareDeal action) async {
  _dealsService.prepareDeal(action);
  }
  
  
  Future<void> finishDeal(FinishDeal action) async {
  _dealsService.finishDeal(action);
  }
}
