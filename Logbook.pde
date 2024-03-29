class Logbook {
  LoadData l1;
  Sleep_Assist s1;
  int titleX, titleY, totalScoreY, thisWeekY, lastWeekY, line1Y, line2Y;
  
  String[] weekdays = {"M", "T", "W", "T", "F", "S", "S"};
  int[] points = {0, 0, 0, 0, 0, 0, 0};
  
  int[] placeholderPoints = {60, 80, 70, 90, 70, 70, 60};
  
  Logbook() {
    l1 = new LoadData();
    s1 = new Sleep_Assist();
    
    titleX = width/2;
    titleY = height/30;
    totalScoreY = height/8;
    thisWeekY = height/8*3;
    lastWeekY = height/8*5;
    line1Y = height/4+50;
    line2Y = height/2+50;
    
    
  }

  void logbookDraw() {
    s1.loadDays();
    
    if(l1.loadJSON.isNull("monday")){
      points[0] = 0;
    }else{
      points[0] = l1.loadJSON.getInt("monday");
    }
    
    if(l1.loadJSON.isNull("tuesday")){
      points[1] = 0;
    }else{
      points[1] = l1.loadJSON.getInt("tuesday");
    }
    
    if(l1.loadJSON.isNull("wednesday")){
      points[2] = 0;
    }else{
      points[2] = l1.loadJSON.getInt("wednesday");
    }
    
    if(l1.loadJSON.isNull("thursday")){
      points[3] = 0;
    }else{
      points[3] = l1.loadJSON.getInt("thursday");
    }
    
    if(l1.loadJSON.isNull("friday")){
      points[4] = 0;
    }else{
      points[4] = l1.loadJSON.getInt("friday");
    }
    
    if(l1.loadJSON.isNull("saturday")){
      points[5] = 0;
    }else{
      points[5] = l1.loadJSON.getInt("saturday");
    }
    
    if(l1.loadJSON.isNull("sunday")){
      points[6] = 0;
    }else{
      points[6] = l1.loadJSON.getInt("sunday");
    }
    
    int weekTotal = points[0] + points[1] + points[2] + points[3] + points[4] + points[5] + points[6];
    
    fill(0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("LOGBOOK", titleX, titleY);
    textSize(20);
    text("Total score this week:", titleX, totalScoreY);
    textSize(40);
    text(weekTotal, titleX, totalScoreY+75);
    textSize(20);
    text("Points this week:", titleX, thisWeekY);
    text("Points last week:", titleX, lastWeekY);
    
    line(0, line1Y, width, line1Y);
    line(0, line2Y, width, line2Y);
    
    for (int i = 0; i < weekdays.length; i++) {
      textSize(40);
      text(weekdays[i], i*(width/8)+width/8, thisWeekY+50);
      textSize(30);
      text(points[i], i*(width/8)+width/8, thisWeekY+100);
      textSize(40);
      text(weekdays[i], i*(width/8)+width/8, lastWeekY+50);
      textSize(30);
      text(placeholderPoints[i], i*(width/8)+width/8, lastWeekY+100);
    }
  }
}
