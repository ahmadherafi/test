import 'package:test/core/api/end_point.dart';
import 'package:test/core/network/http.dart';
import 'package:test/features/home/data_layer/models/comment.dart';
import 'package:test/features/home/data_layer/models/post.dart';
import 'package:test/features/home/data_layer/models/story.dart';
import 'package:test/features/home/data_layer/models/user.dart';

class HomeService {
  Future<List<Post>> getPosts() async {
    Request request = Request(
      EndPoint.posts,
      RequestMethod.get,
      authorized: true,
      cacheable: true
    );
    Map<String, dynamic> response = await request.sendRequest();
    return Post.fromJsonList(response);
  }

  Future<void> like(int id) async {
    Request request = Request(
      EndPoint.like(id),
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<List<CommentModel>> getComments(int id) async {
    Request request = Request(
      EndPoint.comments(id),
      RequestMethod.get,
      authorized: true,
      cacheable: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
    return CommentModel.fromJsonList(response);
  }

  Future<void> addComment(int id, String comment) async {
    Request request = Request(
      EndPoint.addComment(id),
      RequestMethod.post,
      body: {"content": comment},
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<List<User>> getUsers() async {
    Request request = Request(
      EndPoint.getUsers,
      RequestMethod.get,
      authorized: true,
      cacheable: true,
    );
    Map<String ,dynamic> response = await request.sendRequest();
    return User.fromJsonList(response);
  }
   Future<List<Story>> getStories(int id) async {
    Request request = Request(
      EndPoint.showStories(id),
      RequestMethod.get,
      authorized: true,
      cacheable: true,
    );
    Map<String ,dynamic> response = await request.sendRequest();
    return Story.fromJsonList(response);
  }
}
