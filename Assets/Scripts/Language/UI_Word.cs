using TMPro;
using UnityEngine;

public class UI_Word : MonoBehaviour
{

    public WordScriptableObject wordScriptableObject;
    [SerializeField] TextMeshProUGUI textUI;
    [SerializeField] TextMeshProUGUI aboveTextUI;

    public void SetWord(WordScriptableObject word) {
        wordScriptableObject = word;
        textUI.text = wordScriptableObject.CustomFontAssociatedKey;
        aboveTextUI.text = wordScriptableObject.word;
    }

    public void changeGuess(string newGuess) {
        aboveTextUI.text = newGuess;
    }


}
