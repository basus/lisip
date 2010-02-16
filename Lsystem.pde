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
        Scanner sc = new Scanner(axiom);
        turtle = new Turtle();

        while (sc.hasNext()) {
            String function = (String)alphabet.get(sc.next());
            turtle.execute(function);
        }
    }
}