@IsTest
public class StatsTest {
	@IsTest
	public static void testMin() {
		List<Decimal> nums = new List<Decimal>{2.7, 1.0, 5.0, 4.3};
		Stats s = new Stats(nums);
		System.assertEquals(1.0, s.min());
	}
	@IsTest
	public static void testMax() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 4.3};
		Stats s = new Stats(nums);
		System.assertEquals(5.0, s.max());
	}
	@IsTest
	public static void testRange() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0};
		Stats s = new Stats(nums);
		System.assertEquals(4.0, s.range());
	}
	@IsTest
	public static void testOddMedian() {
		List<Decimal> nums = new List<Decimal>{2.0, 1.0, 6.0};
		Stats s = new Stats(nums);
		System.assertEquals(2.0, s.median());
	}
	@IsTest
	public static void testEvenMedian() {
		List<Decimal> nums = new List<Decimal>{2.0, 1.0, 4.0, 6.0};
		Stats s = new Stats(nums);
		System.assertEquals(3.0, s.median());
	}
	@IsTest
	public static void testMean() {
		List<Decimal> nums = new List<Decimal>{2.0, 1.0, 6.0};
		Stats s = new Stats(nums);
		System.assertEquals(3.0, s.mean());
	}
	@IsTest
	public static void testVariance() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(10.0 / 5, s.variance());
	}
	@IsTest
	public static void testSampleVariance() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(10.0 / 4, s.sampleVariance());
	}
	@IsTest
	public static void testStandardDeviation() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(Math.sqrt(10.0/5), s.standardDeviation());
	}
	@IsTest
	public static void testSampleStandardDeviation() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(Math.sqrt(10.0/4), s.sampleStandardDeviation());
	}
	@IsTest
	public static void testCoefficientOfVariation() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(s.standardDeviation() / s.mean(), s.coefficientOfVariation());
	}
	@IsTest
	public static void testMode() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 3.0, 2.0, 3.0, 2.0};
		Stats s = new Stats(nums);
		System.assertEquals(3.0, s.mode());
	}
	@IsTest
	public static void testLowerQuartileEven() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		// split at median (3.5) and get a new median of the lower half ([1, 2, 3])
		Stats s = new Stats(nums);
		System.assertEquals(2.0, s.lowerQuartile());
	}
	@IsTest
	public static void testLowerQuartileOdd() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6, 7};
		// split at median (4) and get a new median of the lower half ([1, 2, 3])
		Stats s = new Stats(nums);
		System.assertEquals(2.0, s.lowerQuartile()); 
	}
	@IsTest
	public static void testUpperQuartileEven() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		// split at median (3.5) and get a new median of the upper half ([4, 5, 6])
		Stats s = new Stats(nums);
		System.assertEquals(5.0, s.upperQuartile());
	}
	@IsTest
	public static void testUpperQuartileOdd() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6, 7};
		// split at median (4) and get a new median of the upper half ([5, 6, 7])
		Stats s = new Stats(nums);
		System.assertEquals(6.0, s.upperQuartile());
	}
	@IsTest
	public static void testGeometricMean() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		Stats s = new Stats(nums);
		// sixth root of 1*2*3*4*5*6 = 720 is approximately 2.9937951...
		TestUtility.assertEqualsEpsilon(2.9937951, s.geometricMean());

		s = new Stats(new List<Decimal>{1, -3, 2});
		System.assertEquals(null, s.geometricMean());

		s = new Stats(new List<Decimal>{7.5});
		TestUtility.assertEqualsEpsilon(7.5, s.geometricMean());
	}
	@IsTest
	public static void testHarmonicMean() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		Stats s = new Stats(nums);
		// 1 + 1/2 + 1/3 + 1/4 + 1/5 + 1/6 = (120 + 60 + 40 + 30 + 24 + 20) / 120
		// 6/1/294/120 = 1/1/49/120 = 120/49 ~ 2.4489795
		TestUtility.assertEqualsEpsilon(2.4489795, s.harmonicMean());

		s = new Stats(new List<Decimal>{1, -3, 2});
		System.assertEquals(null, s.harmonicMean());

		s = new Stats(new List<Decimal>{7.5});
		TestUtility.assertEqualsEpsilon(7.5, s.harmonicMean());
	}
	@IsTest
	public static void testMidrange() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(Decimal.valueOf(7)/2, s.midrange());
	}
	@IsTest
	public static void testMidhinge() {
		List<Decimal> nums = new List<Decimal>{1, 3, 4, 5, 7, 8};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(Decimal.valueOf(10)/2, s.midhinge());
	}
	@IsTest
	public static void testTrimean() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 5, 6, 7, 9};
		Stats s = new Stats(nums);
		TestUtility.assertEqualsEpsilon(Decimal.valueOf(2 + 5 + 7)/3, s.trimean());
	}
}