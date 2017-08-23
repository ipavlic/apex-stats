The stats library contains a simple `Stats` class for statistical calculations. It works on lists of `Decimal` numbers so that the required precision can be obtained.

    List<Decimal> values = { ... };
	Stats s = new Stats(values);

Once a `Stats` instance is constructed, methods on it can be used to calculate statistical information, for example:

	Decimal mean = s.mean();
	Decimal sd = s.standardDeviation();
	...

# Measures of centrality

* `mean`
* `geometricMean`
* `harmonicMean`
* `median`
* `lowerQuartile`
* `upperQuartile`
* `midhinge`
* `min`
* `max`
* `range`
* `midrange`
* `mode`

## `mean`

Arithmetic mean.

## `geometricMean`

Geometric mean. All values need to be positive, otherwise it does not exist.

## `harmonicMean`

Harmonic mean. All values need to be positive, otherwise it does not exist.

## `median`

Median, considered to be the middle element for odd number of elements, and an arithmetic mean of two middle elements for even number of elements. For example, the median of (1, 2, 3, 4, 5) is 3, while the median of (1, 2, 3, 4) is 2.5. 

## `lowerQuartile`

Median of those elements that are *smaller* than the median. For example, in list (1, 2, 3, 4, 5, 6, 7), the median is 4. (1, 2, 3) are smaller than 4, therefore the `lowerQuartile` is the median of that list, which is 2.

## `upperQuartile`

Median of those elements that are *larger* than the median. For example, in list (1, 2, 3, 4, 5, 6, 7), the median is 4. (5, 6, 7) are smaller than 4, therefore the `upperQuartile` is the median of that list, which is 6.

## `midhinge`

Mean of `lowerQuartile` and `upperQuartile` values.

## `min`

Minimal value.

## `max`

Maximal value.

## `range`

Range of all values, which is the difference between `max` and `min` values.

## `midrange`

Mean of `min` and `max` values.

## `mode`

Value that appears most often in the list. This might not be a unique value.

# Measures of dispersion

* `variance`
* `sampleVariance`
* `standardDeviation`
* `sampleStandardDeviation`
* `coefficientOfVariation`

## `variance`

Variance of values.

## `sampleVariance`

Variance of values corrected for bias.

## `standardDeviation`

Standard deviation of values, calculated as a square root of `variance`.

## `sampleStandardDeviation`

Standard deviation corrected for bias, calculated as a square root of `sampleVariance`.

## `coefficientOfVariation`

Calculated as `standardDeviation` divided by `mean`.