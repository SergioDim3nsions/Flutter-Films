import 'package:json_annotation/json_annotation.dart';
part 'actors_model.g.dart';

@JsonSerializable()
class Actor {
  @JsonKey(name: 'cast_id')
  int castId;

  @JsonKey(name: 'character')
  String character;

  @JsonKey(name: 'credit_id')
  String creditId;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'profile_path')
  String profilePath;

  Actor();

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
  Map<String, dynamic> toJson() => _$ActorToJson(this);

  getProfileImage() {
    if (profilePath == null) {
      return 'https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjap_2UoKznAhUxxoUKHQYRCdkQjRx6BAgBEAQ&url=https%3A%2F%2Fcrowd-literature.eu%2Fspeakers%2Fno-avatar%2F&psig=AOvVaw1h67zv46MThasCMptxB3oj&ust=1580505549997179';
    }

    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }
}
