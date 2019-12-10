class Sleep_Assist {
  SaveData s;
  LoadData l;

  PImage awake;
  PImage sleep;
  PImage goodnightBtn;
  PImage goodnightBtnHover;
  PImage goodmorningBtn;
  PImage goodmorningBtnHover;
  PImage knapbg;
  PImage blackArrow;

  int monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  int[] daystime = {0, 0, 0, 0, 0, 0, 0};
  int currentDay;

  int points;

  int sequence = 1;

  int bottonX;
  int bottonY;
  int bottonW;
  int bottonH;
  



  Sleep_Assist() {
    s = new SaveData();
    l = new LoadData();

    currentDay = 0;


    awake = loadImage("smileyHappy.png");
    sleep = loadImage("smileySleep.png");
    goodnightBtn = loadImage("goodnightButton.png");
    goodnightBtnHover = loadImage("goodnightButtonHover.png");
    goodmorningBtn = loadImage("goodmorningBtn.png");
    goodmorningBtnHover = loadImage("goodmorningBtnHover.png");
    knapbg = loadImage("knapbg.png");
    blackArrow = loadImage("blackArrow.png");
  }

  void firstPage() {
    loadDays();
    if (currentDay >= 7) {
      currentDay = 0;
      for (int i = 0; i < daystime.length; i++) {
        daystime[i] = 0;
        saveDays();
      }
    }
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you going to sleep now?", width/2, height/2 - 180);
    image(awake, 70, height/2-380);


    if (mouseX > 155 && mouseX < 320 && mouseY > 300 && mouseY < 390) {
      goodnightBtnHover.resize(300, 500);
      image(goodnightBtnHover, 90, 10);
    } else {
      goodnightBtn.resize(300, 500);
      image(goodnightBtn, 90, 10);
    }

    if (mousePressed && mouseX > 155 && mouseX < 320 && mouseY > 300 && mouseY < 390) {
      sequence = 2;
    }
  }

  void secondPage() {
    sleeptimeTracker();
    image(sleep, 70, height/2-380);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Are you awake now?", width/2, height/2 - 180);

    fill(250, 0, 0, 50);
    rect(125, 440, 220, 90);

    if (mouseX > 125 && mouseX < 345 && mouseY > 440 && mouseY < 530) {
      goodmorningBtnHover.resize(300, 500);
      image(goodmorningBtnHover, 85, 150);
    } else {
      goodmorningBtn.resize(300, 500);
      image(goodmorningBtn, 85, 150);
    }

    if (mousePressed && mouseX > 125 && mouseX < 345 && mouseY > 440 && mouseY < 530) {
      assigntime();
      sequence = 3;
    }
  }

  void thirdPage() {
    int x = width/2-110;
    int y = height/2+130;
    
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Congratulations! You have earned: ", width/2, height/2 - 90);
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(40);
    text("50 POINTS",width/2,height/2);
    image(awake, 70, height/2-300);
    image(knapbg,width/2-110, height/2+130);
    image(blackArrow, width/2-30, height/2+150);



    if (mousePressed && mouseX > x && mouseX < x + 220 && mouseY > y && mouseY < y + 110) {
      sequence = 1;
    }
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
    monday = daystime[0];
    tuesday = daystime[1];
    wednesday = daystime[2];
    thursday = daystime[3];
    friday = daystime[4];
    saturday = daystime[5];
    sunday = daystime[6];

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
      daystime[0] = l.loadJSON.getInt("monday");
    }
    if (l.loadJSON.isNull("tuesday")) {
      println("not found");
    } else {
      daystime[1] = l.loadJSON.getInt("tuesday");
    }
    if (l.loadJSON.isNull("wednesday")) {
      println("not found");
    } else {
      daystime[2] = l.loadJSON.getInt("wednesday");
    }
    if (l.loadJSON.isNull("thursday")) {
      println("not found");
    } else {
      daystime[3] = l.loadJSON.getInt("thursday");
    }
    if (l.loadJSON.isNull("friday")) {
      println("not found");
    } else {
      daystime[4] = l.loadJSON.getInt("friday");
    }
    if (l.loadJSON.isNull("saturday")) {
      println("not found");
    } else {
      daystime[5] = l.loadJSON.getInt("saturday");
    }
    if (l.loadJSON.isNull("sunday")) {
      println("not found");
    } else {
      daystime[6] = l.loadJSON.getInt("sunday");
    }

    if (l.loadJSON.isNull("current day")) {
      println("not found");
    } else {
      currentDay = l.loadJSON.getInt("current day");
    }
  }

  void assigntime() {
     currentDay += 1;
     saveDays();
    
  }

  void sleeptimeTracker() {
    int time = millis() / 1000;
    loadDays();
    if(currentDay == daystime.length){
      for(int i = 0; i < daystime.length; i++){
        daystime[i] = 0;
        saveDays();
      }
      currentDay = 0;
    }
    if (time < 1) {
      daystime[currentDay] = 0;
      points = 0;
    } else if (time == 1) {
      daystime[currentDay] = 10;
      points = 10;
    } else if (time == 2) {
      daystime[currentDay] = 20;
      points = 20;
    } else if (time == 3) {
      daystime[currentDay] = 30;
      points = 30;
    } else if (time == 4) {
      daystime[currentDay] = 40;
      points = 40;
    } else if (time == 5) {
      daystime[currentDay] = 50;
      points = 50;
    } else if (time == 6) {
      daystime[currentDay] = 60;
      points = 60;
    } else if (time == 7) {
      daystime[currentDay] = 70;
      points = 70;
    } else if (time == 8) {
      daystime[currentDay] = 80;
      points = 80;
    } else if (time == 9) {
      daystime[currentDay] = 90;
      points = 90;
    } else if (time >= 10) {
      daystime[currentDay] = 100;
      points = 100;
    }

    println(time);
    println(daystime[currentDay]);
    println(points);
  }
}
