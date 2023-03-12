extension RemoveTrailinZeros on double {
  num removeTrailingZeros() {
    return this % 1 == 0 ? toInt() : this;
  }
}
