class Rate {
  double rate;
  Rate({required this.rate});

  Map<String, dynamic> tojson() {
    return {'rate': rate};
  }

}
