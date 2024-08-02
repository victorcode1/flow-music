enum Rutas {
  search('/search'),
  songs('/songs'),
  radio('/radio'),
  profile('/profile'),
  radioRadioContent('/radio_radio_content'),
  playSong('/playSong'),
  auth('/auth');
  final String rootValue;
  const Rutas(this.rootValue);
}
