class Recipe {
  Recipe({
    required this.id,
    required this.title,
    required this.rate,
    required this.description,
    required this.ingredients,
    required this.preparation,
  });

  final int id;
  final String title;
  final double rate;
  final String description, ingredients, preparation;
}

final List<Recipe> cocktailRecipes = [
  Recipe(
    id: 1,
    title: "Mojito",
    rate: 4.8,
    description: "A refreshing mint and lime cocktail.",
    ingredients: """
    1. 50ml White Rum
    2. 30ml Lime Juice
    3. 20ml Sugar Syrup
    4. Mint Leaves
    5. Soda Water""",
    preparation:
        "Muddle mint leaves with lime juice and sugar syrup. Add rum, ice, and top with soda water. Stir well.",
  ),
  Recipe(
    id: 4,
    title: "Margarita",
    rate: 4.7,
    description: "A classic tequila-based cocktail with a citrus twist.",
    ingredients: """
    1. 50ml Tequila
    2. 25ml Lime Juice
    3. 20ml Triple Sec
    4. Salt for the Rim""",
    preparation:
        "Shake tequila, lime juice, and triple sec with ice. Strain into a salt-rimmed glass.",
  ),
  Recipe(
    id: 6,
    title: "Old Fashioned",
    rate: 4.9,
    description: "A timeless whiskey cocktail.",
    ingredients: """
    1. 60ml Bourbon Whiskey
    2. 1 Sugar Cube
    3. 2 Dashes Angostura Bitters
    4. Orange Peel""",
    preparation:
        "Muddle sugar with bitters. Add whiskey and ice. Stir and garnish with orange peel.",
  ),
  Recipe(
    id: 2,
    title: "Martini",
    rate: 4.6,
    description: "A sophisticated gin cocktail.",
    ingredients: """
    1. 60ml Gin
    2. 10ml Dry Vermouth
    3. Lemon Twist""",
    preparation:
        "Stir gin and vermouth with ice. Strain into a chilled glass and garnish with a lemon twist.",
  ),
  Recipe(
    id: 2,
    title: "Cosmopolitan",
    rate: 4.5,
    description: "A vibrant and fruity cocktail.",
    ingredients: """
    1. 40ml Vodka
    2. 20ml Triple Sec
    3. 20ml Cranberry Juice
    4. 10ml Lime Juice""",
    preparation:
        "Shake all ingredients with ice and strain into a chilled glass.",
  ),
  Recipe(
    id: 9,
    title: "Whiskey Sour",
    rate: 4.7,
    description: "A sour and sweet whiskey drink.",
    ingredients: """
    1. 50ml Whiskey
    2. 25ml Lemon Juice
    3. 15ml Sugar Syrup
    4. Egg White (optional)""",
    preparation:
        "Shake all ingredients with ice and strain into a glass. Garnish with a cherry.",
  ),
  Recipe(
    id: 3,
    title: "Pina Colada",
    rate: 4.8,
    description: "A tropical coconut and pineapple drink.",
    ingredients: """
    1. 50ml White Rum
    2. 50ml Coconut Cream
    3. 100ml Pineapple Juice""",
    preparation: "Blend all ingredients with ice. Serve in a chilled glass.",
  ),
  Recipe(
    id: 6,
    title: "Negroni",
    rate: 4.6,
    description: "A bitter and strong gin cocktail.",
    ingredients: """
    1. 25ml Gin
    2. 25ml Campari
    3. 25ml Sweet Vermouth""",
    preparation: "Stir all ingredients with ice. Serve with an orange slice.",
  ),
  Recipe(
    id: 4,
    title: "Daiquiri",
    rate: 4.4,
    description: "A simple and refreshing rum cocktail.",
    ingredients: """
    1. 50ml White Rum
    2. 25ml Lime Juice
    3. 15ml Sugar Syrup""",
    preparation: "Shake with ice and strain into a chilled glass.",
  ),
  Recipe(
    id: 1,
    title: "Moscow Mule",
    rate: 4.5,
    description: "A spicy and refreshing vodka drink.",
    ingredients: """
    1. 50ml Vodka
    2. 20ml Lime Juice
    3. Ginger Beer
    4. Lime Wedge""",
    preparation:
        "Pour vodka and lime juice over ice. Top with ginger beer and garnish with lime.",
  ),
  Recipe(
    id: 1,
    title: "Gin and Tonic",
    rate: 4.7,
    description: "A classic gin cocktail.",
    ingredients: """
    1. 50ml Gin
    2. Tonic Water
    3. Lemon Slice""",
    preparation:
        "Pour gin over ice and top with tonic water. Garnish with a lemon slice.",
  ),
  Recipe(
    id: 10,
    title: "Bloody Mary",
    rate: 4.3,
    description: "A savory and spicy vodka drink.",
    ingredients: """
    1. 50ml Vodka
    2. 100ml Tomato Juice
    3. 10ml Lemon Juice
    4. 2 Dashes Hot Sauce
    5. Celery Salt""",
    preparation: "Shake all ingredients with ice. Serve with a celery stick.",
  ),
  Recipe(
    id: 10,
    title: "Tequila Sunrise",
    rate: 4.4,
    description: "A colorful tequila drink.",
    ingredients: """
    1. 50ml Tequila
    2. 100ml Orange Juice
    3. 10ml Grenadine""",
    preparation:
        "Pour tequila and orange juice over ice. Drizzle grenadine for a sunrise effect.",
  ),
  Recipe(
    id: 7,
    title: "Mai Tai",
    rate: 4.6,
    description: "A tropical rum cocktail.",
    ingredients: """
    1. 40ml Dark Rum
    2. 20ml Lime Juice
    3. 15ml Orange Liqueur
    4. 10ml Almond Syrup""",
    preparation:
        "Shake all ingredients with ice and strain into a glass. Garnish with mint.",
  ),
  Recipe(
    id: 10,
    title: "Long Island Iced Tea",
    rate: 4.5,
    description: "A strong and refreshing cocktail.",
    ingredients: """
    1. 20ml Vodka
    2. 20ml Tequila
    3. 20ml White Rum
    4. 20ml Gin
    5. 20ml Triple Sec
    6. Cola""",
    preparation:
        "Mix all spirits with ice. Top with cola and serve with a lemon wedge.",
  ),
  Recipe(
    id: 10,
    title: "Screwdriver",
    rate: 4.2,
    description: "A simple vodka and orange juice drink.",
    ingredients: """
    1. 50ml Vodka
    2. 100ml Orange Juice""",
    preparation: "Pour vodka over ice and top with orange juice.",
  ),
  Recipe(
    id: 8,
    title: "Caipirinha",
    rate: 4.6,
    description: "A Brazilian lime and sugar cocktail.",
    ingredients: """
    1. 50ml Cachaça
    2. 1 Lime (cut into wedges)
    3. 2 tsp Sugar""",
    preparation: "Muddle lime with sugar. Add cachaça and ice. Stir well.",
  ),
  Recipe(
    id: 5,
    title: "Manhattan",
    rate: 4.7,
    description: "A classic whiskey cocktail.",
    ingredients: """
    1. 50ml Rye Whiskey
    2. 20ml Sweet Vermouth
    3. 2 Dashes Bitters""",
    preparation:
        "Stir ingredients with ice. Strain into a glass and garnish with a cherry.",
  ),
  Recipe(
    id: 3,
    title: "Aperol Spritz",
    rate: 4.5,
    description: "A light and bubbly aperitif.",
    ingredients: """
    1. 50ml Aperol
    2. 75ml Prosecco
    3. Soda Water""",
    preparation: "Mix Aperol and Prosecco over ice. Top with soda water.",
  ),
  Recipe(
    id: 10,
    title: "Cuba Libre",
    rate: 4.4,
    description: "A rum and cola cocktail.",
    ingredients: """
    1. 50ml White Rum
    2. 100ml Cola
    3. Lime Wedge""",
    preparation: "Pour rum over ice. Top with cola and garnish with lime.",
  ),
];
