class PackageModel {
  final int id;
  final String title;
  final String details;
  final double price;
  final int viewBoost;
  final List<PackageFeature> features;
  final String type;
  final bool isBestValue;
  final bool isHighestViews;

  PackageModel({
    required this.id,
    required this.title,
    required this.details,
    required this.price,
    required this.viewBoost,
    required this.features,
    required this.type,
    required this.isBestValue,
    required this.isHighestViews,
  });

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    // Parse features from JSON string
    List<PackageFeature> features = [];
    if (map['features'] != null) {
      String featuresString = map['features'];
      List<String> featureStrings = featuresString.split('|');
      for (String featureString in featureStrings) {
        try {
          // Clean the feature string and parse JSON properly
          featureString = featureString.trim();
          if (featureString.isEmpty) continue;

          // Parse each JSON object properly
          Map<String, dynamic> featureMap = {
            'icon': '',
            'title': '',
            'subtitle': null,
          };

          // Extract icon using regex for more reliable parsing
          RegExp iconRegex = RegExp(r'"icon":\s*"([^"]*)"');
          Match? iconMatch = iconRegex.firstMatch(featureString);
          if (iconMatch != null) {
            featureMap['icon'] = iconMatch.group(1) ?? '';
          }

          // Extract title using regex
          RegExp titleRegex = RegExp(r'"title":\s*"([^"]*)"');
          Match? titleMatch = titleRegex.firstMatch(featureString);
          if (titleMatch != null) {
            featureMap['title'] = titleMatch.group(1) ?? '';
          }

          // Extract subtitle using regex
          RegExp subtitleRegex = RegExp(r'"subtitle":\s*(null|"([^"]*)")');
          Match? subtitleMatch = subtitleRegex.firstMatch(featureString);
          if (subtitleMatch != null) {
            if (subtitleMatch.group(1) == 'null') {
              featureMap['subtitle'] = null;
            } else {
              featureMap['subtitle'] = subtitleMatch.group(2);
            }
          }

          // Only add if we have at least icon and title
          if (featureMap['icon'].isNotEmpty && featureMap['title'].isNotEmpty) {
            features.add(PackageFeature.fromJson(featureMap));
          }
        } catch (e) {
          // Handle parsing errors gracefully
          print('Error parsing feature: $featureString, Error: $e');
          continue;
        }
      }
    }

    return PackageModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      details: map['details'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      viewBoost: map['view_boost'] ?? 1,
      features: features,
      type: map['type'] ?? '',
      isBestValue: (map['is_best_value'] ?? 0) == 1,
      isHighestViews: (map['is_highest_views'] ?? 0) == 1,
    );
  }

  Map<String, dynamic> toMap() {
    String featuresString = features
        .map((f) => f.toJson().toString())
        .join('|');

    return {
      'id': id,
      'title': title,
      'details': details,
      'price': price,
      'view_boost': viewBoost,
      'features': featuresString,
      'type': type,
      'is_best_value': isBestValue ? 1 : 0,
      'is_highest_views': isHighestViews ? 1 : 0,
    };
  }
}

class PackageFeature {
  final String icon;
  final String title;
  final String? subtitle;

  PackageFeature({required this.icon, required this.title, this.subtitle});

  factory PackageFeature.fromJson(Map<String, dynamic> json) {
    return PackageFeature(
      icon: json['icon'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'icon': icon, 'title': title, 'subtitle': subtitle};
  }
}
