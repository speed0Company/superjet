String convertToArabicNumber(int number) {
  const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  String numberString = number.toString();
  String arabicNumber = numberString.split('').map((digit) {
    if (int.tryParse(digit) != null) {
      return arabicNumbers[int.parse(digit)];
    } else {
      return digit;
    }
  }).join('');

  return arabicNumber;
}