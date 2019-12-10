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
  PImage bgHover;
  

  int monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  int[] day = {0, 0, 0, 0, 0, 0, 0};
  int currentDay;

  int points;
  
  int time;
  int time2;
  int totalTime;

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
    bgHover = loadImage("3rdPage_hover_done.png");
  }

  void firstPage() {
    loadDays();
    if (currentDay >= 7) {
      currentDay = 0;
      for (int i = 0; i < day.length; i++) {
        day[i] = 0;
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
      time = millis() / 1000;
      sequence = 2;
      println(time);
    }
  }

  void secondPage() {
     loadDays();
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
      loadDays();
      if(currentDay == day.length){
      for(int i = 0; i < day.length; i++){
        day[i] = 0;
        saveDays();
      }
      currentDay = 0;
    }
      time2 = millis() / 1000;
      totalTime = time2 * 10 - time * 10;
      sequence = 3;
      points = totalTime;
      day[currentDay] = points;
      assigntime();
      println(totalTime);
      println(points);
    }
  }

  void thirdPage() {
    int x = width/2-110;
    int y = height/2+130;
    
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(20);
    if(points / 10 >= 8){
      text("Congratulations! You have slept: "+points / 10+" hour(s)", width/2, height/2 - 90);
    }else{
      text("You have slept: "+points / 10+" hour(s)", width/2, height/2 - 90);
    }
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("You have earned "+points+" points",width/2,height/2);
    image(awake, 70, height/2-300);

if (mouseX > x && mouseX < x + 220 && mouseY > y && mouseY < y + 110) {
      
      image(bgHover, x,y);
      image(blackArrow, width/2-30, height/2+150);
    } else {
      
      image(knapbg,x,y);
      image(blackArrow, width/2-30, height/2+150);
    }


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
    monday = day[0];
    tuesday = day[1];
    wednesday = day[2];
    thursday = day[3];
    friday = day[4];
    saturday = day[5];
    sunday = day[6];

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
      day[0] = l.loadJSON.getInt("monday");
    }
    if (l.loadJSON.isNull("tuesday")) {
      println("not found");
    } else {
      day[1] = l.loadJSON.getInt("tuesday");
    }
    if (l.loadJSON.isNull("wednesday")) {
      println("not found");
    } else {
      day[2] = l.loadJSON.getInt("wednesday");
    }
    if (l.loadJSON.isNull("thursday")) {
      println("not found");
    } else {
      day[3] = l.loadJSON.getInt("thursday");
    }
    if (l.loadJSON.isNull("friday")) {
      println("not found");
    } else {
      day[4] = l.loadJSON.getInt("friday");
    }
    if (l.loadJSON.isNull("saturday")) {
      println("not found");
    } else {
      day[5] = l.loadJSON.getInt("saturday");
    }
    if (l.loadJSON.isNull("sunday")) {
      println("not found");
    } else {
      day[6] = l.loadJSON.getInt("sunday");
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
 
}
