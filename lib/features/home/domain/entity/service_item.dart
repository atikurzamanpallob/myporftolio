import '../../../../core/app_resources/app_icons.dart';

class ServiceItem {
  String title;
  String desc;
  String icon;
  ServiceItem({required this.title, required this.desc, required this.icon});
}

List<ServiceItem> serviceItems = [
  ServiceItem(
    icon: AppIcons.mobile,
    title: 'Cross-Platform Apps',
    desc: 'Build once and ship on multi-platforms like android, ios & web',
  ),
  ServiceItem(
    icon: AppIcons.painter,
    title: 'Beautiful UI/UX',
    desc: 'Crafting clean, modern and intuitive user experience',
  ),
  ServiceItem(
    icon: AppIcons.meter,
    title: 'Performance Focused',
    desc: 'Optimized apps that are fast smooth and reliable',
  ),
  ServiceItem(
    icon: AppIcons.cloud,
    title: 'Backend Integration',
    desc: 'REST APIs, Firebase and more',
  ),
];
