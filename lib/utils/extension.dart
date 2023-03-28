extension ImageExtension on String {

  String getVote() {
    int vote = int.parse(this);
    return (vote >= 1) ? "$vote Books" : "$vote Book";
  }
}
