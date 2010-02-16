Lsystem lsys;
Turtle turtle;
float generations, done;
HashMap rules, alpha;
String axiom;

void setup()
{
    size(800,800);
    smooth();
    generations = 10;
    done = 0;
}

void draw()
{
    Sierpinski();
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
    
    while(done<generations) {
        lsys.generate();
        lsys.renderWith(turtle);
        turtle.moveTo(5.0, turtle.Y-20, 0.0);
        done++;
    }
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

    while(done<generations) {
        lsys.generate();
        lsys.renderWith(turtle);
        done++;
        float newStart = height*(1-(done/generations));
        turtle.moveTo(0.0, newStart, 0.0);
    }
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
    
    while(done<generations) {
        lsys.generate();
        done++;
        if(done%2 == 0) {
            lsys.renderWith(turtle);
            float newStart = height*(done/generations);
            turtle.moveTo(done*10, newStart, 0.0);
        }
    }
}