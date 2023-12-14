class MunchModel {
  String owner;
  String bgPath;
  String name;
  double avgRating;
  String address;
  Status status;
  String shopHours;
  PriceRange priceRange;
  String gallery1;
  String gallery2;
  String gallery3;
  String tag1;
  String tag2;
  String tag3;

  MunchModel({
    required this.owner,
    required this.bgPath,
    required this.name,
    required this.avgRating,
    required this.address,
    required this.status,
    required this.shopHours,
    required this.priceRange,
    required this.gallery1,
    required this.gallery2,
    required this.gallery3,
    required this.tag1,
    required this.tag2,
    required this.tag3,
  });
}

// Enum for Status
enum Status {
  open,
  closed,
}

// Class for PriceRange
class PriceRange {
  final double min;
  final double max;

  PriceRange(this.min, this.max);

  @override
  String toString() {
    return '₱$min - ₱$max';
  }
}

class MunchModelList {
  static List<MunchModel> diningOptions = getDiningOptions();

  //this for when mu register listing, call MunchModelList.addDiningOption(stuff gi fill out) para maapil siya sa display... Then sa profile page, using "owner" attribute para ma filter which ones owned and ma edit
  static void addDiningOption(MunchModel option) {
    diningOptions.add(option);
  }

  static List<MunchModel> getDiningOptions() {
    return [
      //images are empty, but something like this
      MunchModel(
        owner: 'somebody',
        bgPath: 'assets/images/whatever.png',
        name: 'Restaurant Name',
        avgRating: 4.5,
        address: 'blalbalbalbala',
        status: Status.open,
        shopHours: 'Closes 9PM | Reopens 4PM',
        priceRange: PriceRange(500, 3000),
        gallery1: 'assets/images/gallery.png',
        gallery2: 'assets/images/gallery.png',
        gallery3: 'assets/images/gallery.png',
        tag1: 'Spaghetti',
        tag2: 'Pasta',
        tag3: 'Italian',
      ),
      // add more samplesz
    ];
  }
}
