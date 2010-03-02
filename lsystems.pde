Lsystem lsys;
Turtle turtle;
float generations, done;
HashMap rules, alpha;
String axiom;

void setup()
{
    size(7500,800);
    background(0);
    stroke(255);
    smooth();
    generations = 12;
    done = 0;

    Levy();            // Call L-System setup function
}

void draw()
{
    while(done<generations) {
        LevyDraw();
        done++;
    }
}

void Cantor()
{
    HashMap rules = new HashMap();

    rules.put("A", "A B A");
    rules.put("B","B B B");

    HashMap alpha = new HashMap();

    alpha.put("A", "forward 15");
    alpha.put("B", "jumpf 15");
    
    String axiom = "A";

    turtle = new Turtle(5, height/2);
    lsys = new Lsystem(alpha, rules, axiom);
}

void CantorDraw()
{
        lsys.generate();
        lsys.renderWith(turtle);
        turtle.moveTo(5.0, turtle.Y-20, 0.0);
}

void KochCurve()
{
    rules = new HashMap();

    rules.put("F", "F + F - F - F + F");

    alpha = new HashMap();
    alpha.put("F", "forward 10");
    alpha.put("+" , "right 90");
    alpha.put("-", "left 90");

    axiom = "F";

    turtle = new Turtle(0, height*.95);
    lsys = new Lsystem(alpha, rules, axiom);
}

void KochCurveDraw()
{
        lsys.generate();
        lsys.renderWith(turtle);
        float newStart = height*(1-((done+1)/generations));
        turtle.moveTo(0.0, newStart, 0.0);
}

void Sierpinski()
{
    rules = new HashMap();
    rules.put("A", "B - A - B");
    rules.put("B", "A + B + A");

    alpha = new HashMap();
    alpha.put("A", "forward 2");
    alpha.put("B", "forward 2");
    alpha.put("+" , "right 60");
    alpha.put("-", "left 60");

    axiom = "A";
    turtle = new Turtle(width/3, 0);
    lsys = new Lsystem(alpha, rules, axiom);
    
}

void SierpinskiDraw()
{
        lsys.generate();
        if(done%2 == 1) {
            lsys.renderWith(turtle);
            float newStart = height*((1+done)/generations);
            turtle.moveTo(done*10, newStart, 0.0);
        }
}

void Penrose()
{
    rules = new HashMap();

    rules.put("1", "");
    rules.put("6","8 1 + + 9 1 − − − − 7 1 [ − 8 1 − − − − 6 1 ] + +");
    rules.put("7","+ 8 1 − − 9 1 [ − − − 6 1 − − 7 1 ] +");
    rules.put("8", "− 6 1 + + 7 1 [ + + + 8 1 + + 9 1 ] −");
    rules.put("9","− − 8 1 +  + + + 6 1 [ + 9 1 + + + + 7 1 ] − − 7 1");

    alpha = new HashMap();

    alpha.put("1", "forward 25");
    alpha.put("+", "left 36");
    alpha.put("-", "right 36");
    alpha.put("[","push");
    alpha.put("]", "pop");

    axiom = "[ 7 ] + + [ 7 ] + + [ 7 ] + + [ 7 ] + + [ 7 ]";

    turtle = new Turtle(400,height/2);
    lsys = new Lsystem(alpha, rules, axiom);

}

void PenroseDraw()
{
    float next = done + 1;
    lsys.generate();
    lsys.renderWith(turtle);
    save("output/penrose"+next+".png");
    turtle.moveTo((next*next*100), height/2,0.0);
    stroke(255*(1-next/generations),255*(next/generations),255*(1-next/generations));
}

void Levy()
{
    rules = new HashMap();
    rules.put("F", "+ F - - F +");

    alpha = new HashMap();
    alpha.put("F","forward 10");
    alpha.put("+","right 45");
    alpha.put("-", "left 45");

    axiom = "F";

    turtle = new Turtle(0, 0.8*height);
    lsys = new Lsystem(alpha,rules,axiom);
    
}

void LevyDraw()
{
    float next = done +1;
    lsys.generate();
    lsys.renderWith(turtle);
    save("output/levt"+next+".png");
    turtle.moveTo((next*next*50), height*.8, 0.0);
}