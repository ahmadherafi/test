import 'package:flutter/material.dart';

class AppColor {
  static Color primeColor = const Color(0xff252525);
  static Color backgroundColor = const Color(0xff2D2D2D);
  static Color textColor = const Color(0xff363636);
  static Color dividerColor = const Color(0xff05101c99);
  // static Color timeColor = const Color(0xff05101c99);
  static Color tagColor = const Color(0xffF1F1F1);
  static Color tagTextColor = const Color(0xff7662B3);
  static List<Color> backgroundStoryGradient = [
    const Color(0xff435A73).withOpacity(0.3),
    const Color(0xff182A3E).withOpacity(0.3),
  ];
  static List<Color> backgroundGradient = [
    const Color(0xff05101C).withOpacity(0.9),
    const Color(0xff05101C).withOpacity(1),
  ];
  static List<Color> appBarStory = [Colors.black.withOpacity(1), Colors.transparent];
}

class AppIcons {
  static String notification = "assets/icons/Group 45.svg";
  static String favorite = "assets/icons/ic_round-favorite-border.svg";
  static String comment = "assets/icons/Vector.svg";
  static String save = "assets/icons/bx_bookmark-alt.svg";
  static String back = "assets/icons/back.svg";
  static String download = "assets/icons/Group 44.svg";
  static String tag = "assets/icons/bxs_purchase-tag.svg";
  static String favoriteStory = "assets/icons/Group 355.svg";
  static String favoriteFill = "assets/icons/favorite-like-love-svgrepo-com.svg";
}

class AppImages {
  static String socially = "assets/images/Socially.svg";
}

class AppFont {
  static String glory = 'glory';
}
