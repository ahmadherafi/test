import 'package:get/get.dart';
import 'package:rx_future/rx_future.dart';
import 'package:test/features/home/data_layer/models/comment.dart';
import 'package:test/features/home/data_layer/models/post.dart';
import 'package:test/features/home/data_layer/models/story.dart';
import 'package:test/features/home/data_layer/models/user.dart';
import 'package:test/features/home/data_layer/source/home_service.dart';

class HomeController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  RxInt get currentIndex => _currentIndex;

  void changeCurrentIndex(int index) {
    _currentIndex.value = index;
  }

  RxInt index = 0.obs;
  HomeService homeService = HomeService();

  // get posts

  RxFuture<List<Post>> postsState = RxFuture(<Post>[]);

  Future<void> getPosts({void Function(List<Post>)? onSuccess, void Function(Object)? onError}) async {
    await postsState.observe(
      (value) async {
        return await homeService.getPosts();
      },
      onSuccess: (p0) {
        onSuccess?.call(p0);
      },
      onError: (p0) {
        onError?.call(p0);
      },
    );
  }

  // like to post
  RxFuture<void> likeState = RxFuture(null);
  Future<void> like(int id) async {
    await likeState.observe(
      (p0) async {
        await homeService.like(id);
      },
      onSuccess: (p0) {},
      onError: (p0) {},
    );
  }

  // get comment

  RxFuture<List<CommentModel>> commentsState = RxFuture([]);
  Future<void> getComments(int id) async {
    await commentsState.observe((value) async {
      return await homeService.getComments(id);
    });
  }

  // add comment
  RxFuture<void> addCommentsState = RxFuture([]);
  Future<void> addComment(int id, String comment) async {
    await addCommentsState.observe((value) async {
      return await homeService.addComment(id, comment);
    });
  }

  int _currentPost = 0;
  void setCurrentPost(int postId) {
    _currentPost = postId;
  }

  int get currentPost => _currentPost;

  // get user

  RxFuture<List<User>> userState = RxFuture([]);
  Future<void> getUsers() async {
    await userState.observe((value) async {
      return await homeService.getUsers();
    });
  }
  // show stories

  RxFuture<List<Story>> userStories = RxFuture([]);
  Future<void> getStories(int id) async {
    await userStories.observe((value) async {
      return await homeService.getStories(id);
    });
  }

  //

  User currentUserStory = User.zero();

  void setCurrentUserStory(User user) {
    currentUserStory = user;
  }

  User get nextUserStory {
    User temp = User.zero();

    for (User element in userState.result) {
      int index = userState.result.indexOf(currentUserStory);

      if (index != userState.result.length-1) {
        temp = userState.result[index + 1];
        break;
      }
    }
    return temp;
  }
}
