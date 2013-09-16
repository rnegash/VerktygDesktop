/*
Verktyg
Tool for City Game at Fields of View.
www.fieldsofview.in
Desktop version

Made by Rufael Negash and Mosa Al-Husseini.
*/

import controlP5.*;
import java.util.Arrays;
ArrayList rounds;
ControlP5 cp5;

String textValue = "";
String timestamp;
int c=1, p=1;
String s;

void setup() {
  size(int(displayWidth/2), int(displayHeight/2));
  background(255);
  rounds=new ArrayList<String>();
  PFont font = createFont("arial", 20);
  cp5 = new ControlP5(this);
  textSize(10);
  timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) +":"+ nf(minute(), 2);
  fill(0);
}

void draw() {
  background(255);
  text(timestamp, width-textWidth(timestamp), height-20);
}
String placed;
String player="p1";
void mouseClicked() {
  if (mouseButton==RIGHT) {
    s="Rnd"+(c++)+" "+player;
    cp5.addTextfield(s)
      .setPosition(mouseX, mouseY)
        .setSize(70, 15)
          .setFocus(true)
            .setColor(color(0))
              .setColorBackground(color(200))
                .setColorForeground(color(255))
                  .setColorActive(color(50, 205, 50))
                    .setColorLabel(color(0))
                      ;
    playerSwitch();
  }


  rounds.add(s+"\n"+placed+"\n");
}

void stop() {
  //  String[] roundsArray=new String[rounds.size()];
  //  rounds.toArray(roundsArray);
  //  saveStrings("sessions/rounds/hej.txt", roundsArray);
} 
void playerSwitch() {
  if (p>=4||p<1) {
    p=1;
  } else {
    p++;
  }
  println(player);
  switch (p) {
  case 1:
    player="p1";
    break;
  case 2:
    player="p2";
    break;
  case 3:    
    player="p3";
    break;
  case 4:    
    player="p4";
    break;
  default:
    player="p1";
    break;
  }
}
void keyPressed() {
  //println(cp5.get(Textfield.class, s));
  if (key==' ') {
    //save("sessions/"+timestamp+".png");
    println(timestamp+".png"+" SAVED");
    String[] roundsArray=new String[rounds.size()];
    rounds.toArray(roundsArray);
    saveStrings("sessions/rounds/hej.txt", roundsArray);
  } else if (key=='s') {
  }
}

//public void clear() {
//  cp5.get(Textfield.class, "textValue").clear();
//}

void controlEvent(ControlEvent theEvent) {
  println("33333333hrj");
  if (theEvent.isAssignableFrom(Textfield.class)) {
    println("controlEvent: accessing a string from controller '"
      +theEvent.getName()+"': "
      +theEvent.getStringValue()
      );
    text(theEvent.getStringValue(), 100, 100);
    placed=theEvent.getStringValue();
  }
}


public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}

