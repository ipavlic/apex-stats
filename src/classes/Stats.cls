public class Stats {
	List<Decimal> nums;

	public Stats(List<Decimal> numbers) {
		// copy the list of numbers to be used internally
		nums = new List<Decimal>(numbers);
		nums.sort();
	}

	// helper methods
	private Boolean isOdd() {
		Integer size = nums.size();
		return Math.mod(size, 2) == 0;
	}

	private Boolean isPositive() {
		for (Decimal n : nums) {
			if (n < 0) {
				return false;
			}
		}
		return true;
	}

	// measures of central tendency
	public Decimal mean() {
		Decimal total = 0.0;
		for (Decimal n : nums) {
			total += n;
		}
		return total / nums.size();
	}

	public Decimal geometricMean() {
		if (isPositive() == false) {
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
		// logarithmic extraction of root to keep decimal precision
		// r^n = x ==> r = e^(log x / n)
		return Math.exp(Math.log(product) / size);
	}

	public Decimal harmonicMean() {
		if (isPositive() == false) {
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

	/**
	 * Median is calculated as the middle of a sorted list when the number of
	 * list elements is odd, and as the as the mean of two middle elements when
	 * it is even;
	 */
	public Decimal median() {
		Integer mid = nums.size() / 2;
		if (isOdd()) {
			return (nums[mid] + nums[mid - 1]) / 2;
		} else {
			return nums[mid];
		}
	}

	public Decimal lowerQuartile() {
		List<Decimal> range = new List<Decimal>();
		Integer size = nums.size();
		for (Integer i = 0; i < size/2; i++) {
			range.add(nums[i]);
		}
		return new Stats(range).median();
	}

	public Decimal upperQuartile() {
		List<Decimal> range = new List<Decimal>();
		Integer size = nums.size();
		Integer mid = isOdd() ? size/2 : (size/2 + 1);
		for (Integer i = mid; i < size; i++) {
			range.add(nums[i]);
		}
		return new Stats(range).median();
	}

	public Decimal midhinge() {
		return (lowerQuartile() + upperQuartile()) / 2;
	}

	public Decimal trimean() {
		return (lowerQuartile() + median() + upperQuartile()) / 3;
	}

	public Decimal min() {
		return nums[0];
	}

	public Decimal max() {
		return nums[nums.size() - 1];
	}

	public Decimal range() {
		return max() - min();
	}

	public Decimal midrange() {
		return (max() + min()) / 2;
	}

	public Decimal mode() {
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

	private Decimal sumOfErrorSquares() {
		Decimal m = mean();
		Decimal sum = 0.0;
		for (Decimal x : nums) {
			sum += (x - m).pow(2); 
		}
		return sum;
	}

	// measures of dispersion
	public Decimal variance() {
		return sumOfErrorSquares() / nums.size();
	}

	public Decimal sampleVariance() {
		return sumOfErrorSquares() / (nums.size() - 1);
	}

	public Decimal standardDeviation() {
		return Math.sqrt(variance());
	}

	public Decimal sampleStandardDeviation() {
		return Math.sqrt(sampleVariance());
	}

	public Decimal coefficientOfVariation() {
		return standardDeviation() / mean();
	}
}