import "package:optional/optional.dart";

abstract class AccountService {
  Future<Account> authenticate(String login, String password);
  Future<void> logout(Account account);
}

class AccountModel {
  final AccountService _accountService;
  Optional<Account> _account = Optional.empty();

  AccountModel(this._accountService);

  Future<void> login(String login, String password) async {
    if (!_account.isPresent) {
      final account = await _accountService.authenticate(login, password);
      _account = account.asOptional();
    }
  }

  Future<void> logout() async {
    if (_account.isPresent) {
      await _accountService.logout(_account.value);
      _account = Optional.empty();
    }
  }
}

///
class Account {
  /// Account id
  final String id;

  /// User first name
  final String firstName;

  /// User last name
  final String lastName;

  /// Account main constructor
  Account(this.id, this.firstName, this.lastName);
}

extension AsOptional on Account {
  Optional<Account> asOptional() {
    return Optional.of(this);
  }
}
