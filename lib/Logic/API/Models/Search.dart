class Search {
  final String image;
  final String title;
  final String description;

  Search({
    required this.image,
    required this.title,
    required this.description,
  });

  factory Search.fromJSON(Map<String, dynamic> json) {
    return Search(
      image: json['image']??"",
      title: json['title']??"",
      description: json['description']??"",
    );
  }
}
