class Ingredient {
  Ingredient({
    required this.title,
    required this.children,
  });

  final String title;
  final List<String> children;
}

List<Ingredient> ingredientsList = [
  Ingredient(
    title: 'Fruit Juices',
    children: [
      'Orange Juice',
      'Pineapple Juice',
      'Cranberry Juice',
      'Grapefruit Juice',
      'Apple Juice',
      'Lime Juice',
      'Lemon Juice',
    ],
  ),
  Ingredient(
    title: 'Soda and Cola',
    children: [
      'Cola',
      'Ginger Beer',
      'Sprite/7UP',
      'Tonic Water',
      'Club Soda',
    ],
  ),
  Ingredient(
    title: 'Mixers',
    children: [
      'Fresh Lime Juice',
      'Fresh Lemon Juice',
      'Simple Syrup',
      'Agave Nectar',
      'Grenadine',
      'Coconut Cream',
    ],
  ),
  Ingredient(
    title: 'Spirits',
    children: [
      'Vodka',
      'Gin',
      'Rum (Dark)',
      'Rum (Light)',
      'Tequila (Blanco)',
      'Tequila (Añejo)',
      'Bourbon',
      'Whiskey (Rye)',
      'Whiskey (Scotch)',
      'Whiskey (Irish)',
    ],
  ),
  Ingredient(
    title: 'Bitters',
    children: [
      'Angostura Bitters',
      'Peychaud\'s Bitters',
      'Orange Bitters',
      'Chocolate Bitters',
    ],
  ),
  Ingredient(
    title: 'Liqueurs',
    children: [
      'Triple Sec',
      'Grand Marnier',
      'Amaretto',
      'Baileys Irish Cream',
      'Cointreau',
      'Kahlúa',
      'Campari',
      'St-Germain (Elderflower Liqueur)',
      'Blue Curaçao',
    ],
  ),
  Ingredient(
    title: 'Herbs and Spices',
    children: [
      'Mint Leaves',
      'Basil Leaves',
      'Rosemary',
      'Cinnamon Sticks',
      'Nutmeg',
      'Star Anise',
    ],
  ),
  Ingredient(
    title: 'Sweeteners',
    children: [
      'Simple Syrup',
      'Agave Syrup',
      'Grenadine',
      'Honey',
      'Maple Syrup',
    ],
  ),
  Ingredient(
    title: 'Garnishes',
    children: [
      'Maraschino Cherries',
      'Orange Twists',
      'Lemon Zest',
      'Lime Wedges',
      'Cocktail Olives',
      'Cucumber Slices',
    ],
  ),
];
