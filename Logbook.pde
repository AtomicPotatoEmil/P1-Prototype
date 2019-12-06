String[] weekdays = {"M", "T", "W", "T", "F", "S", "S"};
class Logbook { 
  int titleX, titleY, totalScoreY, thisWeekY, lastWeekY;

  Logbook() {
    titleX = width/2;
    titleY = height/30;
    totalScoreY = height/8;
    thisWeekY = height/8*3;
    lastWeekY = height/8*5;
  }

  void logbookDraw() {
    fill(0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("LOGBOOK", titleX, titleY);
    textSize(20);
    text("Total score this week:", titleX, totalScoreY);
    textSize(40);
    text("NIGGACAT", titleX, totalScoreY+75);
    textSize(20);
    text("Points this week:", titleX, thisWeekY);
    text("Points last week:", titleX, lastWeekY);
//line(0,height/8*3,width,height/8*3);
//line(0,height/3,width,height/4*3);
    for (int i = 0; i < weekdays.length; i++) {
      textSize(40);
      text(weekdays[i], i*(width/8)+width/8, thisWeekY+50);
      text(weekdays[i], i*(width/8)+width/8, thisWeekY+100);
      text(weekdays[i], i*(width/8)+width/8, lastWeekY+50);
      text(weekdays[i], i*(width/8)+width/8, lastWeekY+100);
    }
  }
}
