import 'package:hive/hive.dart';
import 'package:munchmap_prototype/models/bookmark_model.dart';

class HiveService {
  late Box<BookmarkModel> _bookmarkBox;

  HiveService._privateConstructor();

  // Create a static instance variable that will hold the single instance
  static final HiveService _instance = HiveService._privateConstructor();

  factory HiveService() {
    return _instance;
  }

  // Register the adapter for BookmarkModel
  static void registerAdapters() {
    Hive.registerAdapter<BookmarkModel>(BookmarkModelAdapter());
  }

  Future<void> initHive() async {
    registerAdapters();
    await Hive.openBox<BookmarkModel>('bookmarkBoxNew');
    _bookmarkBox = Hive.box<BookmarkModel>('bookmarkBoxNew');
  }

  Box<BookmarkModel> get bookmarkBox => _bookmarkBox;

  bool isBookmarked(String key) {

    return _bookmarkBox.containsKey(key);
  }

  void toggleBookmark(BookmarkModel item) {
    final key = item.hashCode.toString(); 

    if (isBookmarked(key)) {
      _bookmarkBox.delete(key);
    } else {
      _bookmarkBox.put(key, item);
    }
  }

  void clearBookmarkBox() {
    _bookmarkBox.clear();
  }
}
