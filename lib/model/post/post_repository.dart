import 'package:village/model/post/post.dart';

class PostRepository {
  static final PostRepository _instance = PostRepository._single();

  PostRepository._single();
  factory PostRepository() {
    return _instance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        Post(id: 1, title: "제목1"),
        Post(id: 2, title: "제목2"),
        Post(id: 3, title: "제목3"),
      ];
    });
  }

  // save할때는 데이터를 영속화해야 함 -> 영속화된 데이터를 반환받음
  Future<Post> save(String title) {
    return Future.delayed(const Duration(seconds: 1), () {
      return Post(id: 4, title: title);
    });
  }

  Future<void> deleteById(int id) {
    return Future.delayed(const Duration(seconds: 1));
  }

  Future<Post> update(Post post) {
    return Future.delayed(const Duration(seconds: 1), () {
      return post;
    });
  }
}
