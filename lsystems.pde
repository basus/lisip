Lsystem lsys;
int generations, done;

void setup()
{
    size(500,500);
    smooth();
    frameRate(1);
    generations = 5;
    done = 0;
    lsys = Cantor();
}

void draw()
{
    while(done<generations) {
        lsys.generate();
        lsys.render();
        done++;
    }
}

Lsystem Cantor()
{
    HashMap rules = new HashMap();

    rules.put("A", "A B A");
    rules.put("B","B B B");

    HashMap alpha = new HashMap();

    alpha.put("A", "forward 10");
    alpha.put("B", "jumpf 10");
    
    String axiom = "A";
    
    return new Lsystem(alpha, rules, axiom);
}