class ProfileItem {
  final String icon;
  final String text;

  ProfileItem({required this.icon, required this.text});
}

final List<ProfileItem> items = [
  ProfileItem(icon: 'assets/icons/orders.svg', text: 'Orders'),
  ProfileItem(icon: 'assets/icons/reserve.svg', text: 'Subscriptions'),
  ProfileItem(icon: 'assets/icons/notification.svg', text: 'Notifications'),
  ProfileItem(icon: 'assets/icons/addresses.svg', text: 'Addresses'),
  ProfileItem(icon: 'assets/icons/wishlist.svg', text: 'Wishlist'),
  ProfileItem(icon: 'assets/icons/edit.svg', text: 'Edit Profile'),
  ProfileItem(icon: 'assets/icons/share.svg', text: 'Share the app'),
  ProfileItem(icon: 'assets/icons/star.svg', text: 'Rate the app'),
  ProfileItem(icon: 'assets/icons/report.svg', text: 'Report an issue'),
  ProfileItem(icon: 'assets/icons/logout.svg', text: 'Logout'),
];
