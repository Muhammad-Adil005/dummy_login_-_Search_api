class Falaya {
  String id;
  String listingId;
  String name;
  int price;
  String address;
  String parish;
  String city;
  String neighborhood;
  String lotDescription;
  int bedrooms;
  int halfBath;
  List<String> style;
  String zipcode;
  int bathrooms;
  String appxSqftLivingArea;
  String appxSqftTotalArea;
  String lotSize;
  String listingImages;
  String listingImagesThumb;
  String listingImagesCompressed;
  String state;
  String dwellingType;
  String status;
  String? listingStatus; // it can be null
  double lat;
  double lng;
  String? location; // it can be null
  bool isFeatured;
  String? mlsBroker; // it can be null
  String listingType;
  String insertedAt;
  int yearBuilt;
  String approvedOn;
  double score;
  bool isFavourite;

  Falaya({
    required this.id,
    required this.listingId,
    required this.name,
    required this.price,
    required this.address,
    required this.parish,
    required this.city,
    required this.neighborhood,
    required this.lotDescription,
    required this.bedrooms,
    required this.halfBath,
    required this.style,
    required this.zipcode,
    required this.bathrooms,
    required this.appxSqftLivingArea,
    required this.appxSqftTotalArea,
    required this.lotSize,
    required this.listingImages,
    required this.listingImagesThumb,
    required this.listingImagesCompressed,
    required this.state,
    required this.dwellingType,
    required this.status,
    this.listingStatus,
    required this.lat,
    required this.lng,
    this.location,
    required this.isFeatured,
    this.mlsBroker,
    required this.listingType,
    required this.insertedAt,
    required this.yearBuilt,
    required this.approvedOn,
    required this.score,
    required this.isFavourite,
  });

  factory Falaya.fromJson(Map<String, dynamic> json) {
    return Falaya(
      id: json['id'],
      listingId: json['fields']['listing_id'][0],
      name: json['fields']['name'][0],
      price: json['fields']['price'][0],
      address: json['fields']['address'][0],
      parish: json['fields']['parish'][0],
      city: json['fields']['city'][0],
      neighborhood: json['fields']['neighborhood'][0],
      lotDescription: json['fields']['lot_description'][0],
      bedrooms: json['fields']['bedrooms'][0],
      halfBath: json['fields']['half_bath'][0],
      style: List<String>.from(json['fields']['style'][0]),
      zipcode: json['fields']['zipcode'][0],
      bathrooms: json['fields']['bathrooms'][0],
      appxSqftLivingArea: json['fields']['appx_sqft_living_area'][0],
      appxSqftTotalArea: json['fields']['appx_sqft_total_area'][0],
      lotSize: json['fields']['lot_size'][0],
      listingImages: json['fields']['listing_images'][0],
      listingImagesThumb: json['fields']['listing_images_thumb'][0],
      listingImagesCompressed: json['fields']['listing_images_compressed'][0],
      state: json['fields']['state'][0],
      dwellingType: json['fields']['dwelling_type'][0],
      status: json['fields']['status'][0],
      // listingStatus: json['fields']['listing_status'][0],
      listingStatus: json['fields']['listing_status']?.isNotEmpty == true
          ? json['fields']['listing_status'][0]
          : null,
      lat: json['fields']['lat'][0],
      lng: json['fields']['lng'][0],
      //location: json['fields']['location'][0],
      location: json['fields']['location']?.isNotEmpty == true
          ? json['fields']['location'][0]
          : null,
      isFeatured: json['fields']['is_featured'][0] == 1,
      // mlsBroker: json['fields']['mls_broker'][0],
      mlsBroker: json['fields']['mls_broker']?.isNotEmpty == true
          ? json['fields']['mls_broker'][0]
          : null,

      listingType: json['fields']['listing_type'][0],
      insertedAt: json['fields']['inserted_at'][0],
      yearBuilt: json['fields']['year_built'][0],
      approvedOn: json['fields']['approved_on'][0],
      score: double.parse(json['fields']['_score'][0]),
      isFavourite: json['fields']['is_favourite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'listing_id': listingId,
      'name': name,
      'price': price,
      'address': address,
      'parish': parish,
      'city': city,
      'neighborhood': neighborhood,
      'lot_description': lotDescription,
      'bedrooms': bedrooms,
      'half_bath': halfBath,
      'style': style,
      'zipcode': zipcode,
      'bathrooms': bathrooms,
      'appx_sqft_living_area': appxSqftLivingArea,
      'appx_sqft_total_area': appxSqftTotalArea,
      'lot_size': lotSize,
      'listing_images': listingImages,
      'listing_images_thumb': listingImagesThumb,
      'listing_images_compressed': listingImagesCompressed,
      'state': state,
      'dwelling_type': dwellingType,
      'status': status,
      'listing_status': listingStatus,
      'lat': lat,
      'lng': lng,
      'location': location,
      'is_featured': isFeatured ? 1 : 0, // Convert bool to 1 or 0
      'mls_broker': mlsBroker,
      'listing_type': listingType,
      'inserted_at': insertedAt,
      'year_built': yearBuilt,
      'approved_on': approvedOn,
      '_score': score.toString(),
      'is_favourite': isFavourite,
    };
  }
}
