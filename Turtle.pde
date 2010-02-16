class Turtle
{
    float X, Y, angle;
    
    Turtle()
    {
        X = height/2;
        Y = width/2;
        angle = 0;
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
        float newX = X + distance*cos(radians(angle));
        float newY = Y + distance*sin(radians(angle));
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
            }
        }
    }
}