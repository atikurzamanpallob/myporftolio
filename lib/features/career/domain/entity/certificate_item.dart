class CertificationItem {
  const CertificationItem({
    required this.id,
    required this.title,
    required this.issuer,
    required this.certificateUrl,
    required this.certificateImageUrl,
  });
  final int id;
  final String title;
  final String issuer;
  final String certificateUrl;
  final String certificateImageUrl;
}

List<CertificationItem> fallBackItems = [
  CertificationItem(
    id: 1,
    title: "Machine Learning",
    issuer: "Coursera",
    certificateUrl:
        "https://www.coursera.org/account/accomplishments/verify/YKX8VTBS4WLH",
    certificateImageUrl:
        "https://ycxmalbladgeeamoobda.supabase.co/storage/v1/object/public/certifications/machine_learning.png",
  ),
  CertificationItem(
    id: 2,
    title: "Problem Solving",
    issuer: "Hacker Rank",
    certificateUrl: "https://www.hackerrank.com/certificates/513803eae9e8",
    certificateImageUrl:
        "https://ycxmalbladgeeamoobda.supabase.co/storage/v1/object/public/certifications/problem_solving.png",
  ),
  CertificationItem(
    id: 3,
    title: "Java",
    issuer: "Hacker Rank",
    certificateUrl: "https://www.hackerrank.com/certificates/b33b2982ec46",
    certificateImageUrl:
        "https://ycxmalbladgeeamoobda.supabase.co/storage/v1/object/public/certifications/java.png",
  ),
  CertificationItem(
    id: 4,
    title: "C++",
    issuer: "Hacker Rank",
    certificateUrl: "https://www.hackerrank.com/certificates/33e0ff947329",
    certificateImageUrl:
        "https://ycxmalbladgeeamoobda.supabase.co/storage/v1/object/public/certifications/c++.png",
  ),
];
