/*
/*
 *   Example of "Form Template Method" refactoring.
 *
 *   Businesses and individuals are taxed differently
 *   on their purchases.  Individuals pay 3.5% tax on
 *   the full price.  Businesses pay 7% tax but on only
 *   90% of the price.  (Governments make exceptions like
 *   this all the time!)
 *
 *   Below, two subclasses have a method that is similar
 *   but not the same.
 */
class Customer {

}
class Individual extends Customer {
    double totalDue() {
        double cost = _price;
        double tax = cost * 0.035;   // don't put constants in your code like this!
        return cost + tax;
    }
}
class Business extends Customer {
    double totalDue() {
        double cost = _price * 0.90;  // this is done ...
        double tax = cost * 0.07;     // ... only to save space in the example!
        return cost + tax;
    }
}

abstract class Customer(
	abstract double tax;
		double totalDue(){
			return cost * (1+tax)
		}
}

*/


class Individual extends Customer {
	double tax = 0.07
}

class Business extends Customer {
	double tax = 0.063
}
