class Lsystem
{
    HashMap rules;
    HashMap alphabet;
    String axiom;
    Turtle turtle;

    Lsystem(HashMap alpha_, HashMap rules_, String axiom_)
    {
        alphabet = alpha_;
        rules = rules_;
        axiom = axiom_;
    }

    void generate()
    {
        String next = "";
        Scanner sc = new Scanner(axiom);

        while(sc.hasNext()) {
            String current = sc.next();
            if (rules.containsKey(current)) {
                next = next + " " + rules.get(current);
            } else {
                next = next + " " + current;
            }
        }
        axiom = next;
    }

    void render()
    {
        Turtle t = new Turtle();
        renderWith(t);
    }

    void renderWith(Turtle turtle)
    {
        Scanner sc = new Scanner(axiom);

        while (sc.hasNext()) {
            String function = (String)alphabet.get(sc.next());
            if (function != null)
                turtle.execute(function);
        }
        
    }
}