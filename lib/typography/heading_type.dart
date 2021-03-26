class HeadingType {
  static const HeadingType HEADING_0 = HeadingType._(0);
  static const HeadingType HEADING_1 = HeadingType._(1);
  static const HeadingType HEADING_2 = HeadingType._(2);
  static const HeadingType HEADING_3 = HeadingType._(3);
  static const HeadingType HEADING_4 = HeadingType._(4);


  static List<HeadingType> get values =>
      [HEADING_1, HEADING_2, HEADING_3, HEADING_4];

  final int value;

  const HeadingType._(this.value);
}
