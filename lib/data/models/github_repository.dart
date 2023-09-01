// The class for a GitHub Repository
// It has a simple fromJson factory that also checks if
// the user has no public repos

class Repository {
  final String name;
  final String description;
  final int numberOfStars;

  Repository({
    required this.name,
    required this.description,
    required this.numberOfStars,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      name: json['name'] ?? "No Name",
      description: json['description'] ?? "No description",
      numberOfStars: json['stargazers_count'] as int,
    );
  }
}
