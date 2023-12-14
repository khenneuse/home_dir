/*
You are running a classroom and suspect that some of your students are passing around the answer to a multiple-choice question disguised as a random note.

Your task is to write a function that, given a list of words and a note, finds and returns the word in the list that is scrambled inside the note, if any exists. If none exist, it returns the result "-" as a string. There will be at most one matching word. The letters don't need to be in order or next to each other. The letters cannot be reused.

Example:
words = ["baby", "referee", "cat", "dada", "dog", "bird", "ax", "baz"]
note1 = "ctay"
find(words, note1) => "cat"   (the letters do not have to be in order)

note2 = "bcanihjsrrrferet"
find(words, note2) => "cat"   (the letters do not have to be together)

note3 = "tbaykkjlga"
find(words, note3) => "-"     (the letters cannot be reused)

note4 = "bbbblkkjbaby"
find(words, note4) => "baby"

note5 = "dad"
find(words, note5) => "-"

note6 = "breadmaking"
find(words, note6) => "bird"

note7 = "dadaa"
find(words, note7) => "dada"

All Test Cases:
find(words, note1) -> "cat"
find(words, note2) -> "cat"
find(words, note3) -> "-"
find(words, note4) -> "baby"
find(words, note5) -> "-"
find(words, note6) -> "bird"
find(words, note7) -> "dada"

Complexity analysis variables:

W = number of words in `words`
S = maximal length of each word or of the note
*/

"use strict";
const words = ["baby", "referee", "cat", "dada", "dog", "bird", "ax", "baz"];
const note1 = "ctay";
const note2 = "bcanihjsrrrferet";
const note3 = "tbaykkjlga";
const note4 = "bbbblkkjbaby";
const note5 = "dad";
const note6 = "breadmaking";
const note7 = "dadaa";


function expect(actual, expected) {
  if (actual === expected) {
    console.log("SUCCCESS");
    return;
  }
  console.log(`actual ${actual} expected ${expected}`);
  console.log("FAIL");
}


// For each word in the words array call it `word`
//   for each letter in `word` walk the note to find that letter
//     if letter found, remove from note
//     else
//.      break
//
// if

function find(words, note) {
  for (let wordIndex= 0; wordIndex < words.length; wordIndex++) {
    const word = words[wordIndex];
    let partialNote = note;
    let succeeded = true;
    for (let index = 0; index < word.length; index++) {
      const letter = word[index];

      if (partialNote.includes(letter)) {
        partialNote = partialNote.replace(letter, "");
      } else {
        succeeded = false;
        break;
      }
    }
    if (succeeded) {
      return word;
    }
  }
  return "-";
}

expect(find(words, note1), "cat");
expect(find(words, note2), "cat");
expect(find(words, note3),"-");
expect(find(words, note4), "baby");
expect(find(words, note5), "-");
expect(find(words, note6), "bird");
expect(find(words, note7), "dada");
