// Copyright 2010 Shrutarshi Basu

//     This file is part of Lisip.

//     Lisip is free software: you can redistribute it and/or modify
//     it under the terms of the GNU General Public License as published by
//     the Free Software Foundation, either version 3 of the License, or
//     (at your option) any later version.

//     Lisip is distributed in the hope that it will be useful,
//     but WITHOUT ANY WARRANTY; without even the implied warranty of
//     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//     GNU General Public License for more details.

//     You should have received a copy of the GNU General Public License
//     along with Lisip.  If not, see <http://www.gnu.org/licenses/>.


class Turtle
{
    float X, Y, angle;
    ArrayList posX, posY, posAngle;
    int positions;
    
    Turtle()
    {
        X = width/2;
        Y = height/2;
        angle = 0;
        posX = new ArrayList();
        posY = new ArrayList();
        posAngle = new ArrayList();
        positions = -1;
    }

    Turtle(float startX, float startY)
    {
        X = startX;
        Y = startY;
        angle = 0;
        posX = new ArrayList();
        posY = new ArrayList();
        posAngle = new ArrayList();
        positions = -1;
    }

    void moveTo(float newX, float newY, float newAngle)
    {
        X = newX;
        Y = newY;
        angle = newAngle;
    }

    void forward(float distance)
    {
        float newX = X + distance*cos(radians(angle));
        float newY = Y + distance*sin(radians(angle));
        line(X,Y, newX,newY);
        X = newX;
        Y = newY;
    }

    void backward(float distance)
    {
        float newX = X + distance*cos(radians(angle));
        float newY = Y + distance*sin(radians(angle));
        line(X,Y, newX,newY);
        X = newX;
        Y = newY;        
    }

    void jumpf(float distance)
    {
        float newX = X + distance*cos(radians(angle));
        float newY = Y + distance*sin(radians(angle));
        X = newX;
        Y = newY;
    }

    void jumpb(float distance)
    {
        float newX = X - distance*cos(radians(angle));
        float newY = Y - distance*sin(radians(angle));
        X = newX;
        Y = newY;        
    }
        

    void left(float difference)
    {
        angle += difference;
    }

    void right(float difference)
    {
        angle -= difference;
    }

    void push()
    {
        posX.add(X);
        posY.add(Y);
        posAngle.add(angle);
        positions++;
    }

    void pop()
    {
        X = (Float)posX.remove(positions);
        Y = (Float)posY.remove(positions);
        angle = (Float)posAngle.remove(positions);
        positions--;
    }

    void execute(String steps)
    {
        String step;
        Scanner sc = new Scanner(steps);
        while(sc.hasNext()) {
            step = sc.next();
            if (step.equals("forward")) {
                forward(sc.nextFloat());
            } else if (step.equals("backward")) {
                backward(sc.nextFloat());
            } else if (step.equals("left")) {
                left(sc.nextFloat());
            } else if (step.equals("right")) {
                right(sc.nextFloat());
            } else if (step.equals("jumpf")) {
                jumpf(sc.nextFloat());
            } else if (step.equals("jumpb")) {
                jumpb(sc.nextFloat());
            } else if (step.equals("push")) {
                push();
            } else if (step.equals("pop")) {
                pop();
            }
        }
    }
}