import 'package:eshop_app/core/constant/app_assets/app_assets.dart';
import 'package:eshop_app/features/data/models/review/review_model.dart';

List<Review> reviews = [
  Review(
      userName: "Martin",
      date: "Today, 07:17 AM",
      image: AppAssets.person1,
      content:
          "I heve bought over 10 products from this\nseller. Wow! What a service, I am impress\nwith their service.",
      numOfStars: 5),
  Review(
      userName: "Oliver",
      date: "Today, 06:10 AM",
      image: AppAssets.person2,
      content:
          "I heve bought over 10 products from this\nseller. Wow! What a service, I am impress\nwith their service.",
      numOfStars: 3),
  Review(
      userName: "Jack",
      date: "Today, 05:40 AM",
      image: AppAssets.person3,
      content:
          "I heve bought over 10 products from this\nseller. Wow! What a service, I am impress\nwith their service.",
      numOfStars: 2),
  Review(
      userName: "Anderson",
      date: "Today, 04:15 AM",
      image: AppAssets.person4,
      content:
          "I heve bought over 10 products from this\nseller. Wow! What a service, I am impress\nwith their service.",
      numOfStars: 4)
];
