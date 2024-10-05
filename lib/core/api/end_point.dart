class EndPoint {
  static String register = 'auth/register';
  static String login = 'auth/login';
  static String posts = "posts/show";
  static String like(int id) => "show/interaction/$id";
  static String comments(int id) => "posts/show/$id";
  static String addComment(int id)=>"posts/$id/comments";
  static String getUsers = "show/users";
  static String showStories(int id) => "show/stories/$id";

}
