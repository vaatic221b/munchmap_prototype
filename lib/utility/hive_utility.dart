import 'package:hive/hive.dart';
import 'package:munchmap_prototype/models/bookmark_model.dart';

class HiveService {
  late Box<BookmarkModel> _bookmarkBox;

  // Create a private constructor
  HiveService._privateConstructor();

  // Create a static instance variable that will hold the single instance
  static final HiveService _instance = HiveService._privateConstructor();

  // Create a factory method to access the single instance
  factory HiveService() {
    return _instance;
  }

  // Register the adapter for BookmarkModel
  static void registerAdapters() {
    Hive.registerAdapter<BookmarkModel>(BookmarkModelAdapter());
  }

  Future<void> initHive() async {
    // Register the adapters before opening the box
    registerAdapters();

    await Hive.openBox<BookmarkModel>('bookmarkBox');
    _bookmarkBox = Hive.box<BookmarkModel>('bookmarkBox');
  }

  Box<BookmarkModel> get bookmarkBox => _bookmarkBox;

  bool isBookmarked(String key) {
    // Check if the item with the given key is in the bookmarkBox
    return _bookmarkBox.containsKey(key);
  }

  void toggleBookmark(BookmarkModel item) {
    final key = item.hashCode.toString(); // You may adjust how you generate the key

    if (isBookmarked(key)) {
      // If bookmarked, remove the item from the bookmarkBox
      _bookmarkBox.delete(key);
    } else {
      // If not bookmarked, add the item to the bookmarkBox
      _bookmarkBox.put(key, item);
    }
  }

  void clearBookmarkBox() {
    _bookmarkBox.clear();
  }
}
