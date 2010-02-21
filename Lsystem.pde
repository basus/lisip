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