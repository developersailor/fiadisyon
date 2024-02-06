/// Enum representing the paths used by the product service.
enum ProductServicePath {
  /// Path for authentication.
  auth('/api/auth/local/'),
  register('/api/auth/local/register/'),
  forgotPassword('/api/auth/forgot-password/'),
  changePassword('/api/auth/change-password/'),
  emailConfirmation('/api/auth/send-email-confirmation/'),
  sendEmailConfirmation('/api/auth/send-email-confirmation/'),
  bills('/api/bills/'),
  orders('/api/orders/'),
  orderProducts('/api/order-products/'),
  products('/api/products/'),
  tables('/api/tables/');

  /// Constructs a [ProductServicePath] with the given [value].
  const ProductServicePath(this.value);

  final String value;
}
