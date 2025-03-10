class JobOpportunity {
  final String title;
  final String company;
  final String jobDescription;
  final String requirement;
  final String experience;
  final String education;
  final String img;

  JobOpportunity({
    required this.title,
    required this.company,
    required this.img,
    required this.jobDescription,
    required this.requirement,
    required this.experience,
    required this.education,
  });
}

List<JobOpportunity> jobOpportunities = [
  JobOpportunity(
    title: "Software Engineer",
    company: "Google",
    img: "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
    jobDescription:
        "As a Software Engineer at Google, you will design, develop, and deploy high-performance applications and services that power Google's core products. You will collaborate with cross-functional teams to build scalable systems, optimize performance, and enhance user experience. Your role will also involve writing clean, efficient, and maintainable code, as well as participating in code reviews and debugging complex issues.",
    requirement:
        "Proficiency in Java, Python, or Go. Strong problem-solving skills. Experience with cloud computing and distributed systems.",
    experience:
        "2+ years in software development with a focus on backend or full-stack development.",
    education:
        "Bachelor's degree in Computer Science or equivalent experience.",
  ),
  JobOpportunity(
    title: "UI/UX Designer",
    company: "Adobe",
    img: "https://cdn-icons-png.flaticon.com/512/888/888835.png",
    jobDescription:
        "As a UI/UX Designer at Adobe, you will create visually appealing and user-friendly interfaces for our creative suite applications. You will conduct user research, analyze user behavior, and design wireframes, prototypes, and high-fidelity mockups. Collaborating closely with developers and product managers, you will ensure a seamless user experience and enhance the overall usability of our products.",
    requirement:
        "Expertise in Figma, Adobe XD, and user research methodologies. Strong understanding of design principles, typography, and color theory.",
    experience:
        "3+ years in UI/UX design, with a portfolio showcasing successful projects.",
    education: "Bachelor's in Design, HCI, or related field.",
  ),
  JobOpportunity(
    title: "Data Scientist",
    company: "Netflix",
    img: "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png",
    jobDescription:
        "As a Data Scientist at Netflix, you will analyze large datasets to uncover insights that improve content recommendations, personalize user experiences, and optimize business strategies. You will build machine learning models, perform A/B testing, and develop predictive analytics solutions. Your work will directly impact Netflix’s ability to engage audiences and increase customer retention.",
    requirement:
        "Strong knowledge of machine learning, SQL, and statistical analysis. Experience with Python, R, or Scala for data modeling.",
    experience:
        "4+ years in data science or analytics, with experience in recommendation systems.",
    education:
        "Master's or Ph.D. in Data Science, Statistics, or a related field.",
  ),
  JobOpportunity(
    title: "Cybersecurity Analyst",
    company: "IBM",
    img: "https://logohistory.net/wp-content/uploads/2023/07/IBM-Logo-1956.png",
    jobDescription:
        "As a Cybersecurity Analyst at IBM, you will be responsible for monitoring, detecting, and mitigating security threats to protect enterprise systems and customer data. You will conduct vulnerability assessments, implement security protocols, and respond to security incidents. Additionally, you will work with teams to improve overall security posture and ensure compliance with industry standards.",
    requirement:
        "Experience with SIEM tools, penetration testing, and threat analysis. Knowledge of firewalls, encryption, and intrusion detection systems.",
    experience:
        "2+ years in cybersecurity, with a focus on network security or incident response.",
    education:
        "Bachelor’s in Cybersecurity, Information Security, or related field. Security certifications (CISSP, CEH) are a plus.",
  ),
  JobOpportunity(
    title: "Digital Marketing",
    company: "Amazon",
    img: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/1200px-Amazon_icon.svg.png",
    jobDescription:
        "As a Digital Marketing Specialist at Amazon, you will develop and execute digital marketing campaigns to enhance brand visibility, drive traffic, and boost sales. Your role will involve managing SEO strategies, running paid advertising campaigns (Google Ads, Facebook Ads), and optimizing content for different platforms. You will analyze campaign performance using analytics tools and make data-driven recommendations to improve ROI.",
    requirement:
        "Expertise in SEO, Google Ads, and social media marketing. Strong analytical skills and experience with marketing automation tools.",
    experience:
        "3+ years in digital marketing, with a track record of successful campaigns.",
    education: "Bachelor's in Marketing, Business, or a related field.",
  ),
   JobOpportunity(
    title: "Software Engineer",
    company: "Google",
    img:
        "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
    jobDescription:
        "As a Software Engineer at Google, you will design, develop, and deploy high-performance applications and services that power Google's core products. You will collaborate with cross-functional teams to build scalable systems, optimize performance, and enhance user experience. Your role will also involve writing clean, efficient, and maintainable code, as well as participating in code reviews and debugging complex issues.",
    requirement:
        "Proficiency in Java, Python, or Go. Strong problem-solving skills. Experience with cloud computing and distributed systems.",
    experience:
        "2+ years in software development with a focus on backend or full-stack development.",
    education:
        "Bachelor's degree in Computer Science or equivalent experience.",
  ),
  JobOpportunity(
    title: "UI/UX Designer",
    company: "Adobe",
    img: "https://cdn-icons-png.flaticon.com/512/888/888835.png",
    jobDescription:
        "As a UI/UX Designer at Adobe, you will create visually appealing and user-friendly interfaces for our creative suite applications. You will conduct user research, analyze user behavior, and design wireframes, prototypes, and high-fidelity mockups. Collaborating closely with developers and product managers, you will ensure a seamless user experience and enhance the overall usability of our products.",
    requirement:
        "Expertise in Figma, Adobe XD, and user research methodologies. Strong understanding of design principles, typography, and color theory.",
    experience:
        "3+ years in UI/UX design, with a portfolio showcasing successful projects.",
    education: "Bachelor's in Design, HCI, or related field.",
  ),
  JobOpportunity(
    title: "Data Scientist",
    company: "Netflix",
    img:
        "https://cdn4.iconfinder.com/data/icons/logos-and-brands/512/227_Netflix_logo-512.png",
    jobDescription:
        "As a Data Scientist at Netflix, you will analyze large datasets to uncover insights that improve content recommendations, personalize user experiences, and optimize business strategies. You will build machine learning models, perform A/B testing, and develop predictive analytics solutions. Your work will directly impact Netflix’s ability to engage audiences and increase customer retention.",
    requirement:
        "Strong knowledge of machine learning, SQL, and statistical analysis. Experience with Python, R, or Scala for data modeling.",
    experience:
        "4+ years in data science or analytics, with experience in recommendation systems.",
    education:
        "Master's or Ph.D. in Data Science, Statistics, or a related field.",
  ),
  JobOpportunity(
    title: "Cybersecurity Analyst",
    company: "IBM",
    img: "https://logohistory.net/wp-content/uploads/2023/07/IBM-Logo-1956.png",
    jobDescription:
        "As a Cybersecurity Analyst at IBM, you will be responsible for monitoring, detecting, and mitigating security threats to protect enterprise systems and customer data. You will conduct vulnerability assessments, implement security protocols, and respond to security incidents. Additionally, you will work with teams to improve overall security posture and ensure compliance with industry standards.",
    requirement:
        "Experience with SIEM tools, penetration testing, and threat analysis. Knowledge of firewalls, encryption, and intrusion detection systems.",
    experience:
        "2+ years in cybersecurity, with a focus on network security or incident response.",
    education:
        "Bachelor’s in Cybersecurity, Information Security, or related field. Security certifications (CISSP, CEH) are a plus.",
  ),
  JobOpportunity(
    title: "Digital Marketing",
    company: "Amazon",
    img:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/1200px-Amazon_icon.svg.png",
    jobDescription:
        "As a Digital Marketing Specialist at Amazon, you will develop and execute digital marketing campaigns to enhance brand visibility, drive traffic, and boost sales. Your role will involve managing SEO strategies, running paid advertising campaigns (Google Ads, Facebook Ads), and optimizing content for different platforms. You will analyze campaign performance using analytics tools and make data-driven recommendations to improve ROI.",
    requirement:
        "Expertise in SEO, Google Ads, and social media marketing. Strong analytical skills and experience with marketing automation tools.",
    experience:
        "3+ years in digital marketing, with a track record of successful campaigns.",
    education: "Bachelor's in Marketing, Business, or a related field.",
  ),
];
