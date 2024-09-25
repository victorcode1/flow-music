enum RutasShelf {
  searchAppBar('/searchAppBar'),
  songs('/songs'),
  radio('/radio'),
  profile('/profile'),
  radioRadioContent('/radio_radio_content'),
  // playSong('/playSong'),
  auth('/auth');

  final String rootValue;
  const RutasShelf(this.rootValue);
}

enum Rutas {
  playSong('/playSong'),
  home('/home');

  final String rootValue;
  const Rutas(this.rootValue);
}
