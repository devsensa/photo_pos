import 'package:kiwi/kiwi.dart' as kiwi;
import 'bloc/export.dart';
import 'bloc/store.dart';

class Init {}

Future<void> runInit() async {
  var c = kiwi.Container();
//  register store state initial values
  c.registerSingleton((c) => authInitialState(), name: "auth.state.init");
  c.registerSingleton((c) => dealsInitialState(), name: "deals.state.init");
  c.registerSingleton((c) => employeeInitialState(), name: "employee.state.init");
  c.registerSingleton((c) => materialsInitialState(), name: "materials.state.init");
  c.registerSingleton((c) => posInitialState(), name: "points-of-sale.state.init");
  c.registerSingleton((c) => productsInitialState(), name: "products.state.init");
  c.registerSingleton((c) => profileInitialState(), name: "profile.state.init");
  c.registerSingleton((c) => shiftsInitialState(), name: "shifts.state.init");

//  register stores
  c.registerSingleton(
    (c) => AuthStore(c.resolve("auth.state.init")),
    name: "auth.store",
  );
  c.registerSingleton(
    (c) => DealsStore(c.resolve("deals.state.init")),
    name: "deals.store",
  );
  c.registerSingleton(
    (c) => EmployeeStore(c.resolve("employee.state.init")),
    name: "employee.store",
  );
  c.registerSingleton(
    (c) => MaterialsStore(c.resolve("materials.state.init")),
    name: "materials.store",
  );
  c.registerSingleton(
    (c) => PointsOfSaleStore(c.resolve("points-of-sale.state.init")),
    name: "points-of-sale.store",
  );
  c.registerSingleton(
    (c) => ProductsStore(c.resolve("products.state.init")),
    name: "products.store",
  );
  c.registerSingleton(
    (c) => ProfileStore(c.resolve("profile.state.init")),
    name: "profile.store",
  );
  c.registerSingleton(
    (c) => ShiftsStore(c.resolve("shift.state.initial")),
    name: "shifts.store",
  );

//  register queries
  c.registerSingleton(
    (c) => AuthQuery(c.resolve<AuthStore>("auth.store")),
    name: "auth.query",
  );
  c.registerSingleton(
    (c) => DealsQuery(c.resolve("deals.store")),
    name: "deals.query",
  );
  c.registerSingleton(
    (c) => EmployeeQuery(c.resolve("employee.store")),
    name: "employee.query",
  );
  c.registerSingleton(
    (c) => MaterialsQuery(c.resolve("materials.store")),
    name: "materials.query",
  );
  c.registerSingleton(
    (c) => PointsOfSaleQuery(c.resolve("points-of-sale.store")),
    name: "points-of-sale.query",
  );
  c.registerSingleton(
    (c) => ProductsQuery(c.resolve("products.store")),
    name: "products.query",
  );
  c.registerSingleton(
    (c) => ProfileQuery(c.resolve("profile.store")),
    name: "profile.query",
  );
  c.registerSingleton(
    (c) => ShiftsQuery(c.resolve("shifts.store")),
    name: "shifts.query",
  );

  //  register blocs
  c.registerSingleton(
    (c) => AuthBloc(c.resolve("auth.store")),
    name: "auth.bloc",
  );
  c.registerSingleton(
    (c) => DealsBloc(c.resolve("deals.store")),
    name: "deals.bloc",
  );
  c.registerSingleton(
    (c) => EmployeeBloc(c.resolve("employee.store")),
    name: "employee.bloc",
  );
  c.registerSingleton(
    (c) => MaterialsBloc(c.resolve("materials.store")),
    name: "materials.bloc",
  );
  c.registerSingleton(
    (c) => PointsOfSaleBloc(c.resolve("points-of-sale.store")),
    name: "points-of-sale.bloc",
  );
  c.registerSingleton(
    (c) => ProductsBloc(c.resolve("products.store")),
    name: "products.bloc",
  );
  c.registerSingleton(
    (c) => ProfileBloc(c.resolve("profile.store")),
    name: "profile.bloc",
  );
  c.registerSingleton(
    (c) => ShiftsBloc(c.resolve("shifts.store")),
    name: "shifts.bloc",
  );
}
