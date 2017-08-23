public class Stats {
	private static Boolean isOdd(List<Decimal> nums) {
		Integer size = nums.size();
		return Math.mod(size, 2) == 0;
	}

	private static List<Decimal> sort(List<Decimal> nums) {
		List<Decimal> ordered = new List<Decimal>(nums);
		ordered.sort();
		return ordered;
	}

	public static Decimal median(List<Decimal> nums) {
		List<Decimal> ordered = sort(nums);
		Integer mid = ordered.size() / 2;
		if (isOdd(ordered)) {
			return (ordered[mid] + ordered[mid - 1]) / 2;
		} else {
			return ordered[mid];
		}
	}

	public static Decimal lowerQuartile(List<Decimal> nums) {
		List<Decimal> ordered = sort(nums);
		List<Decimal> range = new List<Decimal>();
		Integer size = nums.size();
		for (Integer i = 0; i < size/2; i++) {
			range.add(ordered[i]);
		}
		return median(range);
	}

	public static Decimal upperQuartile(List<Decimal> nums) {
		List<Decimal> ordered = sort(nums);
		List<Decimal> range = new List<Decimal>();
		Integer size = nums.size();
		Integer mid = isOdd(ordered) ? size/2 : (size/2 + 1);
		for (Integer i = mid; i < size; i++) {
			range.add(ordered[i]);
		}
		return median(range);
	}

	public static Decimal max(List<Decimal> nums) {
		List<Decimal> ordered = sort(nums);
		return ordered[ordered.size() - 1];
	}

	public static Decimal min(List<Decimal> nums) {
		List<Decimal> ordered = sort(nums);
		return ordered[0];
	}

	public static Decimal mean(List<Decimal> nums) {
		Decimal total = 0.0;
		for (Decimal n : nums) {
			total += n;
		}
		return total / nums.size();
	}

	private static Boolean isPositive(List<Decimal> nums) {
		for (Decimal n : nums) {
			if (n < 0) {
				return false;
			}
		}
		return true;
	}

	public static Decimal geometricMean(List<Decimal> nums) {
		if (isPositive(nums) == false) {
			return null;
		}
		Integer size = nums.size();
		if (size == 1) {
			return nums[0];
		}
		Decimal product = 1.0;
		for (Decimal n : nums) {
			product *= n;
		}
		// logarithmic extraction of root; r^n = x ==> r = e^(log x / n)
		return Math.exp(Math.log(product) / size);
	}

	public static Decimal harmonicMean(List<Decimal> nums) {
		if (isPositive(nums) == false) {
			return null;
		}
		Integer size = nums.size();
		if (size == 1) {
			return nums[0];
		}
		Decimal sum = 0.0;
		for (Decimal n : nums) {
			sum += (1/n);
		}
		return Decimal.valueOf(size) / sum;
	}

	public static Decimal midrange(List<Decimal> nums) {
		return (max(nums) + min(nums)) / 2;
	}

	public static Decimal midhinge(List<Decimal> nums) {
		return (lowerQuartile(nums) + upperQuartile(nums)) / 2;
	}

	public static Decimal trimean(List<Decimal> nums) {
		return (lowerQuartile(nums) + median(nums) + upperQuartile(nums)) / 3;
	}

	public static Decimal mode(List<Decimal> nums) {
		Map<Decimal, Integer> counts = new Map<Decimal, Integer>();
		for (Decimal n : nums) {
			Integer c = counts.get(n);
			if (c == null) {
				counts.put(n, 1);
			} else {
				counts.put(n, c + 1);
			}
		}
		Integer maxCount = 0;
		Decimal mode = null;
		for (Decimal key : counts.keySet()) {
			Integer c = counts.get(key);
			if (c > maxCount) {
				mode = key;
				maxCount = counts.get(key);
			}
		}
		return mode;
	}

	public static Decimal range(List<Decimal> nums) {
		return max(nums) - min(nums);
	}

	private static Decimal sumOfSquares(List<Decimal> nums) {
		Decimal m = mean(nums);
		Decimal sum = 0.0;
		for (Decimal x : nums) {
			sum += (x - m).pow(2);
		}
		return sum;
	}

	public static Decimal variance(List<Decimal> nums) {
		return sumOfSquares(nums) / nums.size();
	}

	public static Decimal sampleVariance(List<Decimal> nums) {
		return sumOfSquares(nums) / (nums.size() - 1);
	}

	public static Decimal standardDeviation(List<Decimal> nums) {
		return Math.sqrt(variance(nums));
	}

	public static Decimal sampleStandardDeviation(List<Decimal> nums) {
		return Math.sqrt(sampleVariance(nums));
	}

	public static Decimal coefficientOfVariation(List<Decimal> nums) {
		return standardDeviation(nums) / mean(nums);
	}
}
