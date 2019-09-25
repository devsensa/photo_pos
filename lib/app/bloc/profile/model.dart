class Profile {
  final String token;
  final DateTime createdOn;
  final String email;
  final Person person;

  Profile({this.token, this.createdOn, this.email, this.person});

  Profile copy({token, createdOn, email, person}) {
    return Profile(
      token: token ?? this.token,
      createdOn: createdOn ?? this.createdOn,
      email: email ?? this.email,
      person: person ?? this.person,
    );
  }
}

class Person {
  final String firstName;
  final String lastName;

  Person({this.firstName, this.lastName});

  Person copy({firstName, lastName}) {
    return Person(firstName: firstName ?? this.firstName, lastName: lastName ?? this.lastName);
  }
}
