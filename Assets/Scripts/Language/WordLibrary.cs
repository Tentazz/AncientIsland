using Language.Lua;
using System.Collections.Generic;
using UnityEngine;
using static UnityEngine.EventSystems.EventTrigger;

public class WordLibrary : MonoBehaviour {

    public static WordLibrary instance { get; private set; }// Singleton instance

    // This LIST is visible and editable in the Unity Inspector
    public List<WordEntry> wordList = new List<WordEntry>();

    // This DICTIONARY is built at runtime (not visible in inspector)
    private Dictionary<string, WordData> wordDictionary;

    private void Awake() {
        if (instance != null && instance != this) { // Ensure singleton uniqueness
            Destroy(this);
        }
        else {
            instance = this; // Assign singleton instance
        }
        BuildDictionary();
    }

    public void BuildDictionary() {
        wordDictionary = new Dictionary<string, WordData>(); // Initialize the dictionary   

        foreach (var entry in wordList) {
            if (entry != null && !string.IsNullOrEmpty(entry.key)) { // Validate entry
                if (!wordDictionary.ContainsKey(entry.key))  
                    wordDictionary.Add(entry.key, entry.data);
                else
                    Debug.LogWarning("Duplicate key in WordLibrary: " + entry.key);
            }
        }
    }

    public WordData GetWord(string word) { // Retrieve WordData by word string
        if (wordDictionary.TryGetValue(word, out WordData data))
            return data; 

        Debug.LogWarning("Word not found: " + word);
        return null;
    }

    public void UpdateGuessForWord (string wordName, string newGuess){
        print ("wordLibrary - Update guess for " + GetWord(wordName));
        if (wordDictionary.TryGetValue(wordName, out WordData data))
            data.playerGuess = newGuess;
    }

    public void DiscoverWord (string wordName) {

        if (!wordDictionary.ContainsKey(wordName))
            wordDictionary.Add(wordName, new WordData());
            print("WordLibrary - Discovering word: " + wordName);
    }


}
