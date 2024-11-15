class DynamicResize {
  static double dynamicWidth(double screenWidth) {
    double width = screenWidth < 576
        ? screenWidth * 0.9
        : screenWidth < 768
            ? screenWidth * 0.5
            : screenWidth < 992
                ? screenWidth * 0.33
                : screenWidth * 0.25;

    return width;
  }
}
