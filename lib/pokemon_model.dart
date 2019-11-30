class Pokemon{
  final String name;
  final String url;
  Pokemon({
    this.name,
    this.url,
  });

  factory Pokemon.fromMap(dynamic map){
    return Pokemon(
      name: map['name'],
      url: map['url'],
    );
  }
}