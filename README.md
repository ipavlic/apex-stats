The stats library contains a simple `Stats` class for statistical calculations. It works on lists of `Decimal` numbers so that the required precision can be obtained.

# `Stats`

| Modifier and type | Method |
|-------------------|--------|
| `static Decimal` | `mean(List<Decimal> nums)`			|
| `static Decimal` | `geometricMean(List<Decimal> nums)`|
| `static Decimal` | `harmonicMean(List<Decimal> nums)`	|
| `static Decimal` | `median(List<Decimal> nums)`		|
| `static Decimal` | `lowerQuartile(List<Decimal> nums)`|
| `static Decimal` | `upperQuartile(List<Decimal> nums)`|
| `static Decimal` | `midhinge(List<Decimal> nums)`		|
| `static Decimal` | `min(List<Decimal> nums)`			|
| `static Decimal` | `max(List<Decimal> nums)`			|
| `static Decimal` | `range(List<Decimal> nums)`		|
| `static Decimal` | `midrange(List<Decimal> nums)`		|
| `static Decimal` | `mode(List<Decimal> nums)`			|
| `static Decimal` | `variance(List<Decimal> nums)`					|
| `static Decimal` | `sampleVariance(List<Decimal> nums)`			|
| `static Decimal` | `standardDeviation(List<Decimal> nums)`		|
| `static Decimal` | `sampleStandardDeviation(List<Decimal> nums)`	|
| `static Decimal` | `coefficientOfVariation(List<Decimal> nums)`	|

## Measures of centrality

### `mean`

Arithmetic mean.

### `geometricMean`

Geometric mean. All values need to be positive, otherwise it does not exist.

### `harmonicMean`

Harmonic mean. All values need to be positive, otherwise it does not exist.

### `median`

Median, considered to be the middle element for odd number of elements, and an arithmetic mean of two middle elements for even number of elements. For example, the median of (1, 2, 3, 4, 5) is 3, while the median of (1, 2, 3, 4) is 2.5.

### `lowerQuartile`

Median of those elements that are *smaller* than the median. For example, in list (1, 2, 3, 4, 5, 6, 7), the median is 4. (1, 2, 3) are smaller than 4, therefore the `lowerQuartile` is the median of that list, which is 2.

### `upperQuartile`

Median of those elements that are *larger* than the median. For example, in list (1, 2, 3, 4, 5, 6, 7), the median is 4. (5, 6, 7) are smaller than 4, therefore the `upperQuartile` is the median of that list, which is 6.

### `midhinge`

Mean of `lowerQuartile` and `upperQuartile` values.

### `min`

Minimal value.

### `max`

Maximal value.

### `range`

Range of all values, which is the difference between `max` and `min` values.

### `midrange`

Mean of `min` and `max` values.

### `mode`

Value that appears most often in the list. This might not be a unique value.

## Measures of dispersion

### `variance`

Variance of values.

### `sampleVariance`

Variance of values corrected for bias.

### `standardDeviation`

Standard deviation of values, calculated as a square root of `variance`.

### `sampleStandardDeviation`

Standard deviation corrected for bias, calculated as a square root of `sampleVariance`.

### `coefficientOfVariation`

Calculated as `standardDeviation` divided by `mean`.
