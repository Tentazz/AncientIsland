using UnityEngine;

[System.Serializable]
public class WordData {
    //public string word;              // The fictional word
    public string playerGuess;       // What the player thinks it means
    //public Sprite icon;              // Associated sprite
    //public string TextMeshProKey;        // Optional extra text
    public bool isDiscovered;        // Has the player unlocked it?
}
