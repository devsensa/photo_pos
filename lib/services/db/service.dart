import 'package:mongo_dart/mongo_dart.dart';
import 'package:optional/optional.dart';

const String dbUri =
    "mongodb://167.172.248.168:27017/photo_pos?authSource=admin";

class DbService {
  Optional<Db> _db = Optional.empty();

  Future<void> _init() async {
    if (!_db.isPresent) {
      final db = Db(dbUri);
      db.selectAuthenticationMechanism(ScramSha1Authenticator.name);
      await db.open();
      await db.authenticate("app_admin", "EBASH1ebashMONGO");
      _db = Optional.of(db);
    }
  }

  Future<DbCollection> usersCollection() async {
    await _init();
    return _db.value.collection("users");
  }
}
