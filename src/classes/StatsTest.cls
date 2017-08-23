@IsTest
public class StatsTest {
	@IsTest
	public static void testMin() {
		List<Decimal> nums = new List<Decimal>{2.7, 1.0, 5.0, 4.3};
		System.assertEquals(1.0, Stats.min(nums));
	}
	@IsTest
	public static void testMax() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 4.3};
		System.assertEquals(5.0, Stats.max(nums));
	}
	@IsTest
	public static void testRange() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0};
		System.assertEquals(4.0, Stats.range(nums));
	}
	@IsTest
	public static void testOddMedian() {
		List<Decimal> nums = new List<Decimal>{2.0, 1.0, 6.0};
		System.assertEquals(2.0, Stats.median(nums));
	}
	@IsTest
	public static void testEvenMedian() {
		List<Decimal> nums = new List<Decimal>{2.0, 1.0, 4.0, 6.0};
		System.assertEquals(3.0, Stats.median(nums));
	}
	@IsTest
	public static void testMean() {
		List<Decimal> nums = new List<Decimal>{2.0, 1.0, 6.0};
		System.assertEquals(3.0, Stats.mean(nums));
	}
	@IsTest
	public static void testVariance() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		TestUtility.assertEqualsEpsilon(10.0 / 5, Stats.variance(nums));
	}
	@IsTest
	public static void testSampleVariance() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		TestUtility.assertEqualsEpsilon(10.0 / 4, Stats.sampleVariance(nums));
	}
	@IsTest
	public static void testStandardDeviation() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		TestUtility.assertEqualsEpsilon(Math.sqrt(10.0/5), Stats.standardDeviation(nums));
	}
	@IsTest
	public static void testSampleStandardDeviation() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		TestUtility.assertEqualsEpsilon(Math.sqrt(10.0/4), Stats.sampleStandardDeviation(nums));
	}
	@IsTest
	public static void testCoefficientOfVariation() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 2.0, 4.0};
		TestUtility.assertEqualsEpsilon(Stats.standardDeviation(nums) / Stats.mean(nums), Stats.coefficientOfVariation(nums));
	}
	@IsTest
	public static void testMode() {
		List<Decimal> nums = new List<Decimal>{1.0, 5.0, 3.0, 3.0, 2.0, 3.0, 2.0};
		System.assertEquals(3.0, Stats.mode(nums));
	}
	@IsTest
	public static void testLowerQuartileEven() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		// split at median (3.5) and get a new median of the lower half ([1, 2, 3])
		System.assertEquals(2.0, Stats.lowerQuartile(nums));
	}
	@IsTest
	public static void testLowerQuartileOdd() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6, 7};
		// split at median (4) and get a new median of the lower half ([1, 2, 3])
		System.assertEquals(2.0, Stats.lowerQuartile(nums));
	}
	@IsTest
	public static void testUpperQuartileEven() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		// split at median (3.5) and get a new median of the upper half ([4, 5, 6])
		System.assertEquals(5.0, Stats.upperQuartile(nums));
	}
	@IsTest
	public static void testUpperQuartileOdd() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6, 7};
		// split at median (4) and get a new median of the upper half ([5, 6, 7])
		System.assertEquals(6.0, Stats.upperQuartile(nums));
	}
	@IsTest
	public static void testGeometricMean() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		// sixth root of 1*2*3*4*5*6 = 720 is approximately 2.9937951...
		TestUtility.assertEqualsEpsilon(2.9937951, Stats.geometricMean(nums));

		System.assertEquals(null, Stats.geometricMean(new List<Decimal>{1, -3, 2}));

		TestUtility.assertEqualsEpsilon(7.5, Stats.geometricMean(new List<Decimal>{7.5}));
	}
	@IsTest
	public static void testHarmonicMean() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		// 1 + 1/2 + 1/3 + 1/4 + 1/5 + 1/6 = (120 + 60 + 40 + 30 + 24 + 20) / 120
		// 6/1/294/120 = 1/1/49/120 = 120/49 ~ 2.4489795
		TestUtility.assertEqualsEpsilon(2.4489795, Stats.harmonicMean(nums));

		System.assertEquals(null, Stats.harmonicMean(new List<Decimal>{1, -3, 2}));

		TestUtility.assertEqualsEpsilon(7.5, Stats.harmonicMean(new List<Decimal>{7.5}));
	}
	@IsTest
	public static void testMidrange() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 4, 5, 6};
		TestUtility.assertEqualsEpsilon(Decimal.valueOf(7)/2, Stats.midrange(nums));
	}
	@IsTest
	public static void testMidhinge() {
		List<Decimal> nums = new List<Decimal>{1, 3, 4, 5, 7, 8};
		TestUtility.assertEqualsEpsilon(Decimal.valueOf(10)/2, Stats.midhinge(nums));
	}
	@IsTest
	public static void testTrimean() {
		List<Decimal> nums = new List<Decimal>{1, 2, 3, 5, 6, 7, 9};
		TestUtility.assertEqualsEpsilon(Decimal.valueOf(2 + 5 + 7)/3, Stats.trimean(nums));
	}
}
