using TMPro;
using UnityEngine;

public class Panneau : MonoBehaviour
{
    public string PanneauText;
    public string PanneauCustomKeys;
    public GameObject ReadingUI;
    [SerializeField] TextMeshProUGUI textPhysical;
    [SerializeField] TextMeshProUGUI textUI;


    [SerializeField] private WordScriptableObject[] WordScriptableObjects;
    

    void Start()
    {
        UpdateText();
    }


    public void Interact() {
        ReadingUI.SetActive(true);
        textUI.text = PanneauCustomKeys;
        Debug.Log("Interacting with Panneau");
    }

    public void UpdateText() {
        // Crée un tableau de tous les mots
        string[] words = new string[WordScriptableObjects.Length];
        for (int i = 0; i < WordScriptableObjects.Length; i++) {
            words[i] = WordScriptableObjects[i].word;
        }
        // Concatène tous les mots avec un espace entre eux
        PanneauText = string.Join(" ", words);

        // Même principe pour les CustomFontAssociatedKey si besoin
        string[] keys = new string[WordScriptableObjects.Length];
        for (int i = 0; i < WordScriptableObjects.Length; i++) {
            keys[i] = WordScriptableObjects[i].CustomFontAssociatedKey;
        }
        PanneauCustomKeys = string.Join("", keys);
        textPhysical.text = PanneauCustomKeys;
    }


}
