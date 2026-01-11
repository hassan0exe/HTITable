  int checkTime(int startTime) {
    return startTime < 9 ? (startTime > 0 ? startTime : 1) : 8;
  }