import '../../../../core/app_resources/app_icons.dart';

/// Filter categories shown in the pill bar above the blog list.
enum BlogCategory {
  all('All'),
  flutter('Flutter'),
  firebase('Firebase'),
  node('Node'),
  problemSolving('Problem Solving');

  const BlogCategory(this.label);
  final String label;
}

class BlogPost {
  const BlogPost({
    required this.title,
    required this.excerpt,
    required this.category,
    required this.date,
    required this.readTime,
    this.thumbnailIcon = AppIcons.flutter,
  });

  final String title;
  final String excerpt;
  final BlogCategory category;
  final String date;
  final String readTime;

  /// Icon shown inside the placeholder thumbnail. Swap [BlogCard] for a
  /// real cover-image asset once you have one per post.
  final String thumbnailIcon;

  bool matches(BlogCategory filter) =>
      filter == BlogCategory.all || category == filter;
}

/// Sample data mirroring the Figma "Blogs" page. Update freely — or wire
/// this up to a CMS/API later.
const List<BlogPost> kBlogPosts = [
  BlogPost(
    title: 'How I improved App performance in Flutter',
    excerpt:
        'A deep dive into techniques that i use to make flutter apps '
        'faster and smother',
    category: BlogCategory.flutter,
    date: '12 July 2024',
    readTime: '5 minutes read',
  ),
  BlogPost(
    title: 'How I improved App performance in Flutter',
    excerpt:
        'A deep dive into techniques that i use to make flutter apps '
        'faster and smother',
    category: BlogCategory.flutter,
    date: '12 July 2024',
    readTime: '5 minutes read',
  ),
  BlogPost(
    title: 'How I improved App performance in Flutter',
    excerpt:
        'A deep dive into techniques that i use to make flutter apps '
        'faster and smother',
    category: BlogCategory.flutter,
    date: '12 July 2024',
    readTime: '5 minutes read',
  ),
];
