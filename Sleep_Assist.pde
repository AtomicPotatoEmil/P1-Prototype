class Sleep_Assist {
  SaveData s;
  LoadData l;

  PImage awake;
  PImage sleep;

  int monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  int[] daysPoints = {0, 0, 0, 0, 0, 0, 0};
  int currentDay;

  int [] transition = {1, 2, 3, 4};
  int transitionIndex = 0;

  int sequence = 0;


  Sleep_Assist() {
    s = new SaveData();
    l = new LoadData();

    currentDay = 0;

    awake = loadImage("smileyHappy.png");
    sleep = loadImage("smileySleep.png");
  }

  void firstPage() {
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you going to sleep now?", width/2, height/2 + 75);
    image(awake, 70, height/2-150);
  }

  void secondPage() {
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Great, Goodnight!", width/2, height/2 + 75);

    imageMode(CENTER);
    image(sleep, 75, height/2-150);
  }

  void thirdPage() {
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you awake?", width/2, height/2 + 75);

    image(sleep, 70, height/2-150);
  }


  void switchDisplay() {
    switch(sequence) {
    case 1:
      firstPage();
      break;

    case 2:
      secondPage();
      break;

    case 3:
      thirdPage();
      break;
    }
  }


  void saveDays() {
    monday = daysPoints[0];
    tuesday = daysPoints[1];
    wednesday = daysPoints[2];
    thursday = daysPoints[3];
    friday = daysPoints[4];
    saturday = daysPoints[5];
    sunday = daysPoints[6];
  
    s.saveInt("monday", monday);
    s.saveInt("tuesday", tuesday);
    s.saveInt("wednesday", wednesday);
    s.saveInt("thursday", thursday);
    s.saveInt("friday", friday);
    s.saveInt("saturday", saturday);
    s.saveInt("sunday", sunday);
  
    s.saveInt("current day", currentDay);
  }
  
  void loadDays() {
    if (l.loadJSON.isNull("monday")) {
      println("not found");
    } else {
      daysPoints[0] = l.loadJSON.getInt("monday");
    }
    if (l.loadJSON.isNull("tuesday")) {
      println("not found");
    } else {
      daysPoints[1] = l.loadJSON.getInt("tuesday");
    }
    if (l.loadJSON.isNull("wednesday")) {
      println("not found");
    } else {
      daysPoints[2] = l.loadJSON.getInt("wednesday");
    }
    if (l.loadJSON.isNull("thursday")) {
      println("not found");
    } else {
      daysPoints[3] = l.loadJSON.getInt("thursday");
    }
    if (l.loadJSON.isNull("friday")) {
      println("not found");
    } else {
      daysPoints[4] = l.loadJSON.getInt("friday");
    }
    if (l.loadJSON.isNull("saturday")) {
      println("not found");
    } else {
      daysPoints[5] = l.loadJSON.getInt("saturday");
    }
    if (l.loadJSON.isNull("sunday")) {
      println("not found");
    } else {
      daysPoints[6] = l.loadJSON.getInt("sunday");
    }
  
    if (l.loadJSON.isNull("current day")) {
      println("not found");
    } else {
      currentDay = l.loadJSON.getInt("current day");
    }
  }
  
    void assignPoints(int point) {
      daysPoints[currentDay] = point;
      currentDay += 1;
      saveDays();
    }

}
