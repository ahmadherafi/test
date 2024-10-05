class Pagination<T> {
  List<T> data;

  // @privates
  int _page = 0;

  bool _moreData = true;

  // @getters
  bool get moreData => _moreData;

  int get page => _page;

  int get length => data.length;

  bool get isFirstPage => _page == 1 || _page == 0;

  // @constructors
  Pagination({this.data = const []});

  factory Pagination.zero() => Pagination();

  // @methods
  Future<void> nextPage(
    Future<List<T>> Function(int currentPage) getData, {
    InsertPlace place = InsertPlace.start,
  }) async {
    try {
      if (!moreData) return;

      _page++;

      List<T> result = await getData(page);

      if (result.isEmpty) _moreData = false;

      if (page == 1) {
        data = result;
        return;
      }

      if (place != InsertPlace.start) {
        data.insertAll(0, result);
        return;
      }

      data.addAll(result);
    } catch (e) {
      _page--;

      rethrow;
    }
  }

  void clear() {
    _page = 0;
    data = [];
    _moreData = true;
  }
}

enum InsertPlace { start, end }
