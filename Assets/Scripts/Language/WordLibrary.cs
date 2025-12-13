using System.Collections.Generic;
using UnityEngine;

public class WordLibrary : MonoBehaviour {
    // This LIST is visible and editable in the Unity Inspector
    public List<WordEntry> wordList = new List<WordEntry>();

    // This DICTIONARY is built at runtime (not visible in inspector)
    private Dictionary<string, WordData> wordDictionary;

    private void Awake() {
        BuildDictionary();
    }

    private void BuildDictionary() {
        wordDictionary = new Dictionary<string, WordData>();

        foreach (var entry in wordList) {
            if (entry != null && !string.IsNullOrEmpty(entry.key)) {
                if (!wordDictionary.ContainsKey(entry.key))
                    wordDictionary.Add(entry.key, entry.data);
                else
                    Debug.LogWarning("Duplicate key in WordLibrary: " + entry.key);
            }
        }
    }

    public WordData GetWord(string word) {
        if (wordDictionary.TryGetValue(word, out WordData data))
            return data;

        Debug.LogWarning("Word not found: " + word);
        return null;
    }
}
