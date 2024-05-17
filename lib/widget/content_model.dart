class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: 'Pick your item from our menu \n    more than 10 times',
      image: 'assets/images/22.png',
      title: 'Choose As Per Your Wish'
  ),

  UnboardingContent(
      description: "You can pay cash on delivery and\n    Card payment is available",
      image: 'assets/images/wallet2.png',
      title: 'Easy and Online Payment'
  ),

  UnboardingContent(
      description: 'Pick your item from our menu \n      more than 10 times',
      image: 'assets/images/77.png',
      title: 'Select Form Our\n    Best Menu'
  ),  
];
