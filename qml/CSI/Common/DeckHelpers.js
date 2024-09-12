/**
 * Possible colors:
 * Color.DarkOrange
 * Color.Mint
 * Color.Yellow
 * Color.Lime
 * Color.Green
 * Color.Mint
 * Color.Cyan
 * Color.Turquoise
 * Color.Plum
 * Color.Violet
 * Color.Purple
 * Color.Magenta
 * Color.Fuchsia
 * Color.WarmYellow
 * Color.Black
 * Color.White
 * Color.Red
 * 
 * Source: https://www.youtube.com/watch?v=_sti1yfWAqE
 */

// Returns a color for the specified Deck index
function colorForDeck(deckIdx)
{
    switch (deckIdx)
    {
      case 1:
      case 2:
        return Color.White;
      case 3:
        return Color.Fuchsia;
      case 4:
        return Color.Red;
    }

    // Fall-through...
    return Color.Black;
}

// primary decks defualt to track, secondary decks default to remix
function defaultTypeForDeck(deckIdx)
{
    return (deckIdx > 2) ? DeckType.Remix : DeckType.Track
}

function deckTypeSupportsGridAdjust(deckType)
{
    return deckType == DeckType.Track || deckType == DeckType.Stem;
}

function linkedDeckIdx(deckIdx)
{
    switch (deckIdx)
    {
    // Deck A and C are linked
    case 0: return 2;
    case 2: return 0;
    // Deck B and D are linked
    case 1: return 3;
    case 3: return 1;
    }
}
