import 'package:optional/optional.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:uuid/uuid.dart';

enum PointOfSaleStatus {
  online,
  offline,
}

/// Class PointOfSale represents business unit
class PointOfSaleState {
  final PointOfSale pointOfSale;

  ///
  final Optional<WorkDescription> activeWorkDescription;

  /// Point of sale status online\offline
  PointOfSaleStatus get status => activeWorkDescription.isPresent
      ? PointOfSaleStatus.online
      : PointOfSaleStatus.offline;

  /// Point of sale main constructor
  PointOfSaleState(this.pointOfSale,
      {this.activeWorkDescription = const Optional.empty()});
}

class PointOfSale {
  /// Point of sale unique id
  final String id;

  /// Point of sale title
  final String title;

  /// Point of sale address
  final String address;

  PointOfSale(this.id, this.title, this.address);
}

class WorkDescription {
  final PointOfSale pointOfSale;
  final Employee employee;
  final DateTime start;

  int get totalHoursAtWork => DateTime.now().difference(start).inHours;

  WorkDescription(this.pointOfSale, this.start, this.employee);
}

class PointOfSaleOverview {
  final PointOfSale pointOfSale;
  final PointOfSaleStatus status;

  PointOfSaleOverview(this.pointOfSale, this.status);
}

class PointsOfSaleManagement {
  final List<PointOfSaleState> _pointsOfSale = [];

  List<PointOfSaleOverview> get pointsOfSaleOverview => _pointsOfSale
      .map((item) => PointOfSaleOverview(item.pointOfSale, item.status))
      .toList();
}

/* -------------------------------------------------------------------------- */
/*                                  Employee                                  */
/* -------------------------------------------------------------------------- */

enum EmployeeWorkStatus {
  working,
  notWorking,
}

class Employee {
  final String ref;
  final String firstName;
  final String lastName;

  Employee(this.ref, this.firstName, this.lastName);
  Employee.create(String firstName, String lastName)
      : this(Uuid().v4(), firstName, lastName);
}

class EmployeeState {
  final Employee employee;
  final EmployeeWorkStatus status;

  EmployeeState(this.employee, this.status);
}

class EmployeeOverview {
  final Employee employee;
  final EmployeeWorkStatus workStatus;

  EmployeeOverview(this.employee, this.workStatus);
}

class EmployeeManagement {
  final List<EmployeeState> employee = [];

  List<EmployeeOverview> get employeeOverview => employee
      .map((item) => EmployeeOverview(item.employee, item.status))
      .toList();
}

/* -------------------------------------------------------------------------- */
/*                                    User                                    */
/* -------------------------------------------------------------------------- */

enum UserRole { manager, worker }

class UserCredentials {
  final String userRef;
  final String login;
  final String passwordHash;

  UserCredentials(this.login, this.passwordHash, this.userRef);

  UserCredentials.create(this.login, String password)
      : passwordHash = DBCrypt().hashpw(password, DBCrypt().gensalt()),
        userRef = Uuid().v4();

  bool isPasswordValid(String password) =>
      DBCrypt().checkpw(password, passwordHash);

  bool isNotPasswordValid(String password) => !isPasswordValid(password);

  bool isLoginValid(String login) => login == this.login;

  bool isNotLoginValid(String login) => !isLoginValid(login);

  bool isCredentialsValid(String login, String password) =>
      isLoginValid(login) && isPasswordValid(password);

  bool isNotCredentialsValid(String login, String password) =>
      !isCredentialsValid(login, password);
}

abstract class UserService {
  Future<Optional<UserCredentials>> credentialsByLogin(String login);
  Future<Optional<UserState>> userByRef(String ref);
  Future<List<UserState>> users();
  Future<void> saveUser(User user);
}

/* -------------------------------------------------------------------------- */
/*                               Authentication                               */
/* -------------------------------------------------------------------------- */

class UnknownUserError extends Error {}

class InvalidCredentialsError extends Error {}

class NoActiveUserError extends Error {}

class AuthManager {
  final UserService _userService;
  Optional<UserCredentials> _userCredentials = Optional.empty();
  UserState user;

  bool get isAuthenticated => _userCredentials.isPresent;
  bool get isNotAuthenticated => !isAuthenticated;

  AuthManager(this._userService);

  Future<void> signIn(String login, String password) async {
    final credentials = (await _userService.credentialsByLogin(login))
        .orElseThrow(() => UnknownUserError());
    if (credentials.isNotCredentialsValid(login, password)) {
      throw InvalidCredentialsError();
    }

    _userCredentials = Optional.of(credentials);
  }

  Future<void> signOut() async {
    _userCredentials = Optional.empty();
  }
}

/* -------------------------------------------------------------------------- */
/*                                 UserManager                                */
/* -------------------------------------------------------------------------- */

class UserState {
  final String ref;

  UserState(this.ref);

  UserState.create() : this(Uuid().v4());
}

class User {
  static const managerRoleIndex = 1;
  static const workerRoleIndex = 1;

  final String ref;
  final String firstName;
  final String lastName;
  final UserRole role;
  final DateTime createdOn;
  final DateTime modifiedOn;

  User(this.ref, this.firstName, this.lastName, this.role, this.createdOn,
      this.modifiedOn);

  User.create(String firstName, String lastName)
      : this(Uuid().v4(), firstName, lastName, UserRole.worker, DateTime.now(),
            DateTime.now());

  User copyWith({String firstName, String lastName, UserRole role}) {
    final _firstName = firstName ?? this.firstName;
    final _lastName = lastName ?? this.lastName;
    final _role = role ?? this.role;
    return User(ref, _firstName, _lastName, _role, createdOn, DateTime.now());
  }
}

extension UserMutations on User {
  User changeRoleByIndex(int roleIndex) {
    return this.copyWith(role: UserRole.manager);
  }
}

class InvalidUserRoleIndexError extends Error {}

class UsersManager {
  final UserService _userService;

  final Map<String, User> _users = {};

  UsersManager(this._userService);

  Future<void> createUser(String firstName, String lastName) async {
    final user = User.create(firstName, lastName);
    await _userService.saveUser(user);
    _users[user.ref] = user;
  }

  Future<void> changeUserRole(String userRef, int roleIndex) async {
    if (!_users.containsKey(userRef)) {
      throw UnknownUserError();
    }
    final user = _users[userRef].changeRoleByIndex(roleIndex);
    await _userService.saveUser(user);
    _users[user.ref] = user;
  }
}
