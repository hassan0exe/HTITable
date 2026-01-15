  int checkTime(int startTime) {
    return startTime < 11 ? (startTime > 0 ? startTime : 1) : 10;
  }