/// Represents the size of an icon.
///
/// The [IconSize] enum provides predefined sizes for icons, ranging from xSmall to xxLarge.
/// Each size has a corresponding value that represents its dimensions.
enum IconSize {
  /// [xSmall] - [5]
  xSmall(5),

  /// [small] - [10]
  small(10),

  /// [medium] - [15]
  smallX(15),

  /// [medium] - [20]
  medium(25),

  /// [large] - [50]
  large(50),

  /// [xLarge] - [80]
  xLarge(80),

  /// [xxLarge] - [100]
  xxLarge(100),
  ;

  /// Constructs an [IconSize] with the specified [value].
  const IconSize(this.value);
  final double value;
}
