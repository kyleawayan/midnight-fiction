const keyNumberToString = {
  0: "C",
  1: "Db",
  2: "D",
  3: "Eb",
  4: "E",
  5: "F",
  6: "Gb",
  7: "G",
  8: "Ab",
  9: "A",
  10: "Bb",
  11: "B",
  12: "Cm",
  13: "Dbm",
  14: "Dm",
  15: "Ebm",
  16: "Em",
  17: "Fm",
  18: "Gbm",
  19: "Gm",
  20: "Abm",
  21: "Am",
  22: "Bbm",
  23: "Bm",
};

// Function to calculate harmonic keys considering the circle of fifths and relative minors/majors
function calculateHarmonicKeys(key) {
  const isMinor = key >= 12;
  const rootNote = key % 12;

  let closestHarmonic;
  let possibleKeys = [];

  if (isMinor) {
    // For minor keys
    // Relative Major
    const relativeMajor = (rootNote + 3) % 12;
    // Dominant Minor (v)
    const dominantMinor = ((rootNote + 7) % 12) + 12;
    // Subdominant Minor (iv)
    const subdominantMinor = ((rootNote + 5) % 12) + 12;

    // Prioritize: Relative Major > Dominant Minor > Subdominant Minor
    possibleKeys = [relativeMajor, dominantMinor, subdominantMinor];

    // Set the closest harmonic key
    closestHarmonic = possibleKeys[0];
  } else {
    // For major keys
    // Relative Minor
    const relativeMinor = ((rootNote + 9) % 12) + 12;
    // Dominant Major (V)
    const dominantMajor = (rootNote + 7) % 12;
    // Subdominant Major (IV)
    const subdominantMajor = (rootNote + 5) % 12;

    // Prioritize: Relative Minor > Dominant Major > Subdominant Major
    possibleKeys = [relativeMinor, dominantMajor, subdominantMajor];

    // Set the closest harmonic key
    closestHarmonic = possibleKeys[0];
  }

  // Prepare detailed results
  const harmonicKeys = possibleKeys.map((k) => keyNumberToString[k]);

  return {
    closestHarmonic: {
      keyNumber: closestHarmonic,
      keyName: keyNumberToString[closestHarmonic],
    },
    harmonicKeys,
  };
}
