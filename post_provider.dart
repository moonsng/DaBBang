class PostProvider with ChangeNotifier {

  List<Post> _posts = [];

  List<Post> getPostList() {
    _fetchPosts();
    return _posts;
  }

  // data 세팅
  void _fetchPosts() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');
    final List<Post> parsedResposne = jsonDecode(response.body).
      map<Post>((json) => Post.fromJson(json)).toList();

    _posts.clear();
    _posts.addAll(parsedResposne);

    notifyListeners(); // data 가 수정되었다고 알려주기
  }
}
