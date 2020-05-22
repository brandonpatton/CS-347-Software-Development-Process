/*
 *    Initial version
 */
class Person {
    private String _name;
    private String _officeAreaCode;
    private String _officeNumber;

    public String getName() {
        return _name;
    }

    public String getPhoneNumber() {
        return "(" + _officeAreaCode + ") " + _officeNumber;
    }
}

/*
 *   After first two steps:
 *     1. Decide how to split responsibilities then create new class
 *     2. Give old class an instance variable that refers to object of new class
 */
class Office {
	private String_officeAreaCode;
	private String_officeNumber;
	public String getPhoneNumber(){
		return "(" + _officeAreaCode +") " + _office