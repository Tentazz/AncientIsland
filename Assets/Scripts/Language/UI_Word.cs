using TMPro;
using UnityEngine;

public class UI_Word : MonoBehaviour
{
    public GameObject readingUI;
    public WordScriptableObject wordScriptableObject;
    [SerializeField] TextMeshProUGUI textUI;
    [SerializeField] TextMeshProUGUI aboveTextUI;


    private void OnEnable() {
        //WordLibrary.instance.DiscoverWord(wordScriptableObject.word);
    }

    public void SetWord(WordScriptableObject wordScriptable) {
        wordScriptableObject = wordScriptable; //assign the word scriptable object
        WordLibrary.instance.DiscoverWord(wordScriptableObject.word); //notify the word library that this word has been discovered
        textUI.text = wordScriptableObject.CustomFontAssociatedKey; //setup the visual representation of the word

        UpdateGuessUI();
    }

    public void UpdateGuessUI() {
        WordData wordData = WordLibrary.instance.GetWord(wordScriptableObject.word);//get the word data from the word library
        aboveTextUI.text = wordData.playerGuess;//set the above text to the player's guess
    }

    public void changeGuess(string newGuess) {
        WordLibrary.instance.UpdateGuessForWord(wordScriptableObject.word, newGuess);
        UpdateGuessUI();
        readingUI.BroadcastMessage("UpdateGuessUI");
    }


}
