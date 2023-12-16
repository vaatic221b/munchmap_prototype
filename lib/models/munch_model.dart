class MunchModel {
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

enum Status {
  open,
  closed,
}

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
  static List<MunchModel> getDiningOptions() {
    List<MunchModel> diningOptions = [];

    diningOptions.add(
        MunchModel(
        bgPath: 'assets/images/sailsBg.png',
        name: 'Bronze Sails House',
        avgRating: 4.5,
        address: '123 Main St',
        status: Status.open,
        shopHours: '4:00 PM to 9:00 PM',
        priceRange: PriceRange(500, 1800),
        gallery1: 'assets/images/sailsG1.png',
        gallery2: 'assets/images/sailsG2.png',
        gallery3: 'assets/images/sailsG3.png',
        tag1: 'Spaghetti',
        tag2: 'Steak',
        tag3: 'Wine',
      ),
    );

    diningOptions.add(
        MunchModel(
        bgPath: 'assets/images/hangryBg.png',
        name: 'Hangry Burger',
        avgRating: 4.2,
        address: '456 Oak St',
        status: Status.closed,
        shopHours: '6:00 AM to 8:00 PM',
        priceRange: PriceRange(300, 710),
        gallery1: 'assets/images/nogallery.png',
        gallery2: 'assets/images/nogallery.png',
        gallery3: 'assets/images/nogallery.png',
        tag1: 'Western',
        tag2: 'Burgers',
        tag3: 'Pizza',
      ),
    );

    diningOptions.add(
        MunchModel(
        bgPath: 'assets/images/infiBg.png',
        name: 'Infinite Hawk Kitchen',
        avgRating: 4.4,
        address: 'Maple Street',
        status: Status.closed,
        shopHours: '12:00 AM to 12:00 PM',
        priceRange: PriceRange(800, 1000),
        gallery1: 'assets/images/nogallery.png',
        gallery2: 'assets/images/nogallery.png',
        gallery3: 'assets/images/nogallery.png',
        tag1: 'Western',
        tag2: 'Burgers',
        tag3: 'Pizza',
      ),
    );

    diningOptions.add(
        MunchModel(
        bgPath: 'assets/images/dahliaBg.png',
        name: 'Dahlia Restaurant',
        avgRating: 5.0,
        address: 'Rose Street',
        status: Status.open,
        shopHours: '6:00 AM to 8:00 PM',
        priceRange: PriceRange(800, 2000),
        gallery1: 'assets/images/nogallery.png',
        gallery2: 'assets/images/nogallery.png',
        gallery3: 'assets/images/nogallery.png',
        tag1: 'Tea',
        tag2: 'Coffee',
        tag3: 'Cake',
      ),
    );


    return diningOptions;
  }
}
