public class TestUtility {

	private static final Double DEFAULT_EPSILON = 0.0001;

	public static void assertEqualsEpsilon(Decimal expected, Decimal actual) {
		assertEqualsEpsilon(expected, actual, DEFAULT_EPSILON);
	}

	public static void assertEqualsEpsilon(Decimal expected, Decimal actual, Decimal epsilon) {
		Decimal delta = Math.abs(expected - actual);
		System.assert(delta < epsilon, 'delta is ' + delta + ', expected epsilon is ' + epsilon);
	}
}